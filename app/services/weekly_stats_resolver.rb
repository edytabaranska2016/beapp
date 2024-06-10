class WeeklyStatsResolver
  # extend Concerns::Performable

  def perform
    # { sdsds: "fsdfsd" }.to_h
      # { total_price: calculated_total_price }.to_h
      { 
        total_distance: calculated_total_distance,
        total_price: calculated_total_price 
       }.to_h
  end

  private

  def current_week_trips_scope
    Trip.all
    # Trip.where(date: week_days_range)
  end

  def week_days_range
    Date.today.beginning_of_week..Date.today.end_of_week
  end

  # def trip_location(address)
  #   Location.find_by(address: address)
  # end

  def calculated_total_distance
    total_distance = 0
    current_week_trips_scope.each do |trip|
      geocoded_distance = ::DistanceResolver.new(trip).perform
      total_distance += geocoded_distance
    end

    return total_distance
  end

  def calculated_total_price
    total_price = 0

    current_week_trips_scope.each do |trip|
      total_price += trip.price
    end

    return total_price
  end
end
