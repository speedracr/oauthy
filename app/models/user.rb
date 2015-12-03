class User < ActiveRecord::Base
  def self.find_or_create_from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create
    user.update(
      name: auth.info.name,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )
    user
  end
end
