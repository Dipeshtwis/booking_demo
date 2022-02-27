class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @appointments = current_user.appointments.all
    end
  end