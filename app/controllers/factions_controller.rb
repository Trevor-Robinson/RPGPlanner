class FactionsController < ApplicationController
  before_action :get_campaign
  before_action :set_faction, only: %i[ show edit update destroy ]

  # GET /factions or /factions.json
  def index
    @factions = @campaign.factions
  end

  # GET /factions/1 or /factions/1.json
  def show
  end

  # GET /factions/new
  def new
    @faction = @campaign.factions.new
  end

  # GET /factions/1/edit
  def edit
  end

  # POST /factions or /factions.json
  def create
    @faction = @campaign.factions.new(faction_params)

    respond_to do |format|
      if @faction.save
        format.html { redirect_to campaign_factions_path(@campaign), notice: "Faction was successfully created." }
        format.json { render :show, status: :created, location: @faction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @faction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factions/1 or /factions/1.json
  def update
    respond_to do |format|
      if @faction.update(faction_params)
        format.html { redirect_to campaign_factions_path(@campaign), notice: "Faction was successfully updated." }
        format.json { render :show, status: :ok, location: @faction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @faction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factions/1 or /factions/1.json
  def destroy
    @faction.destroy
    respond_to do |format|
      format.html { redirect_to campaign_factions_path(@campaign), notice: "Faction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_faction
      @faction = @campaign.factions.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def faction_params
      params.require(:faction).permit(:name, :faction_type, :tier, :goal, :description, :notable_assets, :qirks, :situation, :campaign_id)
    end
end
