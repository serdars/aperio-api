Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do

      controller :user_sessions, path: '/sessions' do
        match "login", via: [ :post, :options ]
        match "logout", via: [ :delete, :options ]
      end

      controller :users, path: '/users' do
        match 'create', via: [ :post, :options ]
        match 'update', via: [ :put ]
        # Dev routes
        match 'current', via: [ :get ]
        match 'timeline', via: [ :get ]
      end

      controller :organizations, path: '/organizations' do
        match 'create', via: [ :post, :options ]
      end

    end
  end
end
