require 'rails_helper'
RSpec.describe 'Assignモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user1)
      @group = FactoryBot.create(:group1)
    end
    context 'ユーザーに紐づいていない場合' do
      it 'バリデーションに引っかかる' do
        group = FactoryBot.build(:assign, group: @group)
        expect(group).not_to be_valid
      end
    end
    context 'グループに紐づいていない場合' do
      it 'バリデーションに引っかかる' do
        group = FactoryBot.build(:assign, user: @user)
        expect(group).not_to be_valid
      end
    end
    context 'グループとユーザーに紐づいている場合' do
      it 'バリデーションが通る' do
        group = FactoryBot.build(:assign, user: @user, group: @group)
        expect(group).to be_valid
      end
    end
  end
end
