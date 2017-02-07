Rails.application.routes.draw do
  use_doorkeeper

  devise_for :users,
  only: :registrations,
  controllers: {
    registrations: 'users/registrations'
  }

  # namespace :api do
  #
  #   namespace :v1 do
  #     get 'users/sync', to: 'users#sync'
  #   end
  #
  # end

  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      get 'users/sync', to: 'users#sync'
    end
  end
end
