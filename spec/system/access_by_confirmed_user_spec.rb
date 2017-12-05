require 'rails_helper'

RSpec.feature '確認済ユーザーによるアクセス', type: :system do
  context '確認済ユーザーが' do
    context 'トップページにアクセスしたとき、' do
      scenario 'ログインページにリダイレクトされる' do
        visit root_path
        expect(page.current_path).to eq '/users/sign_in'
      end
    end

    context '未ログイン状態でマイページにアクセスしたとき、' do
      scenario 'ログインページにリダイレクトされる' do
        visit root_path
        expect(page.current_path).to eq '/users/sign_in'
      end
    end

    context 'ログインページからログインしようとしたとき、' do
      let(:user) { FactoryBot.create(:confirmed_user) }
      scenario '"ログインしました。"というメッセージとともにマイページが表示される', js: true do
        visit root_path
        expect(page.current_path).to eq '/users/sign_in'

        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'
        expect(page.current_path).to eq '/my'

        expect(find('#information_area').text).to eq 'ログインしました。'
      end
    end

    context 'マイページにいるとき、' do
      let(:user) { FactoryBot.create(:confirmed_user) }
      scenario 'ユーザーメニューからログアウトできる', js: true do
        visit root_path
        expect(page.current_path).to eq '/users/sign_in'

        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'
        expect(page.current_path).to eq '/my'

        find('.navbar-toggler').click
        expect(find('#navbarDropdown')).to be_visible

        find('#navbarDropdown').click
        within '#navbarSupportedContent' do
          expect(find('.dropdown-menu')).to be_visible
        end

        find('#logoutBtn').click
        expect(page.current_path).to eq '/users/sign_in'

        page.save_screenshot 'hoge.png'
        expect(find('#information_area').text).to eq 'ログアウトしました。'
      end

    end
  end
end
