Rails.application.routes.draw do
  namespace :v1, :defaults => {:format => :json}  do

    controller :users, path: '/users' do
      match '', action: 'create', via: [ :post, :options ]
      match '/:id', action: 'update', via: [ :put, :options ]
      match '/:id', action: 'show', via: [ :get ]
    end

    match '/timeline', to: 'users#timeline', via: [ :get ]
    match '/current_user', to: 'users#current', via: [ :get ]

    match 'logout', to: 'user_sessions#logout', via: [ :options, :delete]
    match 'login', to: 'user_sessions#login', via: [ :options, :post]


    controller :organizations, path: '/organizations' do
      match '', action: 'create', via: [ :post, :options ]
      match '/:id', action: 'update', via: [ :put, :options ]
      match '/:id', action: 'destroy', via: [ :delete, :options ]
      match '/:id', action: 'show', via: [ :get ]
    end

    controller :groups, path: '/groups' do
      match '', action: 'create', via: [ :post, :options ]
      match '/:id', action: 'update', via: [ :put, :options ]
      match '/:id', action: 'destroy', via: [ :delete, :options ]
    end

  end
end
