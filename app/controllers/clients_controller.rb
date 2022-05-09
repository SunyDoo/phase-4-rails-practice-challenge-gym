class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_not_created_response

    # GET /clients
    def index
      clients = Client.all
      render json: clients
    end
  
    # GET /clients/:id
    def show
      client = find_client
      render json: client, serializer: TotalMembershipsSerializer, status: :ok
    end
  
   
  
    # PATCH /clients
    def update
      client = find_client
      client.update(client_params)
      render json: client, status: :accepted
    end
  
 
  
    private
  
    def client_params
      params.permit(:name, :age)
    end
  
    def find_client
      Client.find(params[:id])
    end
  
    def render_not_found_response
      render json: { error: "Client not found" }, status: :not_found
    end

    def render_not_created_response
        render json: { errors: "validation errors" }, status: :unprocessable_entity
    end

end