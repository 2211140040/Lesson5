class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
    user = User.find_by(uid: session[:login_uid])
    if user
      t = Tweet.new(message: params[:tweet][:message], user: user)
      if t.save
        redirect_to tweets_path
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to root_path
    end
  end


  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to tweets_path
  end
  
end
