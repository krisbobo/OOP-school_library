require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = generate_random_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def generate_random_id
    rand(1..100)
  end

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, name: 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
