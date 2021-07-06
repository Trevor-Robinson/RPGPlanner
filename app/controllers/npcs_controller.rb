class NpcsController < ApplicationController
  before_action :get_campaign
  before_action :set_npc, only: %i[ show edit update destroy ]

  # GET /npcs or /npcs.json
  def index
    @npcs = @campaign.npcs.all
  end

  # GET /npcs/1 or /npcs/1.json
  def show
  end

  # GET /npcs/new
  def new
    @npc = @campaign.npcs.new
  end

  # GET /npcs/1/edit
  def edit
  end

  # POST /npcs or /npcs.json
  def create
    @npc = @campaign.npcs.new(npc_params)

    respond_to do |format|
      if @npc.save
        format.html { redirect_to campaign_npcs_path(@campaign), notice: "Npc was successfully created." }
        format.json { render :show, status: :created, location: @npc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @npc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /npcs/1 or /npcs/1.json
  def update
    respond_to do |format|
      if @npc.update(npc_params)
        format.html { redirect_to campaign_npcs_path(@campaign), notice: "Npc was successfully updated." }
        format.json { render :show, status: :ok, location: @npc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @npc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /npcs/1 or /npcs/1.json
  def destroy
    @npc.destroy
    respond_to do |format|
      format.html { redirect_to campaign_npcs_path(@campaign), notice: "Npc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end

    def set_npc
      @npc =@campaign.npcs.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def npc_params
      params.require(:npc).permit(:campaign_id, :name, :description, :want, :need, :unique_feature, :trait_1, :trait_2, :trait_3)
    end
end
