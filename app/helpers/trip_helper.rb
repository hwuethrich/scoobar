module TripHelper

  def trip_code_and_name(trip)
    capture_haml do
      if trip.present?
        style = 'background-color: %s;' % trip.color
        haml_tag :span, trip.code, class: 'label label-default trip-code', style: style
        haml_tag :span, trip.name, class: 'trip-name'
      else
        placeholder
      end
    end
  end

end
