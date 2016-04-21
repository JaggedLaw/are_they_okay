require 'audiosearch'

# create a client
client = Audiosearch::Client.new(
  :id     => 'oauth_id',
  :secret => 'oauth_secret',
  :host   => 'https://www.audiosear.ch/',
  :debug  => false,
)

# fetch a show with id 1234
show = client.get('/shows/1234')
# or more idiomatically
show = client.get_show(1234)

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
