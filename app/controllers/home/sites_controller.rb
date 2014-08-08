class Home::SitesController < AuthorizedController

  before_action :set_site, only: [:show, :edit, :update, :destroy]

  before_action do
    add_breadcrumb_home
  end

  # GET /sites
  # GET /sites.json
  def index
    @sites = current_user.sites.all
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
  end

  # GET /sites/new
  def new
    add_breadcrumb 'Site 一覧', home_sites_path
    add_breadcrumb '新規 Site'

    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = current_user.sites.new(site_params)
    @site.page.compile_body

    if params[:preview]
      render(action: :create_preview) and return
    elsif params[:back]
      render(action: :new) and return
    end

    respond_to do |format|

      @site.page.compile_body

      if @site.valid?
        @site.save!
        @site.members << current_user

        format.html { redirect_to [:home, @site], notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_preview

  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      @site.attributes = site_params
      @site.page.compile_body

      if @site.valid?
        @site.save!
        format.html { redirect_to({action: :show, id: @site}, notice: 'Site was successfully updated.') }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def preview
    @site = current_user.sites.new(site_params)
    @site.page.compile_body
  end

  def do_preview
    # params[:]
    @site = current_user.sites.new(site_params)
    @site.page.compile_body
    @site.save!
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:title, page_attributes: [:title, :body_source])
    end
end
