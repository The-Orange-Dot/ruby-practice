class Article < ApplicationRecord
  has_many :comments, :dependent => :delete_all

  validates :title, presence: true, length: {minimum: 1}
  validates :body, presence: true, length: {minimum: 10}

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status === 'archived'
  end
end
