# include PluginTest01SettingsHelper

module PluginTest01
  class Hooks < Redmine::Hook::ViewListener
    # 参考: https://qiita.com/cat-in-136/items/97dffdeb76f6a50ec4c8

    # 1つのクラスに複数の同一名の render_on があると最後に呼び出されたものしか適用されない
    # 実行されない
    render_on :view_layouts_base_html_head,
      :inline => '<p style="color: #3a3">view_layouts_base_html_head</p>'

    # 実行される
    render_on :view_layouts_base_html_head,
      :inline => '<p style="color: #a33">view_layouts_base_html_head</p>'

    # 異なる名前の render_on は適切に実行される
    render_on :view_layouts_base_body_top,
      :inline => '<p style="color: #3a3">view_layouts_base_body_top</p>'

    # external style sheet (./assets/stylesheets/example.css) version
    render_on :view_layouts_base_sidebar,
      :inline => "<%= stylesheet_link_tag 'example', :plugin => :plugin_test01 %>"

    # callback method version
    # 動的に内容を変化させる場合に使えそう
    def view_layouts_base_content(context={ })
      # flg_hook_test = plugin_test01_settings_value(:flg_hook_test)
      flg_hook_test = true
      if flg_hook_test
        context[:controller].send(:render_to_string, {
          # :partial => "hooks/my_plugin/view_issues_form_details_bottom",
          :inline => '<p style="color: #a33">view_layouts_base_content</p>',
          :locals => context
        })
      end
    end

    # subtask like hook
    render_on :view_issues_show_description_bottom,
      :partial => '/hooks/plugin_test01/view_issues_show_description_bottom'
  end
end