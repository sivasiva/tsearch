require "spec_helper"

describe TwitterLinks do

  let(:linkies) { %w{A B C D E} }

  context "Setup" do

    before :each do
      @t = TwitterLinks.new()
    end

    it "has a tweets variable" do
      @t        = TwitterLinks.new()
      @t.tweets = "Tweets"
      @t.tweets.should eql "Tweets"
    end

    it "has a hashtag variable" do
      @t         = TwitterLinks.new()
      @t.hashtag = "#ruby"
      @t.hashtag.should eql "#ruby"
    end

    it "has a links variable" do
      @t       = TwitterLinks.new()
      links    = %w{A B C D E}
      @t.links = links
      @t.links.should eql links
    end

    it "supports setting attributes in the initializer" do
      t = TwitterLinks.new(tweets: "tweets", hashtag: "#ruby", links: linkies)
      t.tweets.should eql "tweets"
      t.hashtag.should eql "#ruby"
      t.links.should eql linkies
    end
  end

  context "HashTag" do
    it "stores the given hashtag" do
      ruby = TwitterLinks.new(hashtag: "#ruby")
      ruby.hashtag.should eql "#ruby"
    end

  end

  context "Search" do

    before :each do
      @ruby   = TwitterLinks.new(hashtag: "ruby")
      @oscars = TwitterLinks.new(hashtag: "oscars")

      @ruby.search
      @oscars.search
    end

    it "accepts tags with or without the hash" do
      @ruby.hashtag.should eql "#ruby"
      @oscars.hashtag.should eql "#oscars"
    end
    it "fetches 100 tweets for the given hashTag" do
      @ruby.tweets.length.should eql 100
    end

    it "stores the search results" do
      @ruby.tweets.should_not eql nil
    end

    it "performs fresh search for each given tag" do
      @ruby.should_not eql @oscars
    end

    it "stores the links from the tweets" do
      @ruby.links.should_not eql nil
    end
  end


  context "Process" do

  end

  context "Print" do

  end
end
