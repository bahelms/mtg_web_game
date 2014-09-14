def signup_with(options)
  confirm = options[:confirm] ? options[:confirm] : options[:password]

  fill_in "Username", with: options[:username]
  fill_in "Email", with: options[:email]
  fill_in "Password", with: options[:password]
  fill_in "Confirm password", with: confirm
  click_button "Create Account"
end

def sign_in_with(options)
  fill_in "Email", with: options[:email]
  fill_in "Password", with: options[:password]
  click_button "Sign In"
end

def update_user(options)
  confirm = options[:confirm] ? options[:confirm] : options[:new_password]

  fill_in "Email", with: options[:email]
  fill_in "Current password", with: options[:password]
  fill_in "New password", with: options[:new_password]
  fill_in "Confirm password", with: confirm
  click_button "Update"
end

