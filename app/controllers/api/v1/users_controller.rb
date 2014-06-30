module API
  module V1
    class UsersController < ApplicationController

      def index
        users = User.all
        render json: users, status: 200
      end

      def show
        user = get_user
        render json: user, status: 200
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: user, status: 201, location: api_v1_user_url(user[:id])
        else
          render json: user.errors, status: 422
        end
      end

      def update
        user = get_user

        if user.update(user_params)
          render json: user, status: 200
        else
          render json: user.errors, status: 422
        end
      end

      def destroy
        user = get_user
        user.destroy
        head 204
      end
      
      private

      def get_user
        User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :user_name, :first_name, :last_name, :password, :password_confirmation)
      end
    end
  end
end
