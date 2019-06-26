require 'rails_helper'

RSpec.describe User, type: :model do
  let(:invalid_email) { "test@test" }
  let(:valid_email) { "test@test.com" }

  context "validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to allow_value(valid_email).for :email }
    it { is_expected.not_to allow_value(invalid_email).for :email }
  end
end
