class BlogsController < CommentsController
  before_action :set_blog, only: %i[ show edit update destroy toggle_status ]
  before_action :set_sidebar_topics, except: [:update, :create, :destroy, :toggle_status]
  layout "blog"
  access all: [:show, :index], user: { except: [:destroy, :new, :create, :update, :edit, :toggle_status] }, admin: :all, testing: { except: [:destroy, :create, :update]}

  def index
    if logged_in?(:admin) || logged_in?(:testing)
      @blogs = Blog.recent.page(params[:page]).per(5)
    else
      @blogs = Blog.published.recent.page(params[:page]).per(5)
    end
    @page_title = "My Portfolio Blog"
  end

  def show
    if logged_in?(:admin) || logged_in?(:testing) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new
      @page_title = @blog.title
      @seo_keywords = @blog.body
    else redirect_to blogs_path, notice: 'You are not authorized to access this page.'
    end
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), success: "Blog was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), success: "Blog was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to root_path, status: :see_other }
    end
  end

  def toggle_status
    if @blog.draft? && logged_in?(:admin)
      @blog.published!
    elsif @blog.published? && logged_in?(:admin)
      @blog.draft!
    end
    redirect_to blogs_url, success: 'Post status has been updated.'
  end

  private

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :topic_id, :status)
  end

  def set_sidebar_topics
    @side_bar_topics = Topic.with_blogs
  end
end
