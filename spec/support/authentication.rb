def signup_with(options)
  confirm = options[:confirm] ? options[:confirm] : options[:password]

  fill_in "Username", with: options[:username]
  fill_in "Email", with: options[:email]
  fill_in "Password", with: options[:password]
  fill_in "Confirm password", with: confirm
  click_button "Sign Up"
end
