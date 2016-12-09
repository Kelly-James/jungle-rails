class UserMailer < ApplicationMailer
  default from: 'Jungle Orders <no-reply@jungle.com>'

  def order_confirmation_email(order)
    @order = order
    @email = @order.email
    mail(to: @email, subject: "Order: ##{@order.id}. Thank You for Your Purchase!")
  end
end
