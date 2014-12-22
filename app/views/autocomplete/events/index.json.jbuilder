json.more !events.last_page?
json.results do
  json.array!(events_by_date) do |date, events|
    json.text I18n.l(date, format: :short)
    json.date date
    json.children do
      json.array! events.reverse, partial: 'event', as: :event
    end
  end
end
