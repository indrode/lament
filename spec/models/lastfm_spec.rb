require 'spec_helper'
require File.join(ROOT, 'models/lastfm.rb')

describe Lastfm do
  let(:lastfm)  { Lastfm.new }
  let(:session) { stub('session', timeout: 0) }

  describe 'creates a new instance' do
    it 'that works'
  end

  describe '#recent_scrobble' do
    it 'returns recent scrobbles' do
      lastfm.recent_scrobbles
    end
  end
end
