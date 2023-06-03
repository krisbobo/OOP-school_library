require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :name
  attr_reader :classroom, :type

  def initialize(age, name, classroom, parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    @type = 'Student'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student.push(self) unless classroom.students.include?(self)
  end

  def to_s
    "Student: #{name}"
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
