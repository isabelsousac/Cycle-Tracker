require 'date'

class CyclesController < ApplicationController
    before_action :current_user

    def create
        cycle_fields = cycle_params
        period_start = calculate_period_start(cycle_fields[:period_end], cycle_fields[:average_days_period])
        cycle_fields[:period_start] = period_start
    end

    private

    def cycle_params
        params.require(:cycle).permit(:period_end, :average_period_days, :user_id) #average period needs to be included on the database
    end

    def calculate_period_start(period_end, average_days_period)
        end_date = period_end.to_datetime
        start_date = end_date - average_days_period.days
    end
end

# resources :cycle, :only => [:show, :create, :update]
# POST /cycle
# Authorization: Bearer <token>

# {
#     "last_period_date": <date>,
#     "period_average_time": <integer>,
#     "take_pill": <boolean>,
#     "notification_on": <boolean>
# }


# create_table "cycles", force: :cascade do |t|
#     t.date "start_date"  SAME AS PERIOD START
#     t.date "end_date" 
#     t.integer "user_id" ---
#     t.datetime "created_at", null: false 
#     t.datetime "updated_at", null: false
#     t.date "period_start" ----
#     t.date "period_end" ----
#     t.string "period_flow"
#     t.integer "average_period_days" ---
#   end