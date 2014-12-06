class Autocomplete::CertificationsController < ApplicationController

  expose(:certifications) do
    Certification.all.select do |certification|
      params[:q] && certification.downcase.include?(params[:q].downcase)
    end
  end

  def index
    render json: certifications
  end
end
