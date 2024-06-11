module Api
  class TripsController < ApplicationController
    def index
      @trips = Trip.all
      render json: @trips
    end

    def create
      @trip = Trip.new(trip_params)
      if @trip.save
          create_start_address_location
          create_destination_address_location
          render json: @trip
      else
        render json: @trip.errors, status: :unprocessable_entity
      end
    end

    private

    def trip_params
      params.permit(:start_address, :destination_address, :price, :date)
    end

    def create_start_address_location
      start_location = Location.create(address: trip_params[:start_address])
      start_location.save
    end

    def create_destination_address_location
      destination_location = Location.new(address: trip_params[:destination_address])
      destination_location.save
    end
  end
end
