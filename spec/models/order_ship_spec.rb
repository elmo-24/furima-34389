require 'rails_helper'

RSpec.describe OrderShip, type: :model do
  before do
    @order_ship = FactoryBot.build(:order_ship)
  end

  context '商品購入ができる時' do
    it '建物名の記入がなくても登録できること' do
      @order_ship.building_name = ''
      expect(@order_ship).to be_valid
    end

    it "tokenがあれば保存ができること" do
      expect(@order_ship).to be_valid
    end
  
    it '郵便番号、都道府県、市区町村、番地、電話番号があれば保存できること' do
       expect(@order_ship).to be_valid
    end
  end

  context '商品購入ができない時' do
    it '郵便番号の保存にはハイフンが必要であること' do
      @order_ship.postal_code = '1234567'
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it '電話番号は11桁以上だと保存できないこと' do
      @order_ship.phone_number = '0801111222233'
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Phone number is invalid")
    end
  
    it '郵便番号が空だと保存できないこと' do
      @order_ship.postal_code = ''
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Postal code can't be blank")
    end
  
    it '都道府県が空だと保存できないこと' do
      @order_ship.prefecture_id = ''
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Prefecture can't be blank")
    end
  
    it '市区町村が空だと保存できないこと' do
      @order_ship.city = ''
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("City can't be blank")
    end
  
    it '番地が空だと保存できないこと' do
      @order_ship.shipping_address = ''
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Shipping address can't be blank")
    end
  
    it '電話番号が空だと保存できないこと' do
      @order_ship.phone_number = ''
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Phone number can't be blank")
    end
  
    it "tokenが空では登録できないこと" do
      @order_ship.token = ''
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Token can't be blank")
    end

    it '電話番号が全角数字だと登録できないこと' do
      @order_ship.phone_number = '０８０２２２２４４４４'
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号が半角数字のみでないとだと登録できないこと' do
      @order_ship.phone_number = '080-2222-4444'
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Phone number is invalid")
    end

    it 'prefectureで0を選択している場合登録できない' do
      @order_ship.prefecture_id = 0
      @order_ship.valid?
      expect(@order_ship.errors.full_messages).to include("Prefecture can't be blank")
    end
  end
end
