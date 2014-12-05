module CustomerHelper

  def customer_gender(customer)
    if customer.gender.present?
      icon customer.gender, customer.gender
    else placeholder end
  end

  def customer_date_of_birth_with_age(customer)
    if customer.date_of_birth.present?
      [
        I18n.l(customer.date_of_birth),
        content_tag(:span, '(%d)' % customer.age, class: 'text-muted')
      ].join(' ').html_safe
    else placeholder end
  end

  def customer_email(customer)
    if customer.email.present?
      link_to(customer.email, 'mailto:%s' % customer.email)
    else placeholder end
  end

  def customer_address(customer)
    lines = [customer.address1, customer.address2]
    lines << [customer.post_code, customer.city].compact.join(' ')
    lines << customer.country

    placeholder lines.reject(&:blank?).join('<br />').html_safe
  end

  def customer_hotel(customer)
    lines = []

    if customer.hotel_name.present?
      lines << customer.hotel_name
    end

    if customer.room_number.present?
      lines << 'Room %s' % customer.room_number
    end

    placeholder lines.compact.join(' - ').html_safe
  end

  def customer_certification_date(customer)
    placeholder date_with_distance_to_now(customer.certification_date)
  end

  def customer_last_dive_on(customer)
    placeholder date_with_distance_to_now(customer.last_dive_on)
  end
end
