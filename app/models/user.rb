class User < ActiveRecord::Base
	validates :first_name, presence: true
	validates :username, presence: true, format: { without: /\s/ }, uniqueness:{ case_sensitive: false}

	has_many :comments, dependent: :destroy
	
	has_many :books, dependent: :destroy
end
