require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  it '全ての項目の入力が存在すれば登録できること' do
    expect(@item).to be_valid
  end

  it 'titleがない場合は登録できないこと' do
    @item.title = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('Titleを入力してください')
  end

  it 'textがない場合は登録できないこと' do
    @item.text = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('Textを入力してください')
  end

  it '商品画像がない場合は登録できないこと' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('Imageを入力してください')
  end

  it 'priceがない場合は登録できないこと' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('Priceは範囲以内の価格で記述してください')
  end

  it '価格が半角英数字でない場合は登録できないこと' do
    @item.price = '１２３４５６'
    @item.valid?
    expect(@item.errors.full_messages).to include('Priceは範囲以内の価格で記述してください')
  end

  it '価格が300以下場合は登録できないこと' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include('Priceは範囲以内の価格で記述してください')
  end

  it '価格が999,999,999以上の場合は登録できないこと' do
    @item.price = 1_000_000_000
    @item.valid?
    expect(@item.errors.full_messages).to include('Priceは範囲以内の価格で記述してください')
  end

  it 'days_idがない場合は登録できないこと' do
    @item.days_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('Daysは数値で入力してください')
  end

  it 'status_idがない場合は登録できないこと' do
    @item.status_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('Statusは数値で入力してください')
  end

  it 'prefecture_idがない場合は登録できないこと' do
    @item.prefecture_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('Prefectureは数値で入力してください')
  end

  it 'category_idがない場合は登録できないこと' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('Categoryは数値で入力してください')
  end
end
