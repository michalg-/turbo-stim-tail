# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    enable_extension("pgcrypto") unless extension_enabled?("pgcrypto")

    create_table(:expenses, id: :uuid) do |t|
      t.string(:name, null: false)
      t.decimal(:value, null: false)

      t.timestamps
    end
  end
end
