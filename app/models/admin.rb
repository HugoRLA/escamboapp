class Admin < ActiveRecord::Base

  ROLES = {:full_access => 0, :restricted_access => 1}

  enum role: ROLES

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :with_restricted_access, -> {where(role: ROLES[:restricted_access])}

  def role_desc
    if self.role == 'full_access'
      'Full Access'
    else
      'Restricted Access'
    end
  end
end
