require 'rails_helper'

RSpec.describe User, type: :model do

  describe "ユーザー新規登録" do

    it "必須項目全てを問題なく入力すれば新規登録ができること" do
    
    end
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
    
    end
    it "パスワードがなければ登録できない" do
      user = User.new(nickname: "てすと", email: "ttt@email", password: "", password_confirmation: "ttt333", first_name: "ててて", last_name: "すすす", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: 1980-04-05)
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "６文字以下のパスワードでは登録できない" do
    
    end
    it "パスワードは半角英数字両方を含まなければ登録できない" do
    
    end
    it "パスワードと確認用パスワードが一致していないと登録できない" do
    
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
    
    end
    it "first_name_kanaとlast_name_kanaは全角（カタカナ）でなければ登録できない" do
    
    end
    it "birthdayがないと登録できない" do
      user = User.new(nickname: "てすと", email: "ttt@email", password: "ttt333", password_confirmation: "ttt333", first_name: "ててて", last_name: "すすす", first_name_kana: "テテテ", last_name_kana: "ススス", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end


  end
end

