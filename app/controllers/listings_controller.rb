class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :check_profile, only: [:new]
  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.search(params[:term])
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @profile = Profile.where(user_id: @listing.user_id)[0]
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.status = "available"
    @listing.user = current_user
    @listing.title = @listing.title.downcase
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :description, :price, :image, :status)
    end

    def check_profile
      profile_to_check = Profile.find(current_user.id)
      has_details = true
      flash[:notice] = ""
      if profile_to_check.user_name == nil
        has_details = false
        flash[:notice] << "Username required to make a listing. "
      end
      if profile_to_check.phone == nil
        has_details = false
        flash[:notice] << "Phone number required to make a listing. "
      end
      if profile_to_check.postcode == nil
        has_details = false
        flash[:notice] << "Postcode required to make a listing. "
      end
      if has_details == false
        redirect_to edit_profile_path(profile_to_check)
      else
        flash[:notice] = nil
      end
    end
end
