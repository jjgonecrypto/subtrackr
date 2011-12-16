module SchemesHelper
   def show_amount(amount)
      return number_to_currency(amount) if amount > 0
      "free"
   end
   
   def show_frequency(frequency)
   	  return frequency.first.capitalize
   end	
end
