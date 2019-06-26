require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:client) }
    it { is_expected.to have_many(:invoice_details).dependent(:destroy) }
    it { is_expected.to have_many(:products).through(:invoice_details) }
  end
end
