class SitesMembersController < ApplicationController
  before_action :set_sites_member, only: [:show, :edit, :update, :destroy]

  # GET /sites_members
  # GET /sites_members.json
  def index
    @sites_members = SitesMember.all
  end

  # GET /sites_members/1
  # GET /sites_members/1.json
  def show
  end

  # GET /sites_members/new
  def new
    @sites_member = SitesMember.new
  end

  # GET /sites_members/1/edit
  def edit
  end

  # POST /sites_members
  # POST /sites_members.json
  def create
    @sites_member = SitesMember.new(sites_member_params)

    respond_to do |format|
      if @sites_member.save
        format.html { redirect_to @sites_member, notice: 'Sites member was successfully created.' }
        format.json { render :show, status: :created, location: @sites_member }
      else
        format.html { render :new }
        format.json { render json: @sites_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites_members/1
  # PATCH/PUT /sites_members/1.json
  def update
    respond_to do |format|
      if @sites_member.update(sites_member_params)
        format.html { redirect_to @sites_member, notice: 'Sites member was successfully updated.' }
        format.json { render :show, status: :ok, location: @sites_member }
      else
        format.html { render :edit }
        format.json { render json: @sites_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites_members/1
  # DELETE /sites_members/1.json
  def destroy
    @sites_member.destroy
    respond_to do |format|
      format.html { redirect_to sites_members_url, notice: 'Sites member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sites_member
      @sites_member = SitesMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sites_member_params
      params.require(:sites_member).permit(:site_id, :user_id)
    end
end
