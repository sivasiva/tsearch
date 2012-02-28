class TwitterLinks

  attr_accessor :tweets, :hashtag, :links

  def initialize(attrs={ })
    attrs.each do |k, v|
      send("#{k}=", v)
    end
  end
end


