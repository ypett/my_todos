class UserTask < ApplicationRecord
  validates :description, presence: { message: "Task must be entered, please!" }
  validate :due_date_cannot_be_in_the_past

  paginates_per 5

  def due_date_cannot_be_in_the_past
    if due.present? && due < Date.today
      errors.add(:due, "Please enter today's date or future due date.")
    end
  end
end
