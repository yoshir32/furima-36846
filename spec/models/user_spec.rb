require 'rails_helper'

RSpec.describe User, type: :model do

  describe "ユーザー新規登録" do

    context '新期登録できる場合' do
      it "必須項目全てを問題なく入力すれば新規登録ができること" do
        user = User.new(nickname: "てすと", email: "ttt@email", password: "ttt333", password_confirmation: "ttt333", first_name: "ててて", last_name: "すすす", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: 1980-04-05)
        user.valid?
        expect(user).to be_valid
      end
    end

    context '新期登録できない場合' do
      it "ニックネームが空では登録できない" do
        user = User.new(nickname: "", email: "ttt@email", password: "ttt333", password_confirmation: "ttt333", first_name: "ててて", last_name: "すすす", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: 1980-04-05)
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが空だと登録できない" do
        user = User.new(nickname: "てすと", email: "", password: "ttt333", password_confirmation: "ttt333", first_name: "ててて", last_name: "すすす", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: 1980-04-05)
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it "既に登録されているメールアドレスでは登録できない" do
    


      end
      it "＠を含まないメールアドレスは登録できない" do
        user = User.new(nickname: "てすと", email: "testemail", password: "ttt333", password_confirmation: "ttt333", first_name: "ててて", last_name: "すすす", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: 1980-04-05)
        user.valid?
        expect(user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードがなければ登録できない" do
        user = User.new(nickname: "てすと", email: "ttt@email", password: "", password_confirmation: "ttt333", first_name: "ててて", last_name: "すすす", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: 1980-04-05)
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it "６文字以下のパスワードでは登録できない" do
        user = User.new(nickname: "てすと", email: "ttt@email", password: "ttt33", password_confirmation: "ttt33", first_name: "ててて", last_name: "すすす", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: 1980-04-05)
        user.valid?
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは半角英数字両方を含まなければ登録できない" do
        
      end
      it "パスワードと確認用パスワードが一致していないと登録できない" do
        user = User.new(nickname: "てすと", email: "ttt@email", password: "ttt333", password_confirmation: "sss333", first_name: "ててて", last_name: "すすす", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: 1980-04-05)
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameがないと登録できない" do
        user = User.new(nickname: "てすと", email: "ttt@email", password: "ttt333", password_confirmation: "ttt333", first_name: "", last_name: "すすす", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: 1980-04-05)
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameがないと登録できない" do
        user = User.new(nickname: "てすと", email: "ttt@email", password: "ttt333", password_confirmation: "ttt333", first_name: "ててて", last_name: "", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: 1980-04-05)
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_name_kanaがないと登録できない" do
        user = User.new(nickname: "てすと", email: "ttt@email", password: "ttt333", password_confirmation: "ttt333", first_name: "ててて", last_name: "すすす", first_name_kana: "", last_name_kana: "ススス", birthday: 1980-04-05)
        user.valid?
        expect(user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaがないと登録できない" do
        user = User.new(nickname: "てすと", email: "ttt@email", password: "ttt333", password_confirmation: "ttt333", first_name: "ててて", last_name: "すすす", first_name_kana: "テテテ", last_name_kana: "", birthday: 1980-04-05)
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_nameとlast_nameは全角（漢字、ひらがな、カタカナ）でなければ登録できない" do
        user = User.new(nickname: "てすと", email: "ttt@email", password: "ttt333", password_confirmation: "ttt333", first_name: "ﾃﾃﾃ", last_name: "ｽｽｽ", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: 1980-04-05)
        user.valid?
        expect(user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
      end
      it "first_name_kanaとlast_name_kanaは全角（カタカナ）でなければ登録できない" do
        user = User.new(nickname: "てすと", email: "ttt@email", password: "ttt333", password_confirmation: "ttt333", first_name: "ててて", last_name: "すすす", first_name_kana: "ﾃﾃﾃ", last_name_kana: "ｽｽｽ", birthday: 1980-04-05)
        user.valid?
        expect(user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
      end
      it "birthdayがないと登録できない" do
        user = User.new(nickname: "てすと", email: "ttt@email", password: "ttt333", password_confirmation: "ttt333", first_name: "ててて", last_name: "すすす", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: "")
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

  end
end

