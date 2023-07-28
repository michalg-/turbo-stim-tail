# frozen_string_literal: true

class Expense < ApplicationRecord
  validates :name, presence: true
  validates :value, numericality: true, presence: true
end
