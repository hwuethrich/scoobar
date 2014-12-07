module DateTimeHelper
  def date_with_distance_to_now(date)
    return nil if date.blank?

    html = [
      icon(:calendar),
      I18n.l(date, format: '%d/%m/%Y'),
      content_tag(:span, '(%s ago)' % distance_of_time_in_words_to_now(date), class: 'text-muted')
    ]

    html.join(' ').html_safe
  end
end
