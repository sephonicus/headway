module Headway
  class Progress

    START_PERCENT = 0.0
    COMPLETE_PERCENT = 100.0

    def initialize
      @stages = [ START_PERCENT ]
      @current_stage_index = 0
    end

    def percentage
      @stages.inject(&:+) / (@stages.size)
    end

    def set_percentage(percentage)
      @stages[@current_stage_index] = percentage
    end

    def start_multistage_process(stages:)
      @stages = Array.new(stages) { START_PERCENT }
    end

    def set_complete
      @stages[@current_stage_index] = COMPLETE_PERCENT
      @current_stage_index += 1
    end

    def completed?
      @stages[@current_stage_index].nil?
    end

  end
end
