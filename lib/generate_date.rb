class GenerateDate < Date



  def self.generate_date
    today.strftime("%d%m%y")
  end

end
