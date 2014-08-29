class RegistrationsController < Devise::RegistrationsController

  # GET /resource/sign_up
  def new
    resource = build_resource({})
    resource.build_company
    respond_with resource
  end
end
