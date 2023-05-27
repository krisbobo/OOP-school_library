require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = generate_random_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    name
  end

  def add_rental(rental)
    @rentals << rental
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def to_s
    "Person: #{name} is #{age} years old"
  end

  private

  def generate_random_id
    rand(1..100)
  end

  def of_age?
    @age >= 18
  end
end
