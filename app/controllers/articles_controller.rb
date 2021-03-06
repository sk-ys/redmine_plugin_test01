class ArticlesController < ApplicationController
  before_action :find_project
  before_action :find_article, :except => [:index, :new, :create]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new()
  end

  def create
    params.permit!  # ←が無いと ActiveModel::ForbiddenAttributesError となる
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to({ :action => 'show', :id => @article.id, :project_id => @project })
    else
      render(:action => 'new')
    end
  end

  def show
  end

  def destroy
    @article.destroy
    redirect_to({ :action => 'index', :project_id => @project })
  end

  def edit
  end

  def update
    params.permit!  # ←が無いと ActiveModel::ForbiddenAttributesError となる
    @article.attributes = params[:article]
    if @article.save
      flash[:notice] = l(:notice_successful_update)
      redirect_to({ :action => 'show', :id => @article.id, :project_id => @project })
    end
    rescue ActiveRecord::StaleObjectError
    flash.now[:error] = l(:notice_locking_conflict)
  end

private
  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def find_article
    @article = Article.find_by_id(params[:id])
    render_404 unless @article
  end
end
