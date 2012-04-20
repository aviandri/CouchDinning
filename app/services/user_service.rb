class UserService
  class << self
    def create(params)
      user = User.create(params)
      user.ensure_authentication_token
      user.save!
      user
    end
  end
end