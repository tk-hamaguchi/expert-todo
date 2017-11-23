require 'rails_helper'

RSpec.describe "routes for root-path", type: :routing do
  subject { get '/' }
  it { is_expected.to route_to 'welcome#index' }
  context "GET /welcome/index" do
    subject { get 'welcome/index' }
    it { is_expected.to_not be_routable }
  end
end
