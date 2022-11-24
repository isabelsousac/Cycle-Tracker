class CyclesController < ApplicationController
    before_action :is_authorized

    def show
        cycle = Cycle.find_by(params[:id]).select('period_start, period_end, start_date, end_date, symptoms')
        render json: cycle, status: 200
    end

    def index 
        next_cycles = Cycle.select("id, period_start, period_end").where(user_id: @user.id)
        if  !next_cycles.nil?
            render json: next_cycles, status: 200
        else
            render json: next_cycles.errors.full_messages, status: 500
        end
    end

    private
end