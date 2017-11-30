require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do

  context 'class' do
    subject { described_class }

    it { is_expected.to be_include Users::SessionsHelper }

    context 'superclass' do
      subject { super().superclass }
      it { is_expected.to eq Devise::SessionsController }
    end
  end
end
