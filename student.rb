require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
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
