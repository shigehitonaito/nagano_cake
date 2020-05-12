class Item < ApplicationRecord

	attachment :image
	belongs_to :genre
	has_many :cart_items
	has_many :order_detiles
def posted_by?(end_user)
	cart_items.where(end_user_id: end_user.id).exists?
end
end
