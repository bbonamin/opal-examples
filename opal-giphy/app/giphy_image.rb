class GiphyImage
  attr_reader :html_tag

  def self.from_json(json)
    new(json['images']['downsized']['url'])
  end

  def initialize(url)
    @html_tag = "<img src='#{url}' class='img-responsive' alt='Responsive image'>"
    self
  end
end
