require 'rails_helper'

RSpec.describe InvoiceDetail, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:invoice) }
    it { is_expected.to belong_to(:product) }
  end
end
