require 'rails_helper'

RSpec.describe Tenant, type: :model do
  subject { FactoryBot.build :tenant }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to have_many(:users).dependent(:destroy) }
end
