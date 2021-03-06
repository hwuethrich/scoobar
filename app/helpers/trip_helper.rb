module TripHelper

  def trip_code_and_name(trip)
    capture_haml do
      if trip.present?
        haml_concat trip_code trip
        haml_tag :span, trip.name, class: 'trip-name'
      else
        placeholder
      end
    end
  end

  def trip_code(trip)
    capture_haml do
      if trip.present?
        style = 'background-color: %s;' % trip.color
        haml_tag :span, trip.code, class: 'label label-default trip-code', style: style
      end
    end
  end

end
