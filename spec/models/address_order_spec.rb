require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.create(:item)
      @address_order = FactoryBot.build(:address_order,user_id: @user.id,item_id:@item.id)
      sleep(0.1)
    end


    context '商品購入ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address_order).to be_valid
      end
    end

    context '商品購入ができない時' do
    it 'postal_codeが空だと保存できないこと' do
      @address_order.postal_code = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Postal codeを入力してください")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @address_order.postal_code = '1234567'
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Postal codeis invalid. Include hyphen(-)")    
    end

    it 'phone_numberが空だと保存できないこと' do
      @address_order.phone_number = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Phone numberを入力してください")
    end

    it 'phone_numberはハイフンがあると保存できないこと' do
      @address_order.phone_number = '123-4567-8910'
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Phone numberは不正な値です")
    end

    it 'phone_numberは11以上あると保存できないこと' do
      @address_order.phone_number = '123456789012'
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Phone numberは不正な値です")
    end
   

    it 'prefectureを選択していないと保存できないこと' do
      @address_order.prefecture_id = 0
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Prefecturecan't be blank")
    end

    it 'cityが空だと保存できないこと' do
      @address_order.city = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Cityを入力してください")
    end

    it 'building_numberが空だと保存できないこと' do
      @address_order.building_number = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Building numberを入力してください")
    end

    
    it 'tokenが空だと保存できないこと' do
      @address_order.token = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Tokenを入力してください")
    end
    
    it 'building_nameは空でも保存できること' do
      @address_order.building_name = nil
      expect(@address_order).to be_valid
    end
  end
  end
end