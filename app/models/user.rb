class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role, polymorphic: true
  has_many :events
  has_one :chat_user
  accepts_nested_attributes_for :events, :allow_destroy => true
end
