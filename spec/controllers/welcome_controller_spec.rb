require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  context '#index' do
    subject { get :index }
    context 'response' do
      subject { super() ; response }
      it { is_expected.to have_http_status :success }
      it { is_expected.to have_http_status :ok }
    end
  end
end
