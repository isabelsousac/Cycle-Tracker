class CyclesController < ApplicationController
    before_action :is_authorized

    def show
        cycle = Cycle.find_by(params[:id]).select('period_start, period_end, start_date, end_date, symptoms')
        render json: cycle, status: 200
    end

    private
end