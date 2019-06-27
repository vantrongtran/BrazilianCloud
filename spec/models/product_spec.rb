require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:invoice_details) }
    it { is_expected.to have_many(:invoices).through(:invoice_details) }
    it { is_expected.to have_many(:clients).through(:invoices) }
  end
end
