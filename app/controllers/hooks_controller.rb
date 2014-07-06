class HooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def pusher_hooks
    webhook = Pusher::WebHook.new(request)
    if webhook.valid?
      webhook.events.each do |event|
        case event["name"]
        when 'channel_occupied'
          puts "Channel occupied: #{event["channel"]}"
        when 'channel_vacated'
          puts "Channel vacated: #{event["channel"]}"
          @chat_id = event["channel"].split('_').last
          Message.where(chat_id: @chat_id).destroy_all
        when 'member_added'
          puts "Member added: #{event["channel"]}"
          payload = { :event => event["name"], :user_id => event["user_id"], :nickname => ChatUser.find_by(id: event["user_id"]).nickname }
          Pusher[event["channel"]].trigger('presence', payload)
        when 'member_removed'
          puts "Member removed: #{event["channel"]}"
          payload = { :event => event["name"], :user_id => event["user_id"], :nickname => ChatUser.find_by(id: event["user_id"]).nickname }
          Pusher[event["channel"]].trigger('presence', payload)
        end
      end
      render text: 'ok'
    else
      render text: 'invalid', status: 401
    end
  end
  
end
