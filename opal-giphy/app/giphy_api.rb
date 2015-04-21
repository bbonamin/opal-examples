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
