require 'rails_helper'

RSpec.describe User, type: :model do
  before do # 先にデータを入れる。 factoriesのusers.rbを参照する。
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = '' # nicknameの値を空にする
      @user.valid? # valid?は、バリデーションを実行させて、エラーがあるかどうかを判断するメソッドです。
      # エラーがない場合はtrueを、ある場合はfalseを返します。
      expect(@user.errors.full_messages).to include("Nickname can't be blank") # include（）で（）のエラーが発生するか。発生したらtrueで終了
    end
    it 'emailが空では登録できない' do
      @user.email = '' # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること。' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが必須であること。' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'password'
      @user.password_confirmation = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = 'aa123456'
      @user.password_confirmation = 'aa123456'
      expect(@user).to be_valid
    end

    it 'パスワードとパスワード（確認）が一致しない場合、エラーメッセージが表示されること' do
      @user.password = 'password1'
      @user.password_confirmation = 'password2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'お名前(全角)は、名字と名前がそれぞれ必須であること。' do
      @user.first_name = ''
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank")
    end

    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
      @user.first_name = 'ｳｵｼﾞ'
      @user.last_name = 'ｱｷﾉﾘ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name は全角で入力してください', 'Last name は全角で入力してください')
    end

    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること。' do
      @user.first_name_kana = ''
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "Last name kana can't be blank")
    end

    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
      @user.first_name_kana = 'ﾀﾛｳ'
      @user.last_name_kana = 'ｼﾞﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力してください', 'Last name kana は全角カタカナで入力してください')
    end

    it '生年月日が必須であること。' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
