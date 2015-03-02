Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do

      controller :users, path: '/users' do
        match 'current', via: [ :get ]
        match 'timeline', via: [ :get ]
      end

    end
  end
end
