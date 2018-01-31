clasattributesActiveRecord::Base

  enum role: [:full_access, :restricted_access]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role_desc
    if self.role == 'full_access'
      'Full Access'
    else
      'Restricted Access'
    end
  end
end
