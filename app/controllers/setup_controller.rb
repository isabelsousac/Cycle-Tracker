require 'date'

class SetupController < ApplicationController
    before_action :is_authorized

    def setup_user_cycle
        cycle_fields = cycle_params

        if cycle_fields[:average_period_days] > 10
            render json: {error: "Period length sould be less than 10 days"}, status: 404
        end

        cycle_fields[:period_start] = calculate_period_start(cycle_fields[:period_end], cycle_fields[:average_period_days])
        cycle_fields[:start_date] = cycle_fields[:period_start]
        cycle_fields[:end_date] = cycle_fields[:start_date] + CYCLE_TOTAL_DAYS.days
        cycle_fields[:user_id] = @user.id
        new_cycle = Cycle.new cycle_fields

        @user.update user_params 

        if new_cycle.save
            if @user.save
                create_next_cycles(new_cycle.end_date, new_cycle.average_period_days)
                next_cycles = Cycle.select("id, period_start, period_end").where(user_id: @user.id)
                render json: next_cycles, status: 200
            else
                render json: new_cycle.errors.full_messages, status: 400    
            end
        else
            render json: new_cycle.errors.full_messages, status: 400
        end
    end

    private

    CYCLE_TOTAL_DAYS = 28

    def cycle_params
        params.permit(:period_end, :average_period_days)
    end

    def calculate_period_start(period_end, average_period_days)
        end_date = period_end.to_datetime
        start_date = end_date - average_period_days.days
    end

    def user_params
        params.permit(:notification_on, :take_pill)
    end

    def create_next_cycles(last_cycle_day_date, average_period_days)
        last_cycle_end = last_cycle_day_date
        for i in 0..12 do
            cycle_start = last_cycle_end + 1.days
            cycle_end = cycle_start + CYCLE_TOTAL_DAYS.days
            period_start = cycle_start
            period_end = cycle_start + average_period_days.days
            Cycle.create(
                :start_date => cycle_start,
                :end_date => cycle_end, 
                :period_start => period_start, 
                :period_end => period_end, 
                :average_period_days => average_period_days, 
                :user_id => @user.id
            )
            last_cycle_end = cycle_end
        end
    end
end