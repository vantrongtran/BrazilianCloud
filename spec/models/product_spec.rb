require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:invoice_details) }
  end
end
