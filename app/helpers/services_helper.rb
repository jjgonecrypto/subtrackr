module ServicesHelper
	def show_amount(amount)
		return number_to_currency(amount) if amount > 0
	  		"free"
	end

	def show_frequency(frequency)
		return frequency.first.capitalize
	end	

	def service_image(service, type, options = {})
		if service.logo.present?
			image_tag service.logo.url(type), options
		end
	end
end
