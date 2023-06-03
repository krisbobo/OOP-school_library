require_relative 'app'

def main
  app = App.new
  puts 'Welcome to the School Library App!'
  choices = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_by_person_id,
    7 => :quit
  }

  loop do
    display_menu
    choice = gets.chomp.to_i
    handle_choice(choice, app, choices)
    break if choice == 7
  end
end

def display_menu
  puts 'Please choose an option by entering a number:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Exit'
end

def handle_choice(choice, app, choices)
  if choices.key?(choice)
    method_name = choices[choice]
    send(method_name, app)
  else
    puts 'Invalid choice. Please try again.'
  end
end

def list_books(app)
  app.list_books
end

def list_people(app)
  app.list_people
end

def create_person(app)
  app.create_person
end

def create_book(app)
  app.create_book
end

def create_rental(app)
  app.create_rental
end

def list_rentals_by_person_id(app)
  app.list_rentals_by_person_id
end

def quit(_app)
  puts 'Thank you for using the School Library App. Goodbye!'
end

main
