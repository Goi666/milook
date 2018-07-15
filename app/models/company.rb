class Company < ApplicationRecord
    has_many :evaluations,dependent: :destroy,foreign_key: "company_id"
    has_many :comments,dependent: :destroy
    ## :inverse_of => :company,
    accepts_nested_attributes_for :evaluations,allow_destroy: true
end
