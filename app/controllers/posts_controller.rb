class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource
  # GET /posts
  # GET /posts.json
  def index
    if params[:order]
      # Order the posts (will change in future)
      order = params[:order]
      if order == "oldSub" 
        # Order by time submitted (oldest first)
        @posts = Post.paginate(:page => params[:page], :per_page => 10)
      elsif order == "oldEv"
        # Order by least recent event (posts can be dated according to when the event took place)
        @posts = Post.paginate(:page => params[:page], :per_page => 10).order("date_of_event DESC")
      elsif order == "newEv"
        # Order by most recent event
        @posts = Post.paginate(:page => params[:page], :per_page => 10).order("date_of_event ASC")
      end
    else
      # Order by time submitted (newest first)
      @posts = Post.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @user = current_user
    @post.user = @user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id, :date_of_event, :location, :likes, :dislikes)
    end
end
