module SimpleBreadcrumbs
  extend ActiveSupport::Concern

  included do
    before_filter do
      @breadcrumbs = []
    end
  end

  def add_breadcrumb(label, link = nil)
    @breadcrumbs << [label, link]
  end

  def add_breadcrumb_home
    add_breadcrumb('HOME', home_path)
  end

end
