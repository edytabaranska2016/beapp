module Api
  class TripsController < ApplicationController
    def index
      @trips = Trip.all
      render json: @trips
    end

    def create
      @trip = Trip.new(trip_params)
      @trip.save
      render json: @trip
    end

    private

    def trip_params
      params.permit(:start_address, :destination_address, :price, :date)
    end
  end
end
