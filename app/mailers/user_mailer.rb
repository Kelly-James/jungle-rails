class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation_email(order)
    @order = order
    @url   = 'http://localhost:3000/login/'
    mail(to: @order.email, subject: 'Thank You for Your Order! Order ID: #{@order.id}')
  end
end
