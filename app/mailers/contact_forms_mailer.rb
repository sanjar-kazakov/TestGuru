class ContactFormsMailer < ApplicationMailer
  def contact_form_message(contact_form)
    @user = contact_form.user
    @message = contact_form.body
    @phone_number = contact_form.phone_number

    mail(
      to: ENV['SMTP_USERNAME'],
      subject: "New Contact Form message from #{@user.first_name}, #{@user.email}",
      reply_to: @user.email
    ) do |format|
      format.html { render 'contact_form_message' }
      format.text { render plain: "Phone number: #{@phone_number}\n\nMessage:\n#{@message}" }
    end
  end
end
