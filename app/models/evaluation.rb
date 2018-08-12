class Evaluation < ApplicationRecord
      belongs_to :company ,optional: true
      ## :inverse_of => :evaluations
end
