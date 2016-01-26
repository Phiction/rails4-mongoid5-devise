class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  # database authenticatable
  field :email, type: String, default: ""
  field :encrypted_password, type: String, default: ""
  
  # recoverable
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: Time
  
  # rememberable
  field :remember_created_at, type: Time
  
  # trackable
  field :sign_in_count, type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at, type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip, type: String
  
  field :first_name, type: String
  field :last_name, type: String
  field :admin, type: Boolean, default: false
  field :super_admin, type: Boolean, default: false
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, on: :update
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
end
