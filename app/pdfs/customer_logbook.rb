class CustomerLogbook
  include Prawn::View

  def initialize(customer)
    render_cover_page customer
    render_bookings customer.bookings
  end

  def render_cover_page(customer)
    move_down 200
    text 'Dive Logbook', size: 30, style: :bold, align: :center

    move_down 50
    text customer.full_name, size: 20, align: :center

    start_new_page
  end

  def render_bookings(bookings)
    bookings.each do |booking|
      render_booking booking
      stroke_horizontal_rule
    end
  end

  def render_booking(booking)
    stroke do
      circle [500, cursor], 25
    end

    text booking.inspect
  end

end
