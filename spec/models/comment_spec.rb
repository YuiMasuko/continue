require 'rails_helper'
RSpec.describe 'Commentモデル機能', type: :model do
  describe 'バリデーションのテスト' do
  before do
    @user = FactoryBot.create(:user1)
    @group = FactoryBot.create(:group1)
  end
  context '名前が空の場合' do
    it 'バリデーションに引っかかる' do
      group = FactoryBot.build(:group1, name: nil)
      expect(group).not_to be_valid
      end
    end
  end
end
