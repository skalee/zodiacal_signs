require "date"

Date.send :include, ::ZodiacalSigns::Mixin
Time.send :include, ::ZodiacalSigns::Mixin
