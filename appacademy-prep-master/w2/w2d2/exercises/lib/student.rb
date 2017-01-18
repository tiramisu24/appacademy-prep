require "course"
class Student
  attr_reader :first_name, :last_name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def enroll(crs)
    unless has_conflict?(crs)
      @courses << crs
      crs.students << self
    end
  end

  def has_conflict?(crs)
    return true if crs.students.include?(self)

    conflict = false
    @courses.each do |course|
      if  crs.conflicts_with?(course)
        conflict = true
      end
    end

    if conflict
      raise Exception, "conflict"
    end
    conflict
  end

  def course_load
    load = Hash.new(0)
    @courses.each do |course|
      load[course.department] += course.credits
    end
    load
  end
end
