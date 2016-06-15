class Users::SessionsController < Devise::SessionsController
  add_breadcrumb "Home", :root_path, :title => "Back to Doctor Loans IO Home Page"
  add_breadcrumb "Login"
before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
  super
  set_meta_tags title: 'Doctor Loans IO:  Login Page',
              description: 'Login to post testimonials about your experience with us and comment on any of our articles.',
              keywords: 'Doctor, mortgage, loan, lender, Login'
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected


  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
