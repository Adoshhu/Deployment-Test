class Folder < ApplicationRecord
    belongs_to :user
    attribute :user_id, :integer
    validates :folderName, presence: true
    has_many_attached :files
end
    
    