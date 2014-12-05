class CustomersController < ApplicationController

  active_navbar_item :customers

  expose(:customers) do
    customers = Customer.alphabetical
    customers = customers.search(search_query) if search_query.present?
    customers.page params[:page]
  end

  expose(:customer, attributes: :customer_params)

  expose(:search_query) { params[:search] }

  def create
    customer.save
    respond_with customer
  end

  def update
    customer.save
    respond_with customer
  end

  private

  def customer_params
    params.require(:customer).permit(
      :first_name, :last_name, :date_of_birth, :gender,
      :email, :phone_number, :address1, :address2, :city, :state, :post_code, :country,
      :certification_name, :certification_number, :certification_date, :last_dive_on, :number_of_dives,
      :hotel_name, :room_number
    )
  end

end
