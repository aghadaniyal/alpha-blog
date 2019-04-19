class Article < ApplicationRecord 
	belongs_to :user
	has_many :article_categories
	has_many :categories, through: :article_categories
	has_many :tags, dependent: :destroy
	accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: :all_blank

	validates :title, presence: true, length: {minimum:3, maximum:50}
	validates :description, presence: true, length: {minimum:6, maximum:50}
	validates :user_id, presence: true
	validate  :singular_default_categorie

	def singular_default_categorie
		cats = self.categories.select {|cat| cat.is_default }
		if cats.length > 1
			errors.add(:categories, "Cannot have more then one deafult categories!!!")
		end
	end
	
end 