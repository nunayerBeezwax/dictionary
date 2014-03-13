class Definition

  def Definition.create(defi)
    new_defi = Definition.new(defi)
    new_defi.save
    new_defi
  end

  def initialize(defi)
    @defi_array = []
    @defi = defi
  end

  def defi_array
    @defi_array
  end

  def defi
    @defi
  end

  def save
    @defi_array << self.defi
  end

  def edit_defi(new_defi)
    @defi = new_defi
  end

end
