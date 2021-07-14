class NotablePlacesController < ApplicationController
  before_action :get_campaign_and_system
  before_action :set_notable_place, only: %i[ show edit update destroy ]

  # GET /notable_places or /notable_places.json
  def index
    @notable_places = @system.notable_places
  end

  # GET /notable_places/1 or /notable_places/1.json
  def show
  end

  # GET /notable_places/new
  def new
    @notable_place = @system.notable_places.new
  end

  # GET /notable_places/1/edit
  def edit
  end

  # POST /notable_places or /notable_places.json
  def create
    @notable_place = @system.notable_places.new(notable_place_params)

    respond_to do |format|
      if @notable_place.save
        format.html { redirect_to campaign_system_notable_places_path(@campaign, @system), notice: "Notable place was successfully created." }
        format.json { render :show, status: :created, location: @notable_place }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notable_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notable_places/1 or /notable_places/1.json
  def update
    respond_to do |format|
      if @notable_place.update(notable_place_params)
        format.html { redirect_to campaign_system_notable_places_path(@campaign, @system), notice: "Notable place was successfully updated." }
        format.json { render :show, status: :ok, location: @notable_place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notable_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notable_places/1 or /notable_places/1.json
  def destroy
    @notable_place.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to campaign_system_notable_places_path(@campaign, @system), notice: "Notable place was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_campaign_and_system
      @campaign = Campaign.find(params[:campaign_id])
      @system = @campaign.systems.find(params[:system_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_notable_place
      @notable_place = @system.notable_places.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notable_place_params
      params.require(:notable_place).permit(:campaign_id,:system_id, :name, :description, :rule, :wealth, :crime, :tech, :weird)
    end
end
