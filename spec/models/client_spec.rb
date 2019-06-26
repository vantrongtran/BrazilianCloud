require 'rails_helper'

RSpec.describe Client, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:invoices).dependent(:destroy) }
    it { is_expected.to have_many(:invoice_details).through(:invoices) }
    it { is_expected.to have_many(:products).through(:invoice_details) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :address }
  end
end
