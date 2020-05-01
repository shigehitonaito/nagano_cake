class Item < ApplicationRecord

	attachment :image
	belongs_to :genre
	has_many :cart_items

	

def posted_by?(end_user)
	cart_items.where(end_user_id: end_user.id).exists?
end
end
