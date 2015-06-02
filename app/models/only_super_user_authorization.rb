class OnlySuperUserAuthorization < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    # Everyone can read
    if action == :read
      return true
    end

    # Admin user can do everything
    if user.email == 'laura@swansway.com'
      return true
    end

    # No create, update, delete access by default
    false
  end
end
