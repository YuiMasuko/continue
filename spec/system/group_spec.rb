require 'rails_helper'
RSpec.describe 'グループ機能', type: :system do
  before do
    @user1 = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    @group1 = FactoryBot.create(:group1)

    FactoryBot.create(:assign, user: @user1, group: @group1)
    FactoryBot.create(:assign, user: @user2, group: @group1)
  end

  describe 'グループの新規登録のテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context 'グループの登録操作をした場合' do
      it 'グループが作成され、グループページに遷移する' do
      click_link 'グループ新規作成'
      fill_in 'group[name]', with: 'group_new'
      click_button '実行'
      expect(page).to have_content 'group_newグループ'
      end
    end
  end

  describe 'グループ編集のテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
      click_link 'グループページへ'
    end
    context 'グループの編集操作をした場合' do
      it 'グループが編集・更新され、グループページに遷移する' do
      click_link 'グループ編集'
      fill_in 'group[name]', with: 'group_edit'
      click_button '実行'
      expect(page).to have_content 'group_editグループ'
      end
    end
  end

  describe 'グループ退会のテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
      click_link 'グループページへ'
    end
    context 'メンバーが２人以上いる場合' do
      it 'グループを退会できる' do
      click_link '退会'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'グループから退会しました'
      end
    end
    context 'メンバーが自分だけの場合' do
      before do
        click_link '退会'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'グループから退会しました'
        click_link 'ログアウト'
        visit new_user_session_path
        fill_in 'user[email]', with: 'user2@gmail.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
        click_link 'グループページへ'
      end
      it 'グループを退会できない' do
      click_link '退会'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content '退会できません'
      end
    end
  end

  describe 'グループ招待のテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
      click_link 'グループページへ'
    end
    context '招待したいユーザーのidと誕生日を入力した場合' do
      it '一致すると、グループに招待できる' do
        click_link 'メンバー招待'
        fill_in 'specification', with: 'user02'
        fill_in 'birthday', with: '001990-01-02'
        click_on '招待する'
        expect(page).to have_content 'user2'
      end
      it '一致しないと、グループに招待できない' do
        click_link 'メンバー招待'
        fill_in 'specification', with: 'user00'
        fill_in 'birthday', with: '001990-01-02'
        click_on '招待する'
        expect(page).to have_content 'ユーザーが見つかりませんでした'
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
    context '所属していないグループのページに遷移しようとした場合' do
      it 'アクセス制限がかかり、遷移することができない' do
        visit group_path(@group2)
        expect(page).to have_content '見られません'
      end
    end
  end
end
