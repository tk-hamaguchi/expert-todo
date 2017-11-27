require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  context '#index' do
    subject { get :index }
    context 'with unknown user' do
      it { is_expected.to redirect_to new_user_session_path }
      context 'response' do
        subject { super() ; response }
        it { is_expected.to have_http_status :redirect }
      end
    end

    context 'with logined user' do
      before { sign_in FactoryBot.create(:confirmed_user) }
      it { is_expected.to redirect_to my_path }
    end

    context 'with unconfirm user' do
      before { sign_in FactoryBot.create(:user) }
      it { is_expected.to redirect_to new_user_session_path }
    end
  end
end
