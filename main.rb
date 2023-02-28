require_relative 'app'

def main
  puts 'Welcome to My Catalog App'
  puts '-------------------------'
  app = App.new
  app.selected_option
end

main
