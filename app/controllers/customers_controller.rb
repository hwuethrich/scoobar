class CustomersController < ApplicationController

  active_navbar_item :customers

  expose(:customers) do
    if search_query.present?
      Customer.
        alphabetical.
        search(search_query).
        page params[:page]
    else
      Customer.
        recent(10)
    end
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

  def destroy
    customer.destroy
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
