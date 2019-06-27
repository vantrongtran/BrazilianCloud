require 'rails_helper'

RSpec.describe InvoiceDetail, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:invoice) }
    it { is_expected.to belong_to(:product) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :quantity }
  end

  describe "delegate" do
    it { is_expected.to delegate_method(:name).to(:product).with_prefix(true) }
    it { is_expected.to delegate_method(:unit).to(:product).with_prefix(true) }
  end

  describe "#total_price" do
    subject { invoice_detail.total_price }

    let!(:product) { create :product, price: 1 }

    context "return 0 with quantity = 0" do
      let(:invoice_detail) { create :invoice_detail, product: product, quantity: 0 }

      it { is_expected.to eq 0 }
    end

    context "retun 10 with and quantity = 10" do
      let(:invoice_detail) { create :invoice_detail, product: product, quantity: 10 }

      it { is_expected.to eq 10.to_d }
    end
  end

  describe "#set_price" do
    let(:invoice_detail) { create :invoice_detail, quantity: 0 }

    context "update price equal product's price after create" do
      it { expect(invoice_detail.price).to eq invoice_detail.product.price }
    end
  end
end
