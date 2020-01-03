class ArticlesController < ApplicationController
  before_action :find_project

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
      # show は未作成のため index を表示する
      # redirect_to({ :action => 'show', :id => @article.id, :project_id => @project })
      redirect_to({ :action => 'index', :project_id => @project })
    else
      render(:action => 'new')
    end
  end

private
  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
