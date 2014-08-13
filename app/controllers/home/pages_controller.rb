class Home::PagesController < AuthorizedController

  before_action :set_site
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    add_breadcrumb(@site.title, home_site_path(@site))
    @pages = @site.pages.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    add_breadcrumb_home
    add_breadcrumb(@site.page.title, home_site_path(@site))
    add_breadcrumb(@page.title)
  end

  # GET /pages/new
  def new
    add_breadcrumb_home
    add_breadcrumb @site.page.title, home_site_path(@site)
    add_breadcrumb '新規ページ'
    @page = @site.pages.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = @site.pages.new(page_params)
    @page.compile_body

    respond_to do |format|
      if @page.save
        format.html { redirect_to [:home, @site, @page], notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      @page.assign_attributes(page_params)
      @page.compile_body
      if @page.save
        format.html { redirect_to [:home, @site, @page], notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_site
      @site = Site.find(params[:site_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:site_id, :user_id, :title, :body_source)
    end
end
