class Date

  def zodiacal_sign
    ZodiacalSigns::resolve month, day
  end

end
