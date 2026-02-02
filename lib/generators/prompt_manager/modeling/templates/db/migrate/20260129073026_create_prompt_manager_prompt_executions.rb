class CreatePromptManagerPromptExecutions < ActiveRecord::Migration[8.1]
  def change
    create_table :prompt_manager_prompt_executions do |t|
      t.references :previous, foreign_key: { to_table: :prompt_manager_prompt_executions }, index: true, null: true
      t.string :uuid
      t.text :prompt
      t.string :llm_platform
      t.string :model
      t.string :configuration
      t.text :response

      t.timestamps
    end
  end
end
