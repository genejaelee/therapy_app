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
        when 'member_added'
          puts "Member added: #{event["channel"]}"
        end
      end
      render text: 'ok'
    else
      render text: 'invalid', status: 401
    end
  end
end
