class Evaluation < ApplicationRecord
      belongs_to :company ,optional: true
      ## :inverse_of => :evaluations

      validates :environment, :salary ,:overtime ,:boss ,:corporate_style ,:management ,:dangerous ,:other ,presence: true

end
