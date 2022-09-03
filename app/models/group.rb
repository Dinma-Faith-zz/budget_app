class Category < ApplicationRecord
    belongs_to :user
    has_many :group_records, dependent: :destroy
    has_many :records, through: :group_records, dependent: :destroy

    validates :name, presence: true
    validates :icon, presence: true
  end
