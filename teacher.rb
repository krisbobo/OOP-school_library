class Teacher < Person
  attr_accessor :specialization
  attr_reader :type

  def initialize(age, specialization, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @specialization = specialization
    @type = 'Teacher'
  end

  def can_use_services?
    true
  end
end
