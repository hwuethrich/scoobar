module TripHelper

  def trip_code_and_name(trip)
    capture_haml do
      style = 'background-color: %s;' % trip.color
      haml_tag :span, trip.code, class: 'label label-default', style: style
      haml_concat trip.name
    end
  end

end
