class PcsController < ApplicationController
  before_action :get_campaign
  before_action :set_pc, only: %i[ show edit update destroy ]

  # GET /pcs or /pcs.json
  def index
    @pcs = @campaign.pcs
  end

  # GET /pcs/1 or /pcs/1.json
  def show
  end

  # GET /pcs/new
  def new
    @pc = @campaign.pcs.new
  end

  # GET /pcs/1/edit
  def edit
  end

  # POST /pcs or /pcs.json
  def create
    @pc = @campaign.pcs.new(pc_params)

    respond_to do |format|
      if @pc.save
        format.html { redirect_to campaign_pcs_path(@campaign), notice: "PC was successfully created." }
        format.json { render :show, status: :created, location: @pc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pcs/1 or /pcs/1.json
  def update
    respond_to do |format|
      if @pc.update(pc_params)
        format.html { redirect_to campaign_pcs_path(@campaign), notice: "PC was successfully updated." }
        format.json { render :show, status: :ok, location: @pc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pcs/1 or /pcs/1.json
  def destroy
    @pc.destroy
    respond_to do |format|
      format.html { redirect_to campaign_pcs_path(@campaign), notice: "PC was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_pc
      @pc = @campaign.pcs.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pc_params
      params.require(:pc).permit(:name, :background, :campaign_id)
    end
end
