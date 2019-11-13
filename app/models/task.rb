class Task < ApplicationRecord
  belongs_to :user

  before_validation :set_status, on: :create
  validates :description, :name, :end_time, :status, presence: true
  validate :end_time_in_past?

  default_scope -> { where(deleted_at: nil) }

  enum status: %i[to_do doing done]

  def soft_delete
    update(deleted_at: Time.current) if self.deleted_at.nil?
  end

  def self.find_tasks_by_user(user_id = 1)
    {
        to_do: self.where('status = ? AND user_id = ?', 0, user_id),
        doing: self.where('status = ? AND user_id = ?', 1, user_id),
        done: self.where('status = ? AND user_id = ?', 2, user_id)
    }
  end

  def self.find_deleted_tasks(user_id)
    self.unscope(:where).where('user_id = ?', user_id).where.not(deleted_at: nil)
  end

  private

  def set_status
    self.status = :to_do if self.status.nil?
  end

  def end_time_in_past?
    if end_time.present? && end_time < Date.today
      errors.add(:end_time, "can't be in the past")
    end
  end
end
