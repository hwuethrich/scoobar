json.extract! event, :id, :start_time, :name, :duration, :price

json.trip do
  json.partial! event.trip, partial: 'autocomplete/trips/trip'
end
