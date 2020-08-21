class UsersController < ApplicationController

    before_action :authenticate_user!, only: [:home]
    before_action :check_admin, only: [:home]

    def index

        if params[:id]  
            @unic = User.find(params[:id])
        end
        @mail = User.all


        
    end

    def show
        @unique = User.find(params[:id])
    end

    def home

        if params[:id]
        @seul = User.find(params[:id])

        
        end
    end

    private
    def check_admin
        if current_user.is_admin == true
            flash[:info] = "Compte accepté"
             
        else
            redirect_to root_path, warning:" Compte en attente de validation!"
        end
    end
end
