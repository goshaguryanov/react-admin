class Permission < ApplicationRecord
  belongs_to :admin_user
  VERBS = %w[create read update destroy manage].freeze
  validates :verb, inclusion: { in: VERBS }
  validate :subject_defined

  def model
    begin
      subject&.classify&.constantize
    rescue => exception
      ''
    end
  end

  def action
    verb&.to_sym
  end

  private

  def subject_defined
    begin
      subject.classify.constantize
    rescue => exception
      errors.add(:subject, "can't be greater than total value")
    end
  end
end
