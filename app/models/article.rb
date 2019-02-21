class Article < ApplicationRecord 

	validates :title, presence: true, length: {minimum:3, maximum:50}
	validates :discription, presence: true, length: {minimum:6, maximum:50}

end 