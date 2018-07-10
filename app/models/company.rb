class Company < ApplicationRecord
    has_many :evaluations,foreign_key: 'company_id',dependent: :destroy
    ## :inverse_of => :company,
    accepts_nested_attributes_for :evaluations,allow_destroy: true
end
