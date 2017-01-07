desc "Checks user's conditions every day and sends according pushes if user needs to take some action"
task check_conditions: :environment do
  User.find_each do |user|
    if !user.latitude.blank? and !user.longitude.blank?
      timezone = Timezone::Zone.new :latlon => [user.latitude, user.longitude]
      diff = Time.now.in_time_zone(timezone.zone).utc_offset.second
      CheckConditions.delay(run_at: 9.hours.from_now - diff).call(user: user, time_of_a_day: '9am', type: :skin)
      CheckConditions.delay(run_at: 9.hours.from_now - diff).call(user: user, time_of_a_day: '9am', type: :hair)
      CheckConditions.delay(run_at: 12.hours.from_now - diff).call(user: user, time_of_a_day: '12pm', type: :skin)
      CheckConditions.delay(run_at: 12.hours.from_now - diff).call(user: user, time_of_a_day: '12pm', type: :hair)
      CheckConditions.delay(run_at: 18.hours.from_now - diff).call(user: user, time_of_a_day: '6pm', type: :skin)
      CheckConditions.delay(run_at: 18.hours.from_now - diff).call(user: user, time_of_a_day: '6pm', type: :hair)
    end
  end
end

task test_conds: :environment do
  # user = User.find_by({ email: 'leighton0102@gmail.com' })
  # timezone = Timezone::Zone.new :latlon => [user.latitude, user.longitude]
  # diff = Time.now.in_time_zone(timezone.zone).utc_offset.second
  # CheckConditions.delay(run_at: 9.hours.from_now - diff).call(user: user, time_of_a_day: '9am', type: :skin)

  # CheckConditions.call(user: user, time_of_a_day: '9am', type: :skin)
  # CheckConditions.call(user: user, time_of_a_day: '9am', type: :hair)

  user = User.find 168;
  current_weather = BarometerClient.get_weather(latitude: user.latitude, longitude: user.longitude)
  SkinCondition.message_for_weather(current_weather.temperature, current_weather.humidity, '9am', user)
end