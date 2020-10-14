class Award
  attr_accessor :name, :expires_in, :quality

  def initialize(name, expires_in, quality)
    @name       = name
    @expires_in = expires_in
    @quality    = quality
  end

  def calculate_quality
    self.expires_in >= 5 ? self.quality -= 2 : self.quality -= 4
    self.quality < 0 && self.quality = 0
    self.expires_in -= 1
  end
end