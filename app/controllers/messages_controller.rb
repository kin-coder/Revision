class MessagesController < ApplicationController
  def index
    @toutmessage = Message.all
    
  end

  def show

    @message = Message.find(params[:id])
  
  end

  def new

    @new_message = Message.new

  end

  def create
    params_message = params.require(:message).permit(:title, :content, :user_id)
    Message.create!(params_message)
    redirect_to new_message_path, success:" Message envoyer!"

  end

  def edit

    @edit_message = Message.find(params[:id])

  end

  def update

    @update_message = Message.find(params[:id])
    params_message = params.require(:message).permit(:title, :content, :user_id)
    @update_message.update(params_message)
    
    redirect_to home_path, success:" Message modifié!"

  end

  def destroy

    @message_supprime = Message.find(params[:id])
    @message_supprime.destroy
    redirect_to home_path, success:" Message supprimé!" 

  end



  def message_prive
    session[:user_id] = Message.where(user_id: current_user.id)
    
    redirect_to home_path

  
  end

end
