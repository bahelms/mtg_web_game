def authenticate
  allow_message_expectations_on_nil
  allow(request.env["warden"]).to receive(:authenticate!) { user }
  allow(controller).to receive(:current_user) { user }
end

