class OrderDetile < ApplicationRecord
	belongs_to :order
	belongs_to :item
	enum production_status: { notyet: 0, waiting: 1, doing: 2, complete: 3 }
end
