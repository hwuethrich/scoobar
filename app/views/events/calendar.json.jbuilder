json.array! events do |event|
  json.id    event.id
  json.title event.name
  json.start event.start_time
  json.end   event.end_time
  json.color '#428bca'
end
