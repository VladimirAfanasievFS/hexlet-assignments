# frozen_string_literal: true

class Vacancy < ApplicationRecord
  include AASM

  validates :title, presence: true
  validates :description, presence: true

  # BEGIN
  aasm do
    # Начальное состояние
    state :on_moderate, initial: true
    state :published
    state :archived

    # Событие и переходы
    event :publish do
      transitions from: :on_moderate, to: :published
    end

    event :archive do
      transitions from: %i[on_moderate publish], to: :archived
    end
  end
  # END
end
