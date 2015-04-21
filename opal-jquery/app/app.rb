require 'opal'
require 'opal-jquery'

class Clicker
  attr_reader :count

  def initialize
    @count = 0
  end

  def click!
    @count +=1
  end
end

Document.ready? do
  button  = Element.find('#clickerButton')
  clicker = Clicker.new
  click_count_node = Element.find('#clickCount')
  
  button.on(:click) do
    clicker.click!
    click_count_node.html clicker.count.to_s
  end
end
