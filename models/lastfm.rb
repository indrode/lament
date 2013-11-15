require 'patron'
require 'json'

class Lastfm

  def initialize
    begin
      @session = Patron::Session.new
      @session.timeout = 10
      @session.base_url = "http://ws.audioscrobbler.com/2.0/"
      @session.headers['User-Agent'] = 'myapp/1.0'
    rescue
      @session = false
    end
  end

  def recent_scrobbles
    arr = []
    response = get_recent_tracks_call
    r = JSON.parse(response, :symbolize_name => true)

    r['recenttracks']['track'].each do |t|
      arr << {
        artist: t['artist']['#text'],
        title:  t['name'],
      }
    end
    p arr
    arr
  end

  def get_recent_tracks_call
    user = "zenpunch"
    limit = 5
    response = @session.get("/2.0/?method=user.getrecenttracks&user=#{user}&api_key=9c3c0087c6e8342e68b374f6f6483290&limit=#{limit}&format=json")
    response.body
  end

end