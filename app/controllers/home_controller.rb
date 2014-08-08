class HomeController < AuthorizedController

  def show
    @sites = current_user.sites
    @comments = [] #current_user.comments.includes(:article => :user)
  end
end
