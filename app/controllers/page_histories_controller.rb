class PageHistoriesController < ApplicationController
  before_action :set_page_history, only: [:show, :edit, :update, :destroy]

  # GET /page_histories
  # GET /page_histories.json
  def index
    @page_histories = PageHistory.all
  end

  # GET /page_histories/1
  # GET /page_histories/1.json
  def show
  end

  # GET /page_histories/new
  def new
    @page_history = PageHistory.new
  end

  # GET /page_histories/1/edit
  def edit
  end

  # POST /page_histories
  # POST /page_histories.json
  def create
    @page_history = PageHistory.new(page_history_params)

    respond_to do |format|
      if @page_history.save
        format.html { redirect_to @page_history, notice: 'Page history was successfully created.' }
        format.json { render :show, status: :created, location: @page_history }
      else
        format.html { render :new }
        format.json { render json: @page_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_histories/1
  # PATCH/PUT /page_histories/1.json
  def update
    respond_to do |format|
      if @page_history.update(page_history_params)
        format.html { redirect_to @page_history, notice: 'Page history was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_history }
      else
        format.html { render :edit }
        format.json { render json: @page_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_histories/1
  # DELETE /page_histories/1.json
  def destroy
    @page_history.destroy
    respond_to do |format|
      format.html { redirect_to page_histories_url, notice: 'Page history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_history
      @page_history = PageHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_history_params
      params.require(:page_history).permit(:page_id, :title, :body_source, :body)
    end
end
