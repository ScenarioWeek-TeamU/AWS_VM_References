class Reference < ApplicationRecord
    belongs_to :project
    belongs_to :user

    validates :ref_title, presence: true
    validates :user_id, presence: true
    validates :project_id, presence: true
end
