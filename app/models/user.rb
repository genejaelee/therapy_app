class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role, polymorphic: true
  has_many :events
  has_many :chats, through: :events
  has_many :chat_users
  accepts_nested_attributes_for :events, :allow_destroy => true
  
  def self.setup_client_therapist_chat(client = {}, therapist = {})
    #skeleton a chatroom for a client and therapist
    if User.find_by(email: client[:email]).nil?
      @user_client = User.create(email: client[:email], role_type: "Client", password: 'password')
      @client = Client.create
      @user_client.role_id = @client.id
      @user_client.save
    else
      @user_client = User.find_by(email: client[:email])
      @client = @user_client.role
    end
    
    if User.find_by(email: therapist[:email]).nil?
      @user_therapist = User.create(email: therapist[:email], role_type: "Therapist", password: 'password')
      @therapist = Therapist.create(first_name: therapist[:first_name], last_name: therapist[:last_name])
      @user_therapist.role_id = @therapist.id
      @user_therapist.save
    else
      @user_therapist = User.find_by(email: therapist[:email])
      @therapist = @user_therapist.role
    end
    
    @event = Event.create(client_id: @client.id, therapist_id: @therapist.id)
    @charge = Charge.create(client_id: @client.id, therapist_id: @therapist.id, event_id: @event.id)
    
    @chat = Chat.create(client_id: @client.id, therapist_id: @therapist.id, event_id: @event.id)
    @chat.channel = "message_channel_" + @chat.id.to_s
    @chat.save
    
    @chat_user_one = ChatUser.create(user_id: @user_client.id, chat_id: @chat.id, nickname: "client_" + Time.now.to_i.to_s)
    @chat_user_two = ChatUser.create(user_id: @user_therapist.id, chat_id: @chat.id, nickname: "therapist_" + Time.now.to_i.to_s)
  end
end
