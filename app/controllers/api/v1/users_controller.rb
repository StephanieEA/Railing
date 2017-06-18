module Api
  module V1
    class UsersController < BaseApiController
      authorize_resource
      respond_to :json

      def index
        render :json => User.all
      end

      def show
        @user = User.find(params[:id])
        respond_with(@user)
        puts 'user: #{@user}'
      end

      def create
        @user = User.new(user_params)

        if @user.save
          respond_with @user do |format|
            format.json { render json: @user, status: :created }
          end
        else
          respond_with_errors(@user)
        end
      end

      def update
        @user = User.find(params[:id])
        new_role = params[:roles_mask]

        if new_role
          # binding.pry
          @user.update_attributes(roles_mask: new_role)
          respond_with(@user)
        else
          if @user.update_attributes(user_params)
            respond_with(@user)
          else
            respond_with_errors(@user)
          end
        end
      end

      def destroy
        user = User.find(params[:id])

        if user.destroy
          render json: {}, status: 204
        else
          render json: {}, status: 500
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email,
                                     :password, :password_confirmation)
      end
    end
  end
end
