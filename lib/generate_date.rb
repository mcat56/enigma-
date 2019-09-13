# d.strftime('%a %d %b %Y')    #=> "Sun 04 Feb 2001"
#
# d = DateTime.new(2007,11,19,8,37,48,"-06:00")
#                           #=> #<DateTime: 2007-11-19T08:37:48-0600 ...>
# d.strftime("Printed on %m/%d/%Y")
#
# d = Date.today
#
# d.strftime("%m%d%y")

class GenerateDate < Date
  attr_reader :date

  def initialize
    @date = nil
  end

  def self.generate_date
    d = Date.today
    @date = d.strftime("%d%m%y")
  end

end
