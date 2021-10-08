require 'rails_helper'
RSpec.describe 'コメント機能', type: :system do
  before do
    @user1 = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    @group1 = FactoryBot.create(:group1)
    FactoryBot.create(:assign, user: @user1, group: @group1)
    FactoryBot.create(:assign, user: @user2, group: @group1)
    @post = FactoryBot.create(:post1, user: @user2, group: @group1)
  end

  describe 'コメント投稿・削除のテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
      visit group_post_path(@group1, @post)
    end
    context 'コメントを投稿した場合' do
      it '作成したコメントが表示される' do
        fill_in 'comment[content]', with: 'new_comment'
        click_on 'コメントする'
        expect(page).to have_content 'new_comment'
      end
    end
    context '削除ボタンを押した場合' do
      before do
        fill_in 'comment[content]', with: 'destroy_test'
        click_on 'コメントする'
      end
      it 'コメントが削除される' do
        click_link '削除'
        expect(page).to have_no_content 'destroy_test'
      end
    end
  end
end
