class Product < ActiveRecord::Base

	validates_presence_of :title, :description, :image_url, :price
	validates_numericality_of :price
	validates_uniqueness_of :title

	validates_format_of :image_url, 
						:with => %r{\.(gif|png|jpg)$}i,
						:message => "L'image doit etre en gif, png et jpg"

	validate :price_must_be_at_least_a_cent


	def price_must_be_at_least_a_cent
		if self.price.nil? || self.price < 0.01
			self.errors.add(:price, "He, tu veux te ruiner ?")
		end
	end

end
