# frozen_string_literal: true

class AddPaidToExpense < ActiveRecord::Migration[7.0]
  def change
    add_column(:expenses, :paid, :boolean, default: false, null: false)
  end
end
