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

  end

  context "Process" do

  end

  context "Print" do

  end
end
