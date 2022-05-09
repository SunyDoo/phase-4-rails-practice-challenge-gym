class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_not_created_response

    
    def create
      membership = Membership.create!(membership_params)
      render json: membership, status: :created
    end
  
    
  
    private
  
    def membership_params
      params.permit(:gym_id, :client_id, :charge)
    end
  
    

    def render_not_created_response
        render json: { errors: "validation errors" }, status: :unprocessable_entity
    end

end