# require 'audiosearch'

class ApiService

  attr_reader :client

  # create a client
  def initialize
    @client ||= Audiosearch::Client.new(
      :id     => ENV['CLIENT_ID'].dup,
      :secret => ENV['CLIENT_SECRET'].dup,
      :host   => ENV['AS_HOST'].dup,
      :debug  => false,
    )
  end

  def grab_show(params)
    client.get_show(params[:id])
  end

  def self.grab_show(params)
    new.grab_show(params)
  end

  def grab_related_episodes(params)
    disorders = params[:illnesses]
    disorders.each do |disorder|
      disorder_name = Illness.find(disorder[0]).name
      res = client.search({ q: 'disorder_name'})
      if !res.is_success
        raise "There was a problem searching: #{res.status} #{res}"
      end
      res.results.each do |episode|
        printf("[%s] %s (%s)\n", episode.id, episode.title, episode.show_title)
      end
    end
  end


end
