require 'opal'
require 'opal-jquery'
require 'pp'


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

class GiphyApi
  API_KEY = 'dc6zaTOxFJmzC'
  HOST = 'http://api.giphy.com/v1/gifs'

  def search(query)
    escaped_query = query.gsub(' ', '%20')
    url = "#{HOST}/search?q=#{escaped_query}&api_key=#{API_KEY}"

    HTTP.get(url) do |resp|
      resp.json.fetch('data').shuffle.first(10).each do |json|
        image = GiphyImage.from_json(json).html_tag
        images.append(image)
      end
    end
  end

  def images
    Element.find('#images')
  end
end

Document.ready? do
  giphy_api = GiphyApi.new

  Element.find('#searchButton').on(:click) do
    query = Element.find('#searchBox').attr('value')
    if query.nil?
      alert 'Boo, try again, write something in the search box'
    else
      giphy_api.search(query)
    end
  end

  Element.find('#startOverButton').on(:click) do
    Element.find('#images').html ''
  end
end
