class User < ApplicationRecord
  has_many :folders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, omniauth_providers: [:google_oauth2]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]

    end
  end
  enum role: [:user, :moderator, :admin]
  
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
  
  def self.with_role(role)
    where(role: roles[role])
  end

  def self.roles
    { 'User' => 0, 'Moderator' => 1, 'Admin' => 2 }
  end

  def admin?
    role == 'admin'
  end
end
