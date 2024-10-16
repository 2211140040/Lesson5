class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def create
    user = User.find_by(uid: session[:login_uid])
    tweet = user.tweets.new(message: params[:tweet][:message])
    if tweet.save
      redirect_to tweets_path, notice: "ツイートが作成されました。"
    else
      render :index
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path, notice: "ツイートが削除されました。"
  end
end
