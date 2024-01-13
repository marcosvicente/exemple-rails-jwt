Rails.application.routes.draw do
  get 'home/index'
  post 'user/create'
  get 'authentications/login'
end
