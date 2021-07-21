require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、
      kana_last_name、kana_first_name、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123rok'
        @user.password_confirmation = '123rok'
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに＠がないと登録できない' do
      @user.email = 'mail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードが6文字以上でないと登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードが半角数字のみの場合は登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードが半角英字のみの場合は登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードが全角の場合は登録できない' do
      @user.password = 'ＨＨＨＨＨＨ'
      @user.password_confirmation = 'ＨＨＨＨＨＨ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードとパスワード（確認）の値が一致していないと登録できない' do
      @user.password = '12345q'
      @user.password_confirmation = '123456q'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名前（名字）が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '名前（名字）が全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
      @user.first_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it '名前（名前）が空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it '名前（名前）が全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
      @user.last_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it '名前（カタカナ）（名字）が空では登録できない' do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end
    it '名前（カタカナ）（名字）が全角（カタカナ）での入力でないと登録できない' do
      @user.kana_first_name = 'かな'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana first name is invalid')
    end
    it '名前（カタカナ）(名前）が空では登録できない' do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end
    it '名前（カタカナ）(名前）が全角（カタカナ）での入力でないと登録できない' do
      @user.kana_last_name = 'かな'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana last name is invalid')
    end
    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
end
