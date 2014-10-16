module Autocomplete
  class CustomersController < ApplicationController

    expose(:customers) do
      customers = Customer.alphabetical
      customers = customers.search(params[:q]) if params[:q].present?
      customers.limit(10)
    end

    expose(:customer)

  end
end
