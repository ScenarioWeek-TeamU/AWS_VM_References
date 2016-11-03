class Project < ApplicationRecord
    belongs_to :user
    has_many :references

    validates :title, presence: true
    validates :user_id, presence: true
end
