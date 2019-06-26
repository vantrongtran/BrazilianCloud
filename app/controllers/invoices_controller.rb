class InvoicesController < ApplicationController
  before_action :load_invoice, only: %i(show destroy)

  def show
    @invoice_details = @invoice.invoice_details
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

  private

  def load_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:client_id, invoice_details_attributes: [:product_id, :quantity])
  end
end
