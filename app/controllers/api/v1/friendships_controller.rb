class Api::V1::FriendshipsController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:destroy, :show, :create]

  def index
    user = current_user
    friendships = user.friendships
    render json: friendships, status: 200
  end

  def create
    if(User.where(login: params[:friend][:login]).exists? and current_user.friendships.where(friend_id: User.where(login:params[:friend][:login]).pluck(:id)).blank?)
      friendship = current_user.friendships.create(friend_id: User.where(login:params[:friend][:login]).last.id)
      if friendship.save
        render json: friendship, status: 201
      else
        render json: {errors: {data: ["Wystąpił błąd"]}}, status: 404
      end
    elsif(!User.where(login: params[:friend][:login]).exists?)
      render json: {errors: {data: ["Nie ma takiego użytkownika!"]}}, status: 404
    else
      render json: { errors: {credentials: ["Już dodany"] }}, status: 422
    end
  end

  def destroy

  end


end
