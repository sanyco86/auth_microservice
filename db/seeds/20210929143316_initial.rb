# frozen_string_literal: true
Sequel.seed(:development, :test) do
  require_relative '../../config/environment'

  def run
    user = User.create(name: 'Name', email: 'user@example.com', password: 'password')
    UserSession.create(user_id: user.id)
  end
end
