class Company < ApplicationRecord
    has_many :evaluations,dependent: :destroy,foreign_key: "company_id"
    has_many :comments,dependent: :destroy
    ## :inverse_of => :company,
    accepts_nested_attributes_for :evaluations,allow_destroy: true

    validates :company_type, :company_name, presence: true
    validates :company_name, uniqueness: true

    mount_uploader :image, ImageUploader

    def add_error_company
        # nameが空のときにエラーメッセージを追加する
        if company_name.empty?
          errors.add(:company_name, "が空白です")
            errors[:base] << "モデル全体に関係するエラーを追加"
        end

        if company_type.empty?
            errors.add(:company_type, "を選択してください")
            errors[:base] << "モデル全体に関係するエラーを追加"
        end
    end
end
