# frozen_string_literal: true

# Imported files class
class ImportedFile < ApplicationRecord
  include AASM

  belongs_to :user

  aasm do
    state :on_hold, initial: true
    state :processing, :finished, :failed

    event :process do
      transitions from: :on_hold, to: :processing
    end

    event :fail do
      transitions from: :processing, to: :failed
    end

    event :complete do
      transitions from: :processing, to: :finished
    end
  end
end
