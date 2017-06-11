class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users/:id/personal_information
  def personal_information
    render json: {
      user: {
        twitter_id: "873611564548464640",
        name: "りんな",
        screen_name: "rinna0613",
        location: "東京 西国分寺",
        description: "早実/1-2/2-3/ダンス部/kis my ft2",
        geo_enabled: true,
        profile_image_url: "http://pbs.twimg.com/profile_images/873612604958048256/2TJVVeHd_normal.jpg",
        favorite_place: "東京 千代田区"
      },
      tweets: {
        unfavorable_tweets: [
          { tweet_id: "873613462005362688" }
        ],
        nomal_tweets: [
          { tweet_id: "873620782697426944" },
          { tweet_id: "873619681545822208" }
        ]
      }
    }
  end

  # GET /users/:id/unfavorable
  def unfavorable
    render json: { user: { unfavorable: true } }
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.find_by(screen_name: params[:user][:screen_name])
    if @user
      # すでに調査済みユーザなので、そのままレスポンスしちゃう
      render json: { user: { id: @user.id, screen_name: params[:user][:screen_name] } }
    else
      # params[:user]
      # @user = User.new(user_params)
      #
      # if @user.save
      #   render json: @user, status: :created, location: @user
      # else
      #   render json: @user.errors, status: :unprocessable_entity
      # end
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:twitter_id, :name, :screen_name, :location, :description, :geo_enabled, :profile_image_url, :favorite_place)
    end
end
