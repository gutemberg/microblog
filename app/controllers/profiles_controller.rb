class ProfilesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_object, only: [:show, :edit, :update, :destroy]

  Klass = Profile

  def index
  end

  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_object
    @profile = Klass.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def object_params
    params.require(Klass.name.downcase).permit(:name)
  end
end
