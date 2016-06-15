class Users::RegistrationsController < Devise::RegistrationsController
  add_breadcrumb "Home", :root_path, :title => "Back to DoctorLoans.io Home Page"
  add_breadcrumb "Login", :new_user_session_path, :title => "Back to Login Page"

  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  def new
  super
  add_breadcrumb "Sign Up"
    set_meta_tags title: 'Doctor Loans IO:  Sign Up Page',
              description: 'Sign up to post testimonials about your experience with us and comment on any of our articles.',
              keywords: 'Doctor, mortgage, loan, lender, sign-up'
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
