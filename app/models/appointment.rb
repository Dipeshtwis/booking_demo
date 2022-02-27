class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :service

  before_validation :check_available_chair

  def check_available_chair
    counter = 0
    appointments = Appointment.where(service_id: service_id)
    if start_time != nil && end_time != nil
      st = start_time.to_time.strftime("%k:%M")
      et = end_time.to_time.strftime("%k:%M")
      appointments.each do |app|
        if (st >= app.start_time.to_time.strftime("%k:%M") && st <= app.end_time.to_time.strftime("%k:%M")) && (et >= app.start_time.to_time.strftime("%k:%M") && et <= app.end_time.to_time.strftime("%k:%M") )
          counter += 1
        end
      end

      salon = service.salon_id
      available_chair = Salon.find(salon).chairs_counter
      book_time = (et.to_i - st.to_i) * 60
    #   binding.pry
      if start_time.to_time.strftime("%M") != "00" && start_time.to_time.strftime("%M") != "30"
        errors.add(:appointment, 'can only start at 0th or 30th minute of the hour')
      elsif book_time > service.time_taken.to_i
        errors.add(:appointment, 'time is greater than the service time')
      elsif available_chair <= counter
        errors.add(:appointment, 'is already booked for this time ')
      end
    end
  end
end
