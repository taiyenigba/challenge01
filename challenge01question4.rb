require 'json'
require 'net/http'

# Function to list ash trees
def list_ash_trees(data)
  ash_trees = []
  data.each do |tree|
    if tree['common_name']&.downcase&.include?('ash')
      ash_trees << tree
    end
  end
  return ash_trees
end

# Function to fetch and parse JSON data
def fetch_and_parse_data(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  data = JSON.parse(response)
  return data
end

# URL for the subset of tree data
subset_url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json'

# Fetch and parse data
tree_data = fetch_and_parse_data(subset_url)

# List ash trees
ash_trees = list_ash_trees(tree_data)

# Print the list of ash trees
puts "List of Ash trees in the dataset:"
ash_trees.each_with_index do |tree, index|
  puts "#{index + 1}. #{tree['common_name']} (#{tree['species']})"
end
