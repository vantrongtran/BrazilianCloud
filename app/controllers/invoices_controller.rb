class InvoicesController < ApplicationController
  before_action :load_invoice, only: %i(show edit update destroy)

  def show
    @invoice_details = @invoice.invoice_details
  end

  def edit
    @products = Product.all
  end

  def create
    if Invoice.create(invoice_params)
      flash[:notice] = "Created"
    else
      flash[:error] = "Can not create"
    end
    redirect_to client_path(invoice_params[:client_id])
  end

  def destroy
    if @invoice.destroy
      flash[:notice] = "Deleted"
    else
      flash[:error] = "Can not detele"
    end
    redirect_to client_path(@invoice.client_id)
  end

  def update
    @invoice.update!(invoice_params)
    redirect_to client_path(@invoice.client_id), flash: { notice: "Updated" }
  end

  private

  def load_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:client_id, invoice_details_params)
  end

  def invoice_details_params
    { invoice_details_attributes: [:product_id, :quantity] }.tap do |attr|
      attr[:invoice_details_attributes].push(:id, :_destroy) if @invoice&.persisted?
    end
  end
end
