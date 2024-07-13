class ContactFormsController < ApplicationController
  before_action :authenticate_user!


  def new
    @contact_form = ContactForm.new
  end


  def create
    @contact_form = current_user.contact_forms.new(form_params)
    if @contact_form.save
      ContactFormsMailer.contact_form_message(@contact_form).deliver_now
      redirect_to root_path, notice: t('.success')
    else
      render :new
    end
  end


  private

  def form_params
    params.require(:contact_form).permit(:email, :phone_number, :body)
  end

 end
