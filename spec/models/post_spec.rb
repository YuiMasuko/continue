require 'rails_helper'
RSpec.describe 'Postモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user1)
      @group = FactoryBot.create(:group1)
    end

    context '画像が空の場合' do
      it 'バリデーションに引っかかる' do
        post = FactoryBot.build(:post1, image: nil, user: @user, group: @group)
        expect(post).not_to be_valid
      end
    end
    context '日付が空の場合' do
      it 'バリデーションに引っかかる' do
        post = FactoryBot.build(:post1, event_on: nil, user: @user, group: @group)
        expect(post).not_to be_valid
      end
    end
    context '内容が100文字以上の場合' do
      it 'バリデーションに引っかかる' do
        post = FactoryBot.build(:post1, user: @user, group: @group, content: '123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_1')
        expect(post).not_to be_valid
      end
    end
    context '未来の日付を入力した場合' do
      it 'バリデーションに引っかかる' do
        post = FactoryBot.build(:post1, user: @user, group: @group, event_on: '2040-01-01')
        expect(post).not_to be_valid
      end
    end

    context '日付/画像を入力した場合' do
      it 'バリデーションが通る' do
        post = FactoryBot.build(:post1, user: @user, group: @group)
        expect(post).to be_valid
      end
    end


  end
end
