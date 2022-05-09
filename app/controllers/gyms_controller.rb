class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_not_created_response

    # GET /gyms
    def index
      gyms = Gym.all
      render json: gyms
    end
  
    # GET /gyms/:id
    def show
      gym = find_gym
      render json: gym, status: :ok
    end
  
    # POST /gyms
    def create
      gym = Gym.create!(gym_params)
      render json: gym, status: :created
    end
  
    # PATCH /gyms
    def update
      gym = find_gym
      gym.update(gym_params)
      render json: gym, status: :accepted
    end
  
    # DELETE /gyms
    def destroy
      apartment = find_gym
      apartment.destroy
      render json: {}
    end
  
    private
  
    def gym_params
      params.permit(:name, :address)
    end
  
    def find_gym
      Gym.find(params[:id])
    end
  
    def render_not_found_response
      render json: { error: "Gym not found" }, status: :not_found
    end

    def render_not_created_response
        render json: { errors: "validation errors" }, status: :unprocessable_entity
    end

end