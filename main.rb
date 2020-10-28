require_relative 'lib/wardrobe'

wardrobe = Wardrobe.from_dir(File.join(__dir__, 'data'))

puts 'what is the weather today? (+ - C*)'

user_temp = STDIN.gets.to_i

suitable_wardrobe = wardrobe.for_weather(user_temp)

wardrobe_for_user =
  Wardrobe.new(
    suitable_wardrobe.types.map { |type| suitable_wardrobe.for_type(type).sample }
  )

puts 'Here is your outfit:'
puts wardrobe_for_user
