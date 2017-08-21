module Api
  class PostsController < ApplicationController
    before_action :authenticate_user!, :except => [:show, :index, :search]
    before_action :set_object, only: [:update, :destroy]

    respond_to :json
    Klass = Post

    def index
      respond_with Klass.order('created_at desc').to_json(include: {profile: {include: :followers}})
    end

    def update
      if @object.update(object_params)
        respond_with :api, @object, status: :ok,
          location: send("api_#{Klass.name.downcase}_url", @object)
      else
        render json: { errors: @object.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @object.destroy
      head :ok
    end

    def follow
      follower = Follower.
        create!(profile_id: params[:profile], follower: current_user.profile)

      notify_followed(follower)

      response_with follower
    end

    def search
      query = params[:query]
      list = Klass.where('title LIKE ?', "%#{query}%").order('created_at desc')
               .to_json(include: :profile)

      respond_with list
    end

    def create
      object = Klass.new(object_params)
      object.profile = current_user.profile
      if object.save
        respond_with :api, object, status: :ok, location: send("api_#{Klass.name.downcase}s_url")
      else
        render json: { errors: object.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def object_params
      params.require(:post).permit(:title, :description)
    end

    def set_object
      @object = Klass.find(params[:id])
    end

    def sort_by
      %w(title).include?(params[:sort_by]) ? params[:sort_by] : 'title'
    end

    def order
      %w(asc desc).include?(params[:order]) ? params[:order] : 'asc'
    end

    def notify_followed(follower)
      # Aqui falta implementar envio por email de notificação ao perfil que recebeu um seguidor
    end
  end
end
