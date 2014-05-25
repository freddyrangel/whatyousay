require 'spec_helper'

describe "/users" do

  describe "GET '/users'" do

    let!(:users) { create_list(:user, 2) }

    before(:each) do
      get '/users', {}, { 'Accept' => Mime::JSON }
    end

    it "return list of users" do
      expected_response = User.all.map { |f| UserSerializer.new(f) }.
        to_json
      expect(response.body).to eq(expected_response)
    end

    it "should return 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "GET '/users/:id'" do

    let!(:user) { create(:user) }

    before(:each) do
      get "/users/#{user.id}", {}, { 'Accept' => Mime::JSON }
    end

    it "returns the user" do
      expected_response = UserSerializer.new(user).to_json
      expect(response.body).to eq(expected_response)
    end

    it "should return 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "POST '/users'" do

    let!(:user_params) { attributes_for(:user) }

    let(:create_request)  do
       post "/users", { user: user_params }.to_json,
         { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s } 
    end

    it "should create a new user" do
      expect { create_request }.to change(User, :count).by(1)
    end

    context 'response' do

      before(:each) { create_request }

      it "should send a status 201" do
        expect(response.status).to eq(201)
      end

      it "should send location with response" do
        returned_json = json(response.body)
        expect(response.location).to eq(user_url(returned_json[:id]))
      end
    end

    context 'invalid request' do
      
      let(:invalid_create_request) do
        post '/users',
          { user: { email: nil } }.to_json,
          { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      end

      it "should not create user" do
        expect { invalid_create_request }.to change(User, :count).by(0)
      end

      context 'response' do

        before(:each) { invalid_create_request }

        it "should send status 422" do
          expect(response.status).to eq(422)
        end

        it "should render errors" do
          expect(response.body).to include("no puede estar en blanco")
        end
      end
    end
  end

  describe "PATCH '/users/:id'" do

    let!(:user) { create(:user) }

    context 'with valid params' do

      let(:update_request) do
        patch "/users/#{user.id}",
          { user: 
            { email: "newemail@example.com",
              user_name: user.user_name,
              first_name: user.first_name,
              last_name: user.last_name } 
        }.to_json,
          { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      end

      before(:each) { update_request }

      it "should return 200" do
        expect(response.status).to eq(200)
      end

      it "should update email" do
        expect(user.reload.email).to eq("newemail@example.com")
      end
    end

    context 'invalid params' do

      let(:invalid_update_request) do
        patch "/users/#{user.id}",
          { user: 
            { email: nil,
              user_name: user.user_name,
              first_name: user.first_name,
              last_name: user.last_name } 
        }.to_json,
          { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      end

      before(:each) { invalid_update_request }

      it "should return status 422" do
        expect(response.status).to eq(422)
      end

      it "should render errors" do
        expect(response.body).to include("no puede estar en blanco")
      end
    end
  end

  describe "DELETE '/users/:id'" do

    let!(:user) { create(:user) }

    let(:destroy_request) do
      delete "users/#{user.id}"
    end

    it "should destroy the user" do
      expect { destroy_request }.to change(User, :count).by(-1)
    end

    it "should return status 204" do
      destroy_request
      expect(response.status).to eq(204)
    end
  end
end
