require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品を出品できる場合' do
      it '必要な情報を入力すれば出品できること' do
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context '商品を出品できない場合' do
      it '商品名がないと出品できない' do
      end
      it '商品の説明がないと出品できない' do
      end
      it '商品の画像がないと出品できない' do
      end
      it 'カテゴリーの情報がないと出品できない' do
      end
      it '商品の状態の情報がないと出品できない' do
      end
      it '配送料の負担の情報がないと出品できない' do
      end
      it '発送元地域の情報がないと出品できない' do
      end
      it '発送までの日数の情報がないと出品できない' do
      end
      it '価格の情報がないと出品できない' do
      end
      it '価格は¥300~9,999,999の間でないと設定できない' do
      end
      it '価格は半角数字でないと設定できない' do
      end
      
    end

  end
end