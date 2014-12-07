class CustomerLogbook
  include Prawn::View

  def initialize(customer)
    register_fonts

    font 'Open Sans' do
      render_cover_page customer
      render_bookings customer.bookings
    end
  end

  def document
    @document ||= Prawn::Document.new page_size: 'A5'
  end

  def render_cover_page(customer)
    move_down 200
    text 'Dive Logbook', size: 30, style: :bold, align: :center

    move_down 50
    text customer.full_name, size: 20, align: :center

    start_new_page
  end

  def render_bookings(bookings)
    bookings.each_with_index do |booking, i|
      start_new_page if i > 0
      render_event i+1, booking.event
    end
  end

  def render_event(number, event)
    render_header number, event

    logbook = event.logbook || event.build_logbook
    render_logbook logbook

    render_comments logbook
  end

  def render_header(number, event)

    data = [[
      number,
      event.name,
      event.start_time.present? ? I18n.l(event.start_time.to_date) : ''
    ]]

    table(data, width: 347) do
      cells.valign = :center
      cells.borders = []
      cells.padding = [5, 10]

      column(0).width = 35
      column(0).align = :center
      column(0).text_color = 'FFFFFF'
      column(0).background_color = '333333'

      columns(0..1).size = 18

      columns(2).align = :right
      columns(2).padding = [5, 0]
    end

  end

  def render_logbook(logbook)

    time_in   = logbook.formatted_time_in  || ' '
    time_out  = logbook.formatted_time_out || ' '
    dive_time = logbook.dive_time.present? ? '%d min' % logbook.dive_time : ' '
    max_depth = logbook.max_depth.present? ? '%.1f m' % logbook.max_depth : ' '

    data = [
      [ 'TIME IN',   'TIME OUT'   ],
      [  time_in,     time_out    ],
      [ 'DIVE TIME', 'MAX. DEPTH' ],
      [  dive_time,   max_depth   ]
    ]

    pad(30) do
      table(data, position: :center) do
        columns([0,1]).width = 347 / 2.0

        cells.border_color = 'EEEEEE'
        cells.border_lines = [:solid]
        cells.align = :center

        # Headings
        row([0,2]).padding = [5, 0]
        row([0,2]).size = 10
        row([0,2]).background_color = 'EEEEEE'
        row([0,2]).font_style = :bold

        # Details
        row([1,3]).padding = [10, 0]
        row([1,3]).size = 16
      end
    end

  end

  def render_comments(logbook)
    text 'COMMENTS', style: :bold, size: 10

    pad(10) { text logbook.comments, size: 10 }

    line_width 0.5
    stroke_color 'aaaaaa'
    dash 1, space: 1, phase: 5

    while cursor > 0
      stroke_horizontal_rule
      move_down 20
    end

    undash
  end

  def register_fonts
    font_path = Rails.root.join 'app', 'assets', 'fonts'

    font_files = {
      normal:      font_path.join('OpenSans-Regular.ttf'),
      italic:      font_path.join('OpenSans-Italic.ttf'),
      bold:        font_path.join('OpenSans-Bold.ttf'),
      bold_italic: font_path.join('OpenSans-Regular.ttf'),
    }

    font_families.update 'Open Sans' => font_files
  end

end
