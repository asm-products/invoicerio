class HomeController < ApplicationController
  def index
    if current_user.company == nil
      redirect_to new_user_company_path
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

  def edit
  end

  def update
  end
end
