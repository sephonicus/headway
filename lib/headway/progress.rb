module Headway
  class Progress

    START_PERCENT = 0.0
    COMPLETE_PERCENT = 100.0

    def initialize
      @progress = START_PERCENT
    end

    def percentage
      @progress
    end

    def set_percentage(percentage)
      @progress = percentage
    end

    def set_complete
      @progress = COMPLETE_PERCENT
    end

    def completed?
      @progress >= COMPLETE_PERCENT
    end

  end
end
