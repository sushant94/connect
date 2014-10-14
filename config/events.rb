WebsocketRails::EventMap.describe do
  namespace :live do
    subscribe :create, 'live#create'
    subscribe :init, 'live#init'
  end
end
