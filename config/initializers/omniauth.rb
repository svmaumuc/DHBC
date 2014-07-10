OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '630968500350039', 'a61e7cb5a59700e79f50ed136ad9099c', scope: "user_birthday"
end

OmniAuth.config.on_failure = Proc.new do |env|
  LoginController.action(:omniauth_failure).call(env)
  #this will invoke the omniauth_failure action in UsersController.
end