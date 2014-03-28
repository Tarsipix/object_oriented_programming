class Tax
  SALESTAX = 0.10
  IMPORTTAX = 0.05  

  def initialize(price,exempt,imported)
    @importtax = handle_currency(price * IMPORTTAX) if imported
    @salestax = handle_currency(price * SALESTAX) unless exempt
    @price = handle_currency(price.to_f)
    @total = handle_currency(@importtax.to_f + @salestax.to_f + @price.to_f)

    puts "price #{@price} import tax: #{@importtax} sales tax: #{@salestax} total: #{@total}"
  end

  def handle_currency(input_float)
    return ((input_float.to_f) * 100).round.to_f / 100
  end

  def is_exempt?(type)

  end
end

class Parser
  # price = 100
  # exempt = false
  # imported = true
  # tax = Tax.new(price,exempt,imported)

  # test data input 3
  imported_perfume = Tax.new(27.99,false,true)
  local_perfume = Tax.new(18.99,false,false)
  exempt_pills = Tax.new(9.75,true,false)
  exempt_imported_chocolates = Tax.new(11.25,true,true)

  
end