require 'csv'


module Parser

  def parse(filepath)
    CSV.open(filepath, headers: true, header_converters: :symbol)
  end


end
