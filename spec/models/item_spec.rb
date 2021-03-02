require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品出品できる時' do
        it '全ての情報を入力すれば出品できること' do
          expect(@item).to be_valid
        end
      end

      context '商品出品できないとき' do
        it 'nameが空では出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'categoryが空では出品できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'infoが空では出品できない' do
          @item.info = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Info can't be blank")
        end

        it 'sales_statusが空では出品できない' do
          @item.sales_status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Sales status can't be blank")
        end

        it 'shipping_feeが空では登録できない' do
          @item.shipping_fee_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
        end

        it 'prefectureが空では登録できない' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'scheduled_deliveryが空では登録できない' do
          @item.scheduled_delivery_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
        end

        it 'priceが空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'userが紐づいていないと出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end

        it 'priceは、¥300~以下だと出品できない' do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it 'priceは¥9,999,999以上だと出品できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 10000000")
        end

        it 'priceは半角数字でなければ出品できない' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'sales_statusで1を選択している場合登録できない' do
          @item.sales_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Sales status must be other than 1")
        end

        it 'shipping_feeで1を選択している場合登録できない' do
          @item.shipping_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
        end

        it 'prefectureで1を選択している場合登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end

        it 'scheduled_deliveryで1を選択している場合登録できない' do
          @item.scheduled_delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
        end

        it 'categoryで1を選択している場合登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it 'priceが半角英数混合では出品できない' do
          @item.price = '2000yen'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが半角英語だけでは出品できない' do
          @item.price = 'onemillion'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

      end
    end
  end
end
