class UserMailer < ApplicationMailer
    default from: "no-reply@jungle.com"

    def email_receipt(user, order)
        @user = user
        @order = order
        @products = order.line_items
        if @user
        mail(to: @user.email, subject: "Thanks for your order fam! #{@order.id}")
        else
        return
        end
    end

end
