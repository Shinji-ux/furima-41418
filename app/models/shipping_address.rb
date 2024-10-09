class ShippingAddress < ApplicationRecord
  belongs_to :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_area
end





