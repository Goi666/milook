class Comment < ApplicationRecord
    belongs_to :company ,optional: true
    belongs_to :user ,optional: true

    validates :content, presence: true
end
