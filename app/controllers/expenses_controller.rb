# frozen_string_literal: true

class ExpensesController < ApplicationController
  def index
    expense = Expense.new
    expenses = Expense.order(:name)

    render(:index, locals: { expense: expense, expenses: expenses })
  end

  def create
    expense = Expense.new(expense_params)

    respond_to do |format|
      if expense.save
        format.html { redirect_to(root_path, notice: "Git!") }
      else
        format.html { render(:index, status: :unprocessable_entity) }
      end
    end
  end

  def edit
    expense = Expense.find(params[:id])
    render(:edit, locals: { expense: })
  end

  def update
    expense = Expense.find(params[:id])
    respond_to do |format|
      if expense.update(expense_params)
        format.html { redirect_to(root_path, notice: "Git!") }
        format.turbo_stream do
          render(turbo_stream: turbo_stream.replace(expense, partial: "expenses/expense", locals: { expense: expense }))
        end
      else
        format.html { render(:edit, status: :unprocessable_entity) }
      end
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    redirect_to(root_path, notice: "Git!")
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :value)
  end
end
