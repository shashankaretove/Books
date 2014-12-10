class Book < ActiveRecord::Base
	validates :title, presence: true
	validates :author, presence: true

	has_many :comments, dependent: :destroy
	
	belongs_to :user
end
