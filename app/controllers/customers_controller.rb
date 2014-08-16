class CustomersController < ApplicationController

  expose(:customers) { Customer.alphabetical }
  expose(:customer, attributes: :customer_params)

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
    params.require(:customer).permit(:first_name, :last_name, :date_of_birth, :gender, :email, :phone_number, :address1, :address2, :city, :state, :post_code, :country, :certification_name, :certification_number, :certification_date, :last_dive_on, :number_of_dives)
  end

end
