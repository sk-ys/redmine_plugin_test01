module RedmineKnowledgebase
  class RedmineKnowledgebaseHookListener < Redmine::Hook::ViewListener
    # render_on :view_layouts_base_html_head, :inline => "<%= stylesheet_link_tag 'knowledgebase', :plugin => :redmine_knowledgebase %>"
    render_on :view_layouts_base_html_head, :inline => "<%= stylesheet_link_tag 'example', :plugin => :plugin_test01 %>"
  end
end