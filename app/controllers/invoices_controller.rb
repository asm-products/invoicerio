class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices/1
  # GET /invoices/1.json
  def index
    #TODO: Add guards for pages
    @page = params[:page].to_i
    if @page < 1
      @page = 1
    elsif @page > current_user.company.get_number_of_invoice_pages
      @page = current_user.company.get_number_of_invoice_pages
    end
    respond_to do |format|
      format.js
    end
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(create_invoice_params)
    @invoice.save
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:number, :issued_by_company_id, :issued_to_company_id, :date_of_issue, :currency, :draft, :expiration_date)
    end

    def create_invoice_params
      params.require(:invoice).permit(:number, :issued_by_company_id, :issued_to_company_id, :date_of_issue, :currency, :draft, :expiration_date)
    end
end
