class Settings::BaseController < AuthorizedController

  before_filter do
    add_breadcrumb_home
    add_breadcrumb('設定', edit_settings_profiles_path)
  end

end
