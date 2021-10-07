require 'rails_helper'
RSpec.describe 'ユーザモデル機能', type: :model do
  describe 'バリデーションのテスト' do

    context '名前/メールアドレス/ユーザーID/誕生日/パスワード/確認用パスワードが入力された場合' do
      it "バリデーションが通る" do
        user = FactoryBot.build(:user1)
        expect(user).to be_valid
      end
    end
    context '名前が空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, name: nil)
        expect(user).not_to be_valid
      end
    end
    context '名前が20文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, name: '123456789_123456789_1')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーIDが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, specification: nil)
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーIDが6文字未満の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, specification: 'aaa11')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーIDが10文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, specification: 'aaaaa123456')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーIDに英語が含まれていない場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, specification: '1234567')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーIDに数字が含まれていない場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, specification: 'aaaaaaa')
        expect(user).not_to be_valid
      end
    end
    context '登録済みのユーザーIDを入力した場合' do
      it "バリデーションに引っかかる" do
        user = FactoryBot.create(:user1, specification: 'test111')
        repeat_user = FactoryBot.build(:user1, specification: 'test111')
        expect(repeat_user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, email: nil)
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが6文字未満の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, password: '12345')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが20文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, password: '123456789012345678901')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it "バリデーションに引っかかる" do
        user = FactoryBot.build(:user1, email: nil)
        expect(user).not_to be_valid
      end
    end
    context '登録済みのメールアドレスを入力した場合' do
      it "バリデーションに引っかかる" do
        user = FactoryBot.create(:user1, email: 'aaa@test.com')
        repeat_user = FactoryBot.build(:user1, email: 'aaa@test.com')
        expect(repeat_user).not_to be_valid
      end
    end
    context 'メールアドレスのフォーマットが不正な場合' do
      it 'バリデーションが引っかかる' do
        user = FactoryBot.build(:user1, email: 'aaa.test.com')
        expect(user).not_to be_valid
      end
    end
  end
end
