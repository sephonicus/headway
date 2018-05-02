module Headway
  class Progress

    START_PERCENT = 0.0
    COMPLETE_PERCENT = 100.0

    def initialize
      @root_stage = Stage.new
      @current_stage_index = 0
    end

    def percentage
      @root_stage.percentage
    end

    def set_percentage(percentage)
      current_stage.set_percentage percentage
    end

    def start_multistage_process(stages:)
      current_stage.promote_to_multistage stages: stages
    end

    def set_complete
      current_stage.set_percentage 100.0
      @current_stage_index += 1
    end

    def completed?
      current_stage.nil?
    end

  private

    def current_stage
      stages.flatten[@current_stage_index]
    end

    def stages
      Array(@root_stage.stages)
    end

    class Stage
      def initialize(progress: START_PERCENT)
        @progress = progress
        @children = nil
      end

      def percentage
        if @children
          @children.inject(0.0) { |total, child| total += child.percentage } / (@children.size)
        else
          @progress
        end
      end

      def promote_to_multistage(stages:)
        @children = Array.new(stages - 1) { Stage.new }
        @children.unshift cloned
      end

      def set_percentage(percentage)
        @progress = percentage
      end

      def stages
        @children&.map(&:stages) || self
      end

      def cloned
        Stage.new progress: @progress
      end
    end

  end
end
