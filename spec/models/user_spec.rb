require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it '全ての項目の入力が存在すれば登録できること' do
    expect(@user).to be_valid
  end

  it 'nicknameがない場合は登録できないこと' do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors[:nickname]).to include('を入力してください')
  end

  it 'emailがない場合は登録できないこと' do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include('Eメールを入力してください')
  end

  it 'emailに＠がない場合は登録できないこと' do
    @user.email = 'aaa.com'
    @user.valid?
    expect(@user.errors.full_messages).to include('Eメールは不正な値です')
  end

  it '重複したemailが存在する場合登録できないこと' do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
  end

  it 'passwordがない場合は登録できないこと' do
    @user.password = nil
    @user.valid?
    expect(@user.errors[:password]).to include('を入力してください')
  end

  it 'password半角混合でない場合は登録できないこと' do
    @user.password = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めて設定してください')
  end

  it 'password半角混合でない場合は登録できないこと' do
    @user.password = '123456'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めて設定してください')
  end

  it 'passwordが全角では登録できないこと' do
    @user.password = 'AAAAAA'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めて設定してください')
  end

  it 'passwordが英数字混合だが、字数が5文字以下であれば登録できないこと' do
    @user.password = 'ab123'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
  end

  it 'passwordとpassword_confirmationが不一致では登録できないこと' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは英字と数字の両方を含めて設定してください')
  end

  it 'last_nameがない場合は登録できないこと' do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors[:last_name]).to include('を入力してください')
  end

  it 'last_nameが全角文字でない場合は登録できないこと' do
    @user.last_name = 'nakamura'
    @user.valid?
    expect(@user.errors[:last_name]).to include('は全角文字を使用してください')
  end

  it 'last_name_kanaがない場合は登録できないこと' do
    @user.last_name_kana = nil
    @user.valid?
    expect(@user.errors[:last_name_kana]).to include('を入力してください')
  end

  it 'last_name_kanaがカタカナでない場合は登録できないこと' do
    @user.last_name_kana = '中むら'
    @user.valid?
    expect(@user.errors[:last_name_kana]).to include('は全角カナを使用してください')
  end

  it 'first_nameがない場合は登録できないこと' do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors[:first_name]).to include('を入力してください')
  end

  it 'first_nameが全角文字でない場合は登録できないこと' do
    @user.first_name = 'taichi'
    @user.valid?
    expect(@user.errors[:first_name]).to include('は全角文字を使用してください')
  end

  it 'first_name_kanaがない場合は登録できないこと' do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors[:first_name_kana]).to include('を入力してください')
  end

  it 'first_name_kanaがカタカナでない場合は登録できないこと' do
    @user.first_name_kana = '中むら'
    @user.valid?
    expect(@user.errors[:first_name_kana]).to include('は全角カナを使用してください')
  end

  it 'birth_dayがない場合は登録できないこと' do
    @user.birth_day = nil
    @user.valid?
    expect(@user.errors[:birth_day]).to include('を入力してください')
  end
end
