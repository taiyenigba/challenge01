require 'net/http'
require 'json'

url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)

begin
  response = Net::HTTP.get(uri)
  dog_breeds = JSON.parse(response) # Convert JSON data into Ruby data.

  dog_breeds['message'].each do |breed, sub_breeds|
    puts "* #{breed.capitalize}"
    sub_breeds.each do |sub_breed|
      puts "  * #{sub_breed.capitalize}"
    end
  end
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end
