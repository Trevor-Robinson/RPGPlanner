class SystemsController < ApplicationController
  before_action :get_campaign
  before_action :set_system, only: %i[ show edit update destroy ]

  # GET /systems or /systems.json
  def index
    @systems = @campaign.systems
  end

  # GET /systems/1 or /systems/1.json
  def show
  end

  # GET /systems/new
  def new
    @system = @campaign.systems.new
  end

  # GET /systems/1/edit
  def edit
  end

  # POST /systems or /systems.json
  def create
    @system = @campaign.systems.new(system_params)

    respond_to do |format|
      if @system.save
        format.html { redirect_to campaign_systems_path(@campaign), notice: "System was successfully created." }
        format.json { render :show, status: :created, location: @system }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /systems/1 or /systems/1.json
  def update
    heat_level = system_params[:heat].to_i

    if heat_level >= 8
      new_heat = heat_level - 8
      @system.wanted_level += 1
      params[:system][:heat] = new_heat.to_s
    end
    respond_to do |format|
      if @system.update(system_params)
        format.html { redirect_to campaign_systems_path(@campaign), notice: "System was successfully updated." }
        format.json { render :show, status: :ok, location: @system }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /systems/1 or /systems/1.json
  def destroy
    @system.destroy
    respond_to do |format|
      format.html { redirect_to campaign_systems_path(@campaign), notice: "System was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_system
      @system = @campaign.systems.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def system_params
      params.require(:system).permit(:name, :heat, :wanted_level, :campaign_id)
    end
end
