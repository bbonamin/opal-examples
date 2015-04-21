require 'opal'

class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def admin?
    @name == 'Admin'
  end
end

user = User.new('Bob')
puts user.name
puts "Is Bob an admin? #{user.admin?}"

user = User.new('Admin')
puts user
puts "Is Admin an admin? #{user.admin?}"
