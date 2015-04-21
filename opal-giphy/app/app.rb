require 'opal'
require 'opal-jquery'
require 'pp'

require_relative 'giphy_image'
require_relative 'giphy_api'

Document.ready? do
  giphy_api = GiphyApi.new

  Element.find('#searchButton').on(:click) do
    query = Element.find('#searchBox').attr('value')
    if query.nil?
      alert 'Boo, try again. Write something in the search box'
    else
      giphy_api.search(query)
    end
  end

  Element.find('#startOverButton').on(:click) do
    Element.find('#images').html ''
  end
end
