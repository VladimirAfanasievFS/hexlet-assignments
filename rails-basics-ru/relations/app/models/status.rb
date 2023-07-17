# frozen_string_literal: true

class Status < ApplicationRecord
  # BEGIN
  validates :name, inclusion: { in: ['New', 'in Progress', 'Done'] }
  # END
end
