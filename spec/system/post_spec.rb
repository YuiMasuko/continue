require 'rails_helper'
RSpec.describe '日常投稿機能', type: :system do

  before do
    @user1 = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    @group1 = FactoryBot.create(:group1)
    FactoryBot.create(:assign, user: @user1, group: @group1)
    FactoryBot.create(:assign, user: @user2, group: @group1)
    @post1 = FactoryBot.create(:post1, user: @user1, group: @group1)
    @post2 = FactoryBot.create(:post1, user: @user2, group: @group1, event_on: '2021-09-01')
  end

  describe 'CRUD機能のテスト' do
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
      it '編集・更新され、投稿一覧ページに遷移する' do
        visit edit_group_post_path(@group1,@post1)
        fill_in 'post[content]', with: 'post_edit'
        click_button '投稿する'
        expect(page).to have_content '日常を編集しました！'
        expect(page).to have_content '投稿一覧'
      end
    end
    context '投稿を削除した場合' do
      before do
        visit edit_group_post_path(@group1,@post1)
      end
      it '削除され、グループトップページに遷移する' do
        click_on '投稿削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '削除しました！'
        expect(page).to have_content '投稿一覧'
      end
    end
  end

  describe '検索機能のテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
      click_link 'グループページへ'
      click_on 'グループの投稿一覧'
    end
    context '投稿者で検索をした場合' do
      it '検索した投稿者の投稿のみが表示される' do
        fill_in 'q[user_name_cont]', with: 'user1'
        click_on '検索'
        expect(page).to have_content 'user1'
        expect(page).to have_no_content 'user2'
      end
    end
    context '投稿日で検索をした場合' do
      it '検索した投稿日の範囲の投稿のみが表示される' do
        fill_in 'q[event_on_gteq]', with: '002021-09-01'
        fill_in 'q[event_on_lteq]', with: '002021-09-30'
        click_on '検索'
        expect(page).to have_content '2021-09-01'
        expect(page).to have_no_content '2021-10-01'
      end
    end
    context '該当する検索がない場合' do
      it 'ページは動かず、該当がないことが通知される' do
        fill_in 'q[user_name_cont]', with: 'user3'
        click_on '検索'
        expect(page).to have_content '該当する投稿がありませんでした'
      end
    end
  end
  describe 'アクセス制限のテスト' do
    before do
      @group2 = FactoryBot.create(:group2)
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context '所属していないグループの投稿一覧ページに遷移しようとした場合' do
      it 'アクセス制限がかかり、遷移することができない' do
        visit group_posts_path(@group2)
        expect(page).to have_content '見られません'
      end
    end
  end
end
