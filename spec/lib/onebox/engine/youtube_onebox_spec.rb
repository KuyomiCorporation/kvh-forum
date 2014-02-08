require 'spec_helper'

describe Onebox::Engine::YoutubeOnebox do
  before do
    fake("http://www.youtube.com/watch?feature=player_embedded&v=21Lk4YiASMo", response("youtube"))
    fake("http://www.youtube.com/oembed?format=json&url=http%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D21Lk4YiASMo", response("youtube-json"))
  end

  it "should add wmode=opaque" do
    Onebox.preview('https://www.youtube.com/watch?v=21Lk4YiASMo').to_s.should match(/wmode=opaque/)
  end

  it "should rewrite URLs to be agnostic" do
    Onebox.preview('https://www.youtube.com/watch?v=21Lk4YiASMo').to_s.should match(/"\/\//)
  end

  it "should not make HTTP requests unless necessary" do
    # We haven't defined any fixture for requests associated with this ID, so if
    # any HTTP requests are made fakeweb will complain and the test will fail.
    Onebox.preview('http://www.youtube.com/watch?v=q39Ce3zDScI').to_s
  end

  it "should not fail if we cannot get the video ID from the URL" do
    Onebox.preview('http://www.youtube.com/watch?feature=player_embedded&v=21Lk4YiASMo').to_s.should match(/embed/)
  end
end

