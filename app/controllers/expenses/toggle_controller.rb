# frozen_string_literal: true

module Expenses
  class ToggleController < ApplicationController
    def create
      expense = Expense.find(params[:expense_id])
      expense.update(paid: !expense.paid)

      render(json: { message: "Success" })
    end
  end
end
