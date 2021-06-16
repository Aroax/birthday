require 'date'

def days_remaining
  today = DateTime.now
  puts today
  birthday = DateTime.new(today.year, 6, 14)
  puts birthday
  birthday = birthday.next_year(1) if today > birthday
  (birthday - today).to_i
end

puts days_remaining
