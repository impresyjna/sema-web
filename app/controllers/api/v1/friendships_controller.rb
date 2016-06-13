class Api::V1::FriendshipsController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:destroy, :show, :create]

  def index
    user = current_user
    friendships = user.friendships
    render json: friendships, status: 200
  end

  def create

  end

  def destroy

  end


end
