class Order < ApplicationRecord

	belongs_to :end_user
	has_many :order_detiles
	enum order_status: { waiting: 0, confilm: 1, doing: 2, prefre: 3, complete: 4 }
end
