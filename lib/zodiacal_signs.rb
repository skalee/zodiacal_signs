require "zodiacal_signs/version"

module ZodiacalSigns

  CALENDAR = [
    [:aquarius, 1, 21],
    [:pisces, 2, 20],
    [:aries, 3, 21],
    [:taurus, 4, 21],
    [:gemini, 5, 22],
    [:cancer, 6, 22],
    [:leo, 7, 23],
    [:virgo, 8, 23],
    [:libra, 9, 24],
    [:scorpio, 10, 24],
    [:saggitarius, 11, 23],
    [:capricorn, 12, 23],
  ]

  ALL_SIGNS = CALENDAR.map &:first

  module Mixin

    def zodiacal_sign
      ZodiacalSigns::resolve month, day
    end

    ZodiacalSigns::ALL_SIGNS.each do |sign|
      define_method :"#{sign}?" do
        zodiacal_sign == sign
      end
    end

  end

  module_function

  # Resolves +month+ and +day+ pair to zodiacal sign, returns a +Symbol+.
  def resolve month, day
    CALENDAR.inject(:capricorn) do |previous_sign, (sign, s_month, s_start_day)|
      if month == s_month
        return day >= s_start_day ? sign : previous_sign
      else
        sign
      end
    end
  end

end

require "zodiacal_signs/integrator"
