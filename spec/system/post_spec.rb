require 'rails_helper'
RSpec.describe '日常投稿機能', type: :system do
  before do
    @user1 = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    @group1 = FactoryBot.create(:group1)
    FactoryBot.create(:assign, user: @user1, group: @group1)
    FactoryBot.create(:assign, user: @user2, group: @group1)
    # @post = FactoryBot.create(:post1, user: @user1, group: @group1)

  end

  describe 'CRUD機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context '新規投稿した場合' do
      it '登録され、投稿一覧ページに遷移する' do
      click_link 'グループページへ'
      click_on '日常を投稿する'
      fill_in 'post[event_on]', with: '002021-01-01'
      attach_file 'post[image]', "#{Rails.root}/spec/fixtures/test.jpg", visible: false
      click_on '投稿する'
      expect(page).to have_content '日常を投稿しました！'
      expect(page).to have_content '投稿一覧'
      end
    end
    context '投稿を編集した場合' do
      before do
        click_link 'グループページへ'
        click_on 'グループの投稿一覧'
      end
      it '編集・更新され、投稿一覧ページに遷移する' do
      visit edit_group_post_path(@user1,@post)
      click_on '投稿編集'
      fill_in 'post[content]', with: 'post_edit'
      click_on '投稿する'
      expect(page).to have_content '日常を編集しました！'
      expect(page).to have_content '投稿一覧'
      end
    end

  end


end
