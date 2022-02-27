class SalonsController < ApplicationController
  before_action :set_salon, only: %i[ show edit update destroy ]

  # GET /salons or /salons.json
  def index
    @salons = Salon.all
  end

  # GET /salons/1 or /salons/1.json
  def show
  end

  # GET /salons/new
  def new
    @salon = Salon.new
  end

  # GET /salons/1/edit
  def edit
  end

  # POST /salons or /salons.json
  def create
    @salon = Salon.new(salon_params)

    respond_to do |format|
      if @salon.save
        format.html { redirect_to salon_url(@salon), notice: "Salon was successfully created." }
        format.json { render :show, status: :created, location: @salon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @salon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salons/1 or /salons/1.json
  def update
    respond_to do |format|
      if @salon.update(salon_params)
        format.html { redirect_to salon_url(@salon), notice: "Salon was successfully updated." }
        format.json { render :show, status: :ok, location: @salon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @salon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salons/1 or /salons/1.json
  def destroy
    @salon.destroy

    respond_to do |format|
      format.html { redirect_to salons_url, notice: "Salon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salon
      @salon = Salon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def salon_params
      params.require(:salon).permit(:company_name, :gstin, :pan_number, :address, :chairs_counter, :opening, :closing)
    end
end
