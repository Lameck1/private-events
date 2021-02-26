require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_user_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      user = create(:user)
      get user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  context 'with valid parameters' do
    it 'can create a new user' do
      expect do
        post users_path, params: { user: { username: 'Ken' } }
      end.to change(User, :count).by(1)
    end
  end

  context 'with invalid parameters' do
    it 'will not create a new user' do
      expect do
        post users_path, params: { user: { name: 'Judith' } }
      end.to change(User, :count).by(0)
    end
  end
end
