module PromptManager
  class PromptExecution < ApplicationRecord
    belongs_to :previous, class_name: "PromptManager::PromptExecution", optional: true

    before_create :set_uuid

    private

    def set_uuid
      self.uuid ||= SecureRandom.uuid
    end
  end
end
