class UserMailer < ApplicationMailer
  default from: 'reply@jungle.com'

  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: "Jungle Order \##{@order.id}")
    # @order.email
  end

end
