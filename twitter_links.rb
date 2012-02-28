require "twitter"

class TwitterLinks

  attr_accessor :hashtag, :tweets, :links

  SEARCH_COUNT = 100
  LINK_REGEX   = /\b(?:https?:\/\/|www\.)\S+\b/

  def initialize(attrs={ })
    attrs.each do |k, v|
      send("#{k}=", v)
    end
  end

  def search
    unless @hashtag.nil? or @hashtag.empty?
      @hashtag = fix_tag(hashtag)
      @tweets  = Twitter.search("#{@hashtag} -rt",
                                :rpp  => SEARCH_COUNT,
                                :lang => 'en').map(&:text)
      @links   = @tweets.join("").scan(LINK_REGEX).uniq
    end
  end

  def pp(options)
    options.include?("-t") ? print_tweets : print_links
  end

  def print_links
    @links.each_with_index do |l, index|
      puts "#{index + 1}. #{l}"
    end
  end

  def print_tweets
    @tweets.each_with_index do |t, index|
      puts "#{index + 1}. #{t}"
    end
  end

  def fix_tag(tag)
    prefix    = "#"
    fixed_tag = tag
    if tag[0, prefix.length] == prefix
    else
      fixed_tag = "##{tag}"
    end

    fixed_tag
  end
end

if ARGV.length < 1
  usage = <<USAGE
Usage: ruby twitter_links.rb hashTag [options]
       -t print tweets
       -l print links in tweets (default)
USAGE

  puts usage
else
  t = TwitterLinks.new(hashtag: ARGV.first)
  t.search
  t.pp(ARGV)
end

