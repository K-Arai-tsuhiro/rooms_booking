60.times do |n|
  Reservation.create!(
    start_at: Date.current.since(2.days),
    end_at: Date.current.since(5.days),
    persons: rand(1..10),
    user_id: rand(1..11),
    room_id: rand(1..40)
  )
end