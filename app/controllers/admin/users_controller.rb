class Admin::UsersController < ApplicationController

    before_action :authenticate_user!, only: [:indexUsers]

    before_action :check_admin, only: [:indexUsers]

    def indexUsers 
        @users = User.all
    end

    def update
        @user = User.find(params[:id])
        @user.update(is_admin: true)
    end

    private
    def check_admin
        if current_user.is_admin == true
            flash[:info] = "Vous êtes admin"
            
        else
            redirect_to root_path, danger:" Vous n'êtes pas admin !"
        end
    end

end
