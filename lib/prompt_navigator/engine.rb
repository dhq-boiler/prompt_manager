# frozen_string_literal: true

module PromptNavigator
  class Engine < ::Rails::Engine
    isolate_namespace PromptNavigator

    # Initialize helper methods to be available in ActionView
    # This makes PromptNavigator::Helpers methods accessible in Rails views
    initializer "prompt_navigator.helpers" do
      ActiveSupport.on_load(:action_view) do
        include PromptNavigator::Helpers
      end
    end

    initializer "prompt_navigator.controllers" do
      ActiveSupport.on_load(:action_controller) do
        include PromptNavigator::HistoryManageable
      end
    end

    # Configure asset paths for the engine
    # This ensures that JavaScript and CSS files are properly loaded
    initializer "prompt_navigator.assets", before: "sprockets.environment" do |app|
      # Add asset paths
      app.config.assets.paths << root.join("app/assets/stylesheets").to_s
      app.config.assets.paths << root.join("app/javascript").to_s

      # Precompile assets
      if app.config.respond_to?(:assets)
        app.config.assets.precompile += %w[
          prompt_navigator/history.css
          prompt_navigator/application.css
          controllers/history_controller.js
        ]
      end
    end
  end
end
