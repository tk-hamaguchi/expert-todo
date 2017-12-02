require 'rails_helper'

RSpec.feature '不明なユーザーによるアクセス', type: :system do

  context '不明なユーザーが' do
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
  end

end
