FactoryBot.define do
  factory :ship do
    postal_code {123-456}
    prefecture_id{2}
    city         {"豊島区"}
    sgipping_address{"青山1-2-3"}
    phone_number    {07022224444}
  end
end
