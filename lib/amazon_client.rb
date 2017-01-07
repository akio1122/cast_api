module AmazonClient
  def self.authorize(token:)
    uri = amazon_uri(token)
    HTTParty.get(uri)
  end

  def self.search(params = {})
    #implement search algorithm here
  end

  private

  def self.amazon_uri(token)
    URI.parse(URI.encode("https://api.amazon.com/auth/O2/tokeninfo?access_token=#{token}".strip))
  end
end
