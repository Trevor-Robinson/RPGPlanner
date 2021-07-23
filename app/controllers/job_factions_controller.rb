class JobFactionsController < ApplicationController
  before_action :get_campaign_and_job
  before_action :set_faction, only: %i[ show edit update destroy ]
  before_action :set_job_faction, only: %i[ show edit update destroy ]

  # GET /job_factions or /job_factions.json
  def index
    @job_factions = @job.job_factions
  end

  # GET /job_factions/1 or /job_factions/1.json
  def show
  end

  # GET /job_factions/new
  def new
    @job_faction = @job.job_factions.new
  end

  # GET /job_factions/1/edit
  def edit
  end

  # POST /job_factions or /job_factions.json
  def create
    @job_faction = @job.job_factions.new(job_faction_params)

    respond_to do |format|
      if @job_faction.save
        format.html { redirect_to campaign_job_job_factions_path(@campaign, @job), notice: "Job faction was successfully created." }
        format.json { render :show, status: :created, location: @job_faction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_faction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_factions/1 or /job_factions/1.json
  def update
    respond_to do |format|
      if @job_faction.update(job_faction_params)
        format.html { redirect_to campaign_job_job_factions_path(@campaign, @job), notice: "Job faction was successfully updated." }
        format.json { render :show, status: :ok, location: @job_faction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_faction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_factions/1 or /job_factions/1.json
  def destroy
    @job_faction.destroy
    respond_to do |format|
      format.html { redirect_to campaign_job_job_factions_path(@campaign, @job), notice: "Job faction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_campaign_and_job
      @campaign = Campaign.find(params[:campaign_id])
      @job = @campaign.jobs.find(params[:job_id])
    end

    def set_faction
      @faction = @campaign.factions.find(params[:faction_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_job_faction
      @job_faction = @campaign.jobfactions.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_faction_params
      params.require(:job_faction).permit(:campaign_id, :job_id, :faction_id, :note)
    end
end
