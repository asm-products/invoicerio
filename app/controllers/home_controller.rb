class HomeController < ApplicationController
  def index
    if current_user.company == nil
      redirect_to new_user_company_path
    else
      @invoices = current_user.company.get_invoices_by_page(1)
      @clients  = current_user.company.get_clients_by_page(1)
    end
  end

  # used for creating a company, after signing up
  # GET /company
  def new_company
    @company = Company.new
  end

  # used for creating a company, after signing up
  def create_company
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.save
      redirect_to home_index_path
    else
      render :new_company
    end
  end

  def edit_company
    @company = current_user.company
  end

  def update_company
  end

  private
  def company_params
    params.require(:company).permit(:name, :address, :city, :country, :phone)
  end
end
