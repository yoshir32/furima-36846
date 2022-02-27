require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep(0.3)
    end

    context '商品が購入できる場合' do
      it '適切な情報を入力すると商品が購入できる' do
        @order_address.valid?
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it '郵便番号がないと購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code can't be blank"
      end
      it '郵便番号は、ハイフンがないと保存できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end
      it '都道府県がないと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市町村がないと購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Municipality can't be blank"
      end
      it '番地がないと購入できない' do
        @order_address.street_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Street number can't be blank"
      end
      it '電話番号がないと購入できない' do
        @order_address.telephone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone can't be blank"
      end
      it '電話番号は、半角数値でないと購入できない' do
        @order_address.telephone = '１２３４５６７８９１０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone is invalid"
      end
      it '電話番号は、10桁以上11桁以内でないと購入できない' do
        @order_address.telephone = '123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone is invalid"
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      
    end

    
  end
end
