FactoryBot.define do
  factory :order_ship do
    token {"tok_abcdefghijk00000000000000000"}

    postal_code     {"123-4567"}
    prefecture_id   {2}
    city            {"豊島区"}
    shipping_address{"青山1-2-3"}
    phone_number    {"07022224444"}
    building_name   {'栄ビル'}

  end
end
