module Api
  class TripsController < ApplicationController
    def index
      @trips = Trip.all
      render json: @trips
    end

    def create
      @trip = Trip.new(trip_params)
      if @trip.save
        update_distance_from_coordinates unless trip_params.include?(:distance)
        render json: @trip
      else
        render json: @trip.errors, status: :unprocessable_entity
      end
    end

    private

    def trip_params
      params.permit(:start_address, :destination_address, :price, :date, :distance)
    end

    def create_start_address_location
      Location.create(address: trip_params[:start_address])
    end

    def create_destination_address_location
      Location.create(address: trip_params[:destination_address])
    end

    def calculated_distance
      ::DistanceResolver.new(@trip).perform
    end

    def update_distance_from_coordinates
      create_start_address_location
      create_destination_address_location
      @trip.update(distance: calculated_distance)
    end
  end
end
