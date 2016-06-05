$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require "minitest/autorun"
require "zodiacal_signs"
require "active_support/time_with_zone"

class TestDate < Minitest::Test

  class << self
    def test definition
      day, month, expected_sign = definition.values_at(:day, :month, :resolves_to)
      month_name = Date::ABBR_MONTHNAMES[month]
      test_name = "test_#{day}_#{month_name}_resolves_to_#{expected_sign}"

      define_method test_name do
        subject = build_subject day, month
        assert_equal expected_sign, subject.zodiacal_sign

        assert_same true, subject.public_send("#{expected_sign}?")

        assert_equal 11, ZodiacalSigns::ALL_SIGNS.count { |sign|
          false.equal? subject.public_send("#{sign}?")
        }
      end
    end
  end

  def build_subject day, month
    Date.civil 2016, month, day
  end

  test month: 1, day: 1, resolves_to: :capricorn
  test month: 1, day: 20, resolves_to: :capricorn
  test month: 1, day: 21, resolves_to: :aquarius
  test month: 2, day: 19, resolves_to: :aquarius
  test month: 2, day: 20, resolves_to: :pisces
  test month: 3, day: 20, resolves_to: :pisces
  test month: 3, day: 21, resolves_to: :aries
  test month: 4, day: 20, resolves_to: :aries
  test month: 4, day: 21, resolves_to: :taurus
  test month: 5, day: 21, resolves_to: :taurus
  test month: 5, day: 22, resolves_to: :gemini
  test month: 6, day: 21, resolves_to: :gemini
  test month: 6, day: 22, resolves_to: :cancer
  test month: 7, day: 22, resolves_to: :cancer
  test month: 7, day: 23, resolves_to: :leo
  test month: 8, day: 22, resolves_to: :leo
  test month: 8, day: 23, resolves_to: :virgo
  test month: 9, day: 23, resolves_to: :virgo
  test month: 9, day: 24, resolves_to: :libra
  test month: 10, day: 23, resolves_to: :libra
  test month: 10, day: 24, resolves_to: :scorpio
  test month: 11, day: 22, resolves_to: :scorpio
  test month: 11, day: 23, resolves_to: :saggitarius
  test month: 12, day: 21, resolves_to: :saggitarius
  test month: 12, day: 23, resolves_to: :capricorn
  test month: 12, day: 31, resolves_to: :capricorn

end

class TestDateTime < TestDate
  def build_subject day, month
    DateTime.civil 2016, month, day
  end
end

class TestTime < TestDate
  def build_subject day, month
    Time.utc 2016, month, day
  end
end

class TestTimeWithZone < TestDate
  def build_subject day, month
    zone = ActiveSupport::TimeZone["Asia/Tokyo"]
    zone.local 2016, month, day
  end
end
