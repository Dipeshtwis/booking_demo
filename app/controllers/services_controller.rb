class ServicesController < ApplicationController
  def index
    @salon = Salon.find_by(id: params[:salon_id])
    @services = @salon.services.all
  end

  def new
    @service = Service.new
  end

  def create
    @salon = Salon.find_by(id: params[:salon_id])
    @service = @salon.services.create(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to salon_services_path, notice: "Service was successfully created." }
        format.json { render :index, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @salon = Salon.find_by(id: params[:salon_id])
    @service = @salon.services.find_by(id: params[:id])
    @appointments = @service.appointments.all
  end

  private
  
  def service_params
    params.require(:service).permit(:name, :cost, :time_taken)
  end
end
