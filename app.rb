require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'person'
require_relative 'rental'
require 'date'

class App
  def initialize
    @classrooms = []
    @persons = []
    @books = []
    @rentals = []
  end

  def line_return
    puts '---------------------------'
  end

  # List all books
  def list_books
    puts 'List of Books:'
    @books.each do |book|
      puts "#{book.id}. #{book.title} by #{book.author}"
    end
  end

  # List all persons
  def list_people
    puts 'List of People:'
    @persons.each do |person|
      puts "#{person.id}. #{person.name}"
    end
  end

  # create a student
  def add_student
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Age: '
    age = gets.chomp.to_i
    print 'Classroom: '
    classroom = gets.chomp.capitalize
    print 'Has parent permission? (Y/N): '
    parent_permission = gets.chomp.downcase
    while parent_permission != 'y' && parent_permission != 'n'
      print 'Please input Y or N: '
      parent_permission = gets.chomp.downcase
    end
    student = Student.new(age, name, classroom) if parent_permission == 'y'
    student = Student.new(age, name, classroom, parent_permission: false) if parent_permission == 'n'
    @persons << student
    puts 'Student successfully created'
    line_return
  end

  # create a teacher
  def add_teacher
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    teacher = Teacher.new(age, specialization, parent_permission: true, name: name)
    @persons << teacher
    puts 'Teacher successfully created'
    line_return
  end

  # Create a person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    person_type = gets.chomp
    while person_type != '1' && person_type != '2'
      print 'Please input 1 or 2: '
      person_type = gets.chomp
    end
    if person_type == '1'
      add_student
    else
      add_teacher
    end
  end

  # create a book
  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    print 'Book ID: '
    id = gets.chomp.to_i

    book = Book.new(id, title, author)
    @books << book

    puts 'Book successfully created'
    line_return
  end

  # print list of books
  def print_books_by_index
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  # print list of persons
  def print_persons_by_index
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  # Create a rental
  # Select book to rent
  def select_book_to_rent
    puts 'Select a book from the following list by number'
    print_books_by_index
    book_index = gets.chomp.to_i
    while book_index.negative? || book_index >= @books.length
      puts 'Please input a valid index'
      book_index = gets.chomp.to_i
    end
    puts 'book selected'
    @books[book_index]
  end

  # Select person to rent to
  def select_person_to_rent
    puts 'Select a person from the following list by number (not id)'
    print_persons_by_index
    person_index = gets.chomp.to_i
    while person_index.negative? || person_index >= @persons.length
      puts 'Please input a valid index'
      person_index = gets.chomp.to_i
    end
    puts 'person selected'
    @persons[person_index]
  end

  # create a rental
  def create_rental
    if @books.empty?
      puts 'There are no books available'
      line_return

      return
    end
    if @persons.empty?
      puts 'There are no persons available'
      line_return
      return
    end
    book = select_book_to_rent
    person = select_person_to_rent
    print 'Date: (DD\MM\YYYY): '
    date = gets.chomp
    rental = Rental.new(date, person, book)
    @rentals << rental
    puts 'Rental created successfully'
    line_return
  end

  # List rentals for a person by ID
  def list_rentals_by_person_id
    puts 'Enter the ID of person'
    person_id = gets.chomp.to_i
    person = @persons.find { |p| p.id == person_id }

    if person.nil?
      puts "Person with ID #{person_id} not found."
      return
    end

    rentals = @rentals.select { |rental| rental.person == person }

    if rentals.empty?
      puts "No rentals found for #{person.name}."
    else
      puts "Rentals for #{person.name}:"
      rentals.each do |rental|
        puts "#{rental.book.title} by #{rental.book.author} (Date: #{rental.date})"
      end
    end
  end
end
