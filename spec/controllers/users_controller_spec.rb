require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do

    let!(:users) { create_list(:user, 2) }

    it "returns http success" do
      get :index, format: :json
      #expected_response = UserSerializer.new(User.all).to_json
      expected_response = User.all.map{ |f| UserSerializer.new(f) }.to_json
      expect(response.body).to eq(expected_response)
    end
  end

  describe "GET 'show'" do

    let!(:user) { create(:user) }

    it "returns http success" do
      get :show, id: user.id, format: :json 
      expected_response = UserSerializer.new(user).to_json
      expect(response.body).to eq(expected_response)
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new, format: :json
      expect(response).to be_success
    end
  end

  describe "GET 'create'" do

    let!(:user_params) { attributes_for(:user) }
    let(:create_action) { post :create, user: user_params, format: :json }

    before(:each) { puts user_params }

    it "should create a new user" do
      expect { create_action }.to change(User, :count).by(1)
    end

    it "should redirect to user" do
      create_action
      expect(response).to redirect_to user_path(User.last)
    end
  end

  describe "GET 'edit'" do

    let(:user) { create(:user) }

    it "returns http success" do
      get :edit, id: user.id, format: :json
      expect(response).to be_success
    end
  end

  describe "GET 'update'" do

    let(:user) { create(:user) }

    before(:each) do
      user.email = "foobar@example.com"
      patch :update, user: user.attributes, id: user.id, format: :json
    end

    it "should update email" do
      expect(User.find(user.id).email).to eq("foobar@example.com")
    end

    it "should redirect to user" do
      expect(response).to redirect_to user_path(user)
    end
  end

  describe "GET 'destroy'" do

    let!(:user) { create(:user) }

    let(:destroy_action) do
      delete :destroy, id: user.id, format: :json
    end

    it "should destroy the user" do
      expect { destroy_action }.to change(User, :count).by(-1)
    end

    it "should redirect to users" do
      destroy_action
      expect(response).to redirect_to users_path
    end
  end
end
