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
                cycle = Cycle.find_by(id: new_cycle[:id])
                render json: {
                    cycles: [
                        cycle: {
                            period_start_highlight: cycle[:period_start],
                            perid_end_highlight: cycle[:period_end]
                        }
                    ]
                }, status: 200
            else
                render json: new_cycle.errors.full_messages, status: 400    
            end
        else
            render json: new_cycle.errors.full_messages, status: 400
        end



        # user = User.find_by(id: user[:user_id])
        # user.update user_params 

        # if new_cycle.save && user.save
        #     cycle = Cycle.find_by(id: new_cycle[:id])
        #     render json: {
        #         cycles: [
        #             cycle: {
        #                 period_start_highlight: cycle[:period_start],
        #                 perid_end_highlight: cycle[:period_end]
        #             }
        #         ]
        #     }
        # else
        #     render json: {error: "Something went wrong. Please, try again."}, status: 404
        # end
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
end