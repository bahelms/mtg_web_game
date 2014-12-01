def authenticate
  allow(request.env["warden"]).to receive(:authenticate!) { user }
  allow(controller).to receive(:current_user) { user }
end

