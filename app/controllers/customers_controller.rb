class CustomersController < ApplicationController

  active_navbar_item :customers

  expose(:customers) do
    customers = Customer.alphabetical
    customers = customers.search(search_query) if search_query.present?
    customers.page params[:page]
  end

  expose(:customer, attributes: :customer_params)

  expose(:search_query) { params[:search] }

  def index
    if request.xhr?
      render partial: 'results'
    else
      render :index
    end
  end

  def create
    if customer.save
      redirect_to customer, notice: 'Customer created'
    else
      render :new
    end
  end

  def update
    if customer.save
      redirect_to customer, notice: 'Customer updated'
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(
      :first_name, :last_name, :date_of_birth, :gender,
      :email, :phone_number, :address1, :address2, :city, :state, :post_code, :country,
      :certification_name, :certification_number, :certification_date, :last_dive_on, :number_of_dives
    )
  end

end
