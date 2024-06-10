class FriendsController < ApplicationController
  def create

    @friend = Friend.new(friend_params)
    @friend.user_1_id = current_user.id
    if @friend.save
      flash[:notice] = "Friend added successfully."
    else
      flash[:alert] = "Unable to add friend."
    end

    redirect_to user_dashboard_path # Adjust this to your desired redirect path
  end

  def destroy
    friend = Friend.find(params[:id])

    if friend.user_1 == current_user || friend.user_2 == current_user
      if friend.destroy
        flash[:notice] = "Friend removed successfully."
      else
        flash[:alert] = "Unable to remove friend."
      end
    else
      flash[:alert] = "You are not authorized to perform this action."
    end

    redirect_to user_dashboard_path
  end

private

def friend_params
  params.require(:friend).permit(:user_2_id)
end

end
