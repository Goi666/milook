class Company < ApplicationRecord
    has_many :evaluations,dependent: :destroy
    ## :inverse_of => :company,
    accepts_nested_attributes_for :evaluations,allow_destroy: true
end
