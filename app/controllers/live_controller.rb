class LiveController < ApplicationController
    def create
        live = Live.new message
        if live.save
            WebsocketRails[:posts].trigger 'new', live
        end
    end
    def init
        feed = Feed.where(id: message[:id])
        send_message :init_success, feed.lives,namespace: :live
    end
end
