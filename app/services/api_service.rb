class ApiService

  # def initialize
  #   @client_id = ENV["CLIENT_ID"]
  #   @client_secret = ENV["CLIENT_SECRET"]
  #   @_connection = Faraday.new("https://www.audiosear.ch/api")
  #   # @_connection.headers = {Authorization: "oauth_token"}
  #
  # end

  require 'audiosearch'

  # create a client
  # def initialize
    client = Audiosearch::Client.new(
      :id     => ENV["CLIENT_ID"],
      :secret => ENV["CLIENT_SECRET"],
      :host   => 'https://www.audiosear.ch/',
      :debug  => false,
    )
  # end

  # fetch a show with id 1234
  show = client.get('/shows/1234')
  # or more idiomatically
  show = client.get_show(1234)

  def show_episode
    client = Audiosearch::Client.new(
      :id     => ENV["CLIENT_ID"],
      :secret => ENV["CLIENT_SECRET"],
      :host   => 'https://www.audiosear.ch/',
      :debug  => false,
    )
    client.get_show(1234)
  end

  # fetch an episode
  episode = client.get('/episodes/5678')
  # or idiomatically
  episode = client.get_episode(5678)

  # get related content for an episode or show
  related = client.get_related(15, {type: 'shows', size: 5, from: 5}) # id is required, type: 'episodes' is default

  # search
  res = client.search({ q: 'test' }, 'episodes') # 'episodes' is the default - 'shows', 'people' also searchable
  res.results.each do |episode|
    printf("[%s] %s (%s)\n", episode.id, episode.title, episode.show_title)
  end

  # tastemakers
  recs = client.get_tastemakers({n: 5}) # type: 'episodes' is the default, may also specify type: 'shows'

  # trending
  trends = client.get_trending

  # person
  person = client.get_person(1578)

  private
    def connection
      @_connection
    end

end
