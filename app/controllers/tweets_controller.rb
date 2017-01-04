class TweetsController < ApplicationController
  before_action :authenticate_user!, except:[:index]

  # GET /tweets
  def index


    # Where takes one of things:
    #   - hash where the key is the name of the field, and the value is what to match EXACTLY
    #   - a small sql snippet that would normally appear in a WHERE clause if we were writing all the sql
    #
    # We want to get to a where clause like this: "tweet like %whatevs%"
    #
    # So build that string in the ruby activerecord `where`
    @tweets = Tweet.all.order("created_at DESC").where("tweet like ?", "%#{params[:search]}%")
  end

  # GET /tweets/1
  def show
    @tweet = Tweet.find(params[:id])
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to @tweet, notice: 'Tweet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tweets/1
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end

  def star
    @tweet = Tweet.find(params[:id])
    if @tweet.stars.count == 0
      @tweet.stars.create
      redirect_to @tweet, notice: 'Tweet was star-value was changed.'
    else
      @tweet.stars.delete_all
      redirect_to @tweet, notice: 'Tweet was star-value was changed.'
    end

  end

  private
    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.require(:tweet).permit(:tweet, :user_name, :link)
    end
end
