require 'rails_helper'
require './app/controllers/posts_controller'

RSpec.describe PostsController do
  describe 'GET index' do
    it 'assigns @posts' do
      profile = Profile.create
      post = Post.create(profile: profile)
      get :index
      expect(assigns(:posts)).to eq([post])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end