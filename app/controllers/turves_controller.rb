class TurvesController < ApplicationController
  before_action :get_campaign_and_faction
  before_action :set_system, only: %i[ show edit update destroy ]
  before_action :set_turf, only: %i[ show edit update destroy ]

  # GET /turves or /turves.json
  def index
    @turves = @faction.turves
  end

  # GET /turves/1 or /turves/1.json
  def show
  end

  # GET /turves/new
  def new
    @turf = @faction.turves.new
  end

  # GET /turves/1/edit
  def edit
  end

  # POST /turves or /turves.json
  def create
    @turf = @faction.turves.new(turf_params)

    respond_to do |format|
      if @turf.save
        format.html { redirect_to campaign_faction_turves_path(@campaign, @faction), notice: "Turf was successfully created." }
        format.json { render :show, status: :created, location: @turf }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @turf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turves/1 or /turves/1.json
  def update
    respond_to do |format|
      if @turf.update(turf_params)
        format.html { redirect_to campaign_faction_turves_path(@campaign, @faction), notice: "Turf was successfully updated." }
        format.json { render :show, status: :ok, location: @turf }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @turf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turves/1 or /turves/1.json
  def destroy
    @turf.destroy
    respond_to do |format|
      format.html { redirect_to campaign_faction_turves_path(@campaign, @faction), notice: "Turf was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_campaign_and_faction
      @campaign = Campaign.find(params[:campaign_id])
      @faction = @campaign.factions.find(params[:faction_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_system
      @system = @campaign.systems.find(params[:system_id])
    end

    def set_turf
      @turf = @campaign.turves.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def turf_params
      params.require(:turf).permit(:campaign_id, :system_id, :faction_id, :description)
    end
end
