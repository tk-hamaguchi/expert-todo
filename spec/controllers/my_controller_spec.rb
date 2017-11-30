require 'rails_helper'

RSpec.describe MyController, type: :controller do

  context 'class' do
    subject { described_class }

    it { is_expected.to be_include MyHelper }

    context 'superclass' do
      subject { super().superclass }
      it { is_expected.to eq ApplicationController }
    end
  end

  context '#top' do
    subject { get :top }

    context 'with signed in user' do
      before { sign_in FactoryBot.create(:confirmed_user) }
      context 'response' do
        subject { super() ; response }
        it { is_expected.to have_http_status :ok }
      end
    end

    context 'with unknown user' do
      context 'response' do
        subject { super() ; response }
        it { is_expected.to have_http_status :redirect }
      end
    end

  end

end
