require "twitter"

class TwitterLinks

  attr_accessor :tweets, :hashtag, :links

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

      @links = @tweets.join("").scan(LINK_REGEX).uniq
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


