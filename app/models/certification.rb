class Certification

  def self.all
    Customer
      .distinct(:certification_name)
      .pluck(:certification_name)
      .compact.sort
  end

end
