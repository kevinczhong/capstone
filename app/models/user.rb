class User < ApplicationRecord
  has_many :seller_tours, class_name: "Tour", foreign_key: "buyer_id"
  has_many :buyer_tours, class_name: "Tour", foreign_key: "seller_id"

  def tours
    return seller_tours + buyer_tours
  end
end
