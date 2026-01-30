
module PromptManager
  module Generators
    class ModelingGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("templates", __dir__)

      def self.next_migration_number(dirname)
        next_migration_number = current_migration_number(dirname) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      def add_migrations
        migration_template "db/migrate/20260129073026_create_prompt_manager_prompt_executions.rb", "db/migrate/create_prompt_manager_prompt_executions.rb"
      end
    end
  end
end
