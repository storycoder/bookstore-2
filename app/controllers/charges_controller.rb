class ChargesController < ApplicationController
	
	def create
		# Amt in cents, USD

		customer = Stripe::Customer.create(
			:email => current_student.email,
			:card => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer => customer.id,
			:description => 'Rails bookstore customer charge',
			:currency => 'usd',
			:amount => session[:total_charges].to_i
		)
	end

end
