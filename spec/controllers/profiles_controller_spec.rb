require 'rails_helper'
require './app/controllers/profiles_controller'

RSpec.describe ProfilesController do
  describe 'GET index' do
    it 'assigns @profiles' do
      profile = Profile.create
      get :index
      expect(assigns(:profiles)).to eq([profile])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end