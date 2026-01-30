module PromptManager
  class PromptExecution < ApplicationRecord
    belongs_to :previous, class_name: "PromptManager::PromptExecution", optional: true
  end
end
