class Award
  attr_reader :name
  attr_accessor :expires_in, :quality

  def initialize(name, expires_in, quality)
    @name       = name
    @expires_in = expires_in
    @quality    = quality
  end

  def calculate_quality
    if @name == 'NORMAL ITEM'
      normal_item
    elsif @name == 'Blue First'
      blue_first
    elsif @name == 'Blue Distinction Plus'
      blue_distinction_plus
    elsif @name == 'Blue Compare'
      blue_compare
    elsif @name == 'Blue Star'
      blue_star
    end 

    @quality < 0 && @quality = 0
    @quality > 50 && @quality = 50 unless @name == 'Blue Distinction Plus'
    @expires_in -= 1 unless @name == 'Blue Distinction Plus'
  end

  private

  def normal_item
    @expires_in > 0 ? @quality -= 1 : @quality -= 2
  end

  def blue_first
    @expires_in > 0 ? @quality += 1 : @quality += 2
  end

  def blue_distinction_plus
    @quality = 80
  end

  def blue_compare
    if @expires_in < 1 
      @quality = 0
    elsif @expires_in < 6
      @quality += 3
    elsif @expires_in < 11
      @quality += 2
    else 
      @quality += 1
    end
  end

  def blue_star
    @expires_in >= 5 ? @quality -= 2 : @quality -= 4
  end

end
