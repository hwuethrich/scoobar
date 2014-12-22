module EventHelper

  def event_info_line(event, *components)
    if components.empty?
      components = [:boat, :end_time, :bookings, :guide, :night_dive, :logbook, :price]
    end

    html = components.map do |component|
      case component

        when :boat
          label = event.boat_dive? ? event.boat_code : '—'
          icon :anchor, label

        when :start_time
          label = I18n.l(event.start_time, format: '%H:%M')
          icon 'clock-o', label

        when :end_time
          label = I18n.l(event.end_time, format: '%H:%M')
          icon 'mail-reply', label

        when :bookings
          if event.limited_capacity?
            label = '%d/%d' % [event.number_of_bookings, event.capacity]
          else
            label = event.number_of_bookings
          end
          icon :user, label

        when :guide
          if event.guided_dive?
            icon :star, event.guide.name
          else
            icon 'star-o', 'non-guided'
          end

        when :night_dive
          icon 'moon-o', 'night dive' if event.night_dive?

        when :logbook
          icon :book, 'logged' if event.logbook.present?

        when :price
         if event.price.present?
          label = '%.2f' % event.price

          if event.trip_price.present? && event.trip_price != event.price
            label << ' (%+.2f)' % (event.price - trip_price)
          end

          icon :money, label

        end
      end
    end

    html.compact.join(' | ').html_safe
  end
end
