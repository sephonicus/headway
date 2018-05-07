module Headway
  class When

    def initialize(now: Time.method(:now))
      @now = now
    end

    def formatted_now
      @now.call.strftime "%-l:%M%P, %-m/%-d"
    end

  end
end
