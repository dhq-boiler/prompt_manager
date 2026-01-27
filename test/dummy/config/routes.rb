Rails.application.routes.draw do
  mount PromptManager::Engine => "/prompt_manager"
end
