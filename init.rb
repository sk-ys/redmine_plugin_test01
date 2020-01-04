require_dependency 'plugin_test01/hooks'

Redmine::Plugin.register :plugin_test01 do
  name 'PluginTest01_Knowledgebase'
  author 'Alex Bevilacqua, sk-ys'
  description 'a knowledgebase plugin'
  version '0.0.1'
  url 'https://github.com/alexbevi/redmine_knowledgebase'
  author_url 'http://www.alexbevi.com'

  requires_redmine :version_or_higher => '2.0.0'

  settings :default => {
    :sort_category_tree => true,
    :show_category_totals => true,
    :summary_limit => 5,
    :disable_article_summaries => false
  }, :partial => 'settings/knowledgebase_settings'

  menu :project_menu,
    :articles,
    { :controller => 'articles', :action => 'index' },
    :caption => :knowledgebase_title,
    :after => :activity,
    :param => :project_id

  # project_module :knowledgebase do
  project_module :plugin_test01 do
    permission :view_articles, {
      :knowledgebase => :index,
      # :articles      => [:show, :tagged],
      :articles      => [:index, :show, :tagged],
      :categories    => [:index, :show]
    }
    permission :comment_and_rate_articles, {
      :knowledgebase => :index,
      :articles      => [:show, :tagged, :rate, :comment, :add_comment],
      :categories    => [:index, :show]
    }
    permission :create_articles, {
      :knowledgebase => :index,
      :articles      => [:show, :tagged, :new, :create, :add_attachment, :preview],
      :categories    => [:index, :show]
    }
    permission :edit_articles, {
      :knowledgebase => :index,
      :articles      => [:show, :tagged, :edit, :update, :add_attachment, :preview],
      :categories    => [:index, :show]
    }
    permission :manage_articles, {
      :knowledgebase => :index,
      :articles      => [:show, :new, :create, :edit, :update, :destroy, :add_attachment,
                         :preview, :comment, :add_comment, :destroy_comment, :tagged],
      :categories    => [:index, :show]
    }
    permission :manage_articles_comments, {
      :knowledgebase => :index,
      :articles      => [:show, :comment, :add_comment, :destroy_comment],
      :categories    => [:index, :show]
    }
    permission :create_article_categories, {
      :knowledgebase => :index,
      :categories    => [:index, :show, :new, :create]
    }
    permission :manage_article_categories, {
      :knowledgebase => :index,
      :categories    => [:index, :show, :new, :create, :edit, :update, :delete]
    }
  end
end
