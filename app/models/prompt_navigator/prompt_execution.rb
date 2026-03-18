module PromptNavigator
  class PromptExecution < ApplicationRecord
    belongs_to :previous, class_name: "PromptNavigator::PromptExecution", optional: true

    before_create :set_execution_id

    # Builds a context array from the direct lineage for summarization.
    # Each entry contains { prompt:, response: } from ancestor PromptExecutions.
    # Optionally limit to the most recent N ancestors.
    def build_context(limit: nil)
      ancestors(limit: limit).map do
        { prompt: it.prompt, response: it.response }
      end
    end

    private

    # Returns ancestor PromptExecutions in chronological order (oldest first),
    # excluding self. Optionally limit to the most recent N ancestors.
    def ancestors(limit: nil)
      chain = []
      pe = previous

      while pe
        chain.unshift(pe)
        pe = pe.previous
      end

      limit ? chain.last(limit) : chain
    end

    def set_execution_id
      self.execution_id ||= SecureRandom.uuid
    end
  end
end
