require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:client) }
    it { is_expected.to have_many(:invoice_details).dependent(:destroy) }
    it { is_expected.to have_many(:products).through(:invoice_details) }
  end

  describe "#total_price" do
    subject { invoice.total_price }

    let!(:invoice) { create :invoice }
    let!(:product) { create :product, price: 1 }

    context "without invoice details" do
      it { is_expected.to eq 0 }
    end

    context "with one invoice details" do
      before do
        create :invoice_detail, quantity: 10, invoice: invoice, product: product
      end

      it { is_expected.to eq 10.to_d }
    end

    context "with many invoice details" do
      before do
        create_list :invoice_detail, 10, quantity: 10, invoice: invoice, product: product
      end

      it { is_expected.to eq 100.to_d }
    end
  end
end
