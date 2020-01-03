class ArticlesController < ApplicationController
  before_action :find_project

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new()
  end


private
  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

end
