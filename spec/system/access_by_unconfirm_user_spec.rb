require 'rails_helper'

RSpec.feature '未確認ユーザーによるアクセス', type: :system do
  context '未確認ユーザーが' do
    context 'トップページにアクセスしたとき、' do
      scenario 'ログインページにリダイレクトされる' do
        visit root_path
        expect(page.current_path).to eq '/users/sign_in'
      end
    end

    context 'マイページにアクセスしたとき、' do
      scenario 'ログインページにリダイレクトされる' do
        visit root_path
        expect(page.current_path).to eq '/users/sign_in'
      end
    end

    context 'ログインページからログインしようとしたとき、' do
      let(:user) { FactoryBot.create(:user) }
      scenario 'ログインページにリダイレクトされる', js: true do
        visit root_path
        expect(page.current_path).to eq '/users/sign_in'

        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'

        expect(page.current_path).to eq '/users/sign_in'
      end
    end
  end
end
