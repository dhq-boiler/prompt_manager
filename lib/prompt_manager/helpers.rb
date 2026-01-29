module PromptManager
  module Helpers
    def history_list(card_path, active_uuid: nil)
      render "prompt_manager/history", locals: { card_path: card_path, active_uuid: active_uuid }
    end
  end
end
