require "spec_helper"

describe TwitterLinks do

  context "Setup" do

    it "has a tweets variable" do
      t = TwitterLinks.new()

      t.tweets = "Tweets"
      t.tweets.should eql "Tweets"
    end

    it "has a hashtag variable" do
      t = TwitterLinks.new()

      t.hashtag = "#ruby"
      t.hashtag.should eql "#ruby"
    end

  end

  context "Search" do

  end

  context "Process" do

  end

  context "Print" do

  end
end
