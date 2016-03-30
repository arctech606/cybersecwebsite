Given(/^the following events exist in database$/) do |table|
  table.hashes.each do |event|
    Event.create!(event)
  end
end