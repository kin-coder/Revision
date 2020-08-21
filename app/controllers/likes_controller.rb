class LikesController < ApplicationController

  before_action :already_liked?, :find_message
  before_action :find_like, only: [:destroy]


  def new
    
  end

  def create

    # @message.likes.create(user_id: current_user.id, statut: true)

    if already_liked?
        flash[:danger] = "Cannot like"
      else
        @message.likes.create(user_id: current_user.id)
    end

    redirect_to messages_path(@message)

  end

  def update
    
  end

  def destroy
    
    if !(already_liked?)
        flash[:notice] = "Cannot unlike"
      else
        @like.destroy
    end
   
    redirect_to messages_path
  end

  private
 
    def already_liked?
      Like.where(user_id: current_user.id, message_id: params[:message_id]).exists?
    end

    def find_like
        @like = @message.likes.find(params[:id])
    end
      
    def find_message
        @message = Message.find(params[:message_id])
    end
end
