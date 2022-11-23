# [:show, :update, :create, :delete]
class SymptomsController < ApplicationController
    def create # post '/cycle/:id/symptoms' => "symptoms#create"
        new_symptom = Symptom.new symptom_params
        new_symptom[:cycle_id] = params[:id]
        if new_symptom.save
            render json: new_symptom, status: 201
        else
            render json: new_symptom.errors.full_messages, status: 400
        end
    end

    def update # put 'symptoms/:id' => "symptoms#update"
        symptom = Symptom.find_by(id: params[:id])
        symptom.update symptom_params
        if symptom.save
            render json: symptom, status: 200
        else
            render json: symptom.errors.full_messages, status: 400
        end

    end

    def show # get '/symptoms/:id' => "symptoms#show"
        symptom = Symptom.find_by(id: params[:id])
        if !symptom.nil?
            render json :symptom
        else
            render json: "Symptom not found.", status: 400
        end
    end

    def delete # delete '/symptoms/:id' => "symptoms#delete"
        symptom = Symptom.find_by(id: params[:id])
        if !symptom.nil?
            symptom.destroy
            render status: 200
        else
            render json: "Symptom not found.", status: 400
        end
    end

    private

    def symptom_params
        params.permite(:date, :symptom, :level)
    end
end

# i'm returning 400 for everything, but if i have time I'll look on better error to be returned