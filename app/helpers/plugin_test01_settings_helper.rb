module PluginTest01SettingsHelper
  def plugin_test01_settings_value(key)
    defaults = Redmine::Plugin::registered_plugins[:plugin_test01].settings[:default]

    value = begin
      Setting['plugin_plugin_test01'][key]
    rescue
      nil
    end

    value.blank? ? defaults[key] : value
  end
end