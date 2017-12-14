class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :project
	validates :text,:user_id,:project_id, presence: true
end
