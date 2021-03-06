require 'rails_helper'
RSpec.describe 'Groupモデル機能', type: :model do

  describe 'バリデーションのテスト' do

    context '名前が空の場合' do
      it 'バリデーションに引っかかる' do
        group = FactoryBot.build(:group1, name: nil)
        expect(group).not_to be_valid
      end
    end
    context '名前が75文字以上の場合' do
      it 'バリデーションに引っかかる' do
        group = FactoryBot.build(:group1, name: 'g'*76)
        expect(group).not_to be_valid
      end
    end
    context '名前が75文字未満の場合' do
      it 'バリデーションが通る' do
        group = FactoryBot.build(:group1)
        expect(group).to be_valid
      end
    end
  end
end
