class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipality, :street_address, :building, :telephone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンありで入力してください"}
    validates :shipping_area_id, numericality: {other_than: 1, message: "を選択してください" }
    validates :municipality
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
  end
  


  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(
    postal_code: postal_code,
    shipping_area_id: shipping_area_id,
    municipality: municipality,
    street_address: street_address,
    building: building,
    telephone_number: telephone_number,
    purchase_record_id: purchase_record.id
    )
  end
end