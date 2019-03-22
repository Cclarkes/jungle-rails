class UserMailer < ApplicationMailer
    default from: "no-reply@jungle.com"

    def email_receipt(user)
        @user = user
        mail(to: @user.email, subject: "Thanks for your order fam!")
    end

end
