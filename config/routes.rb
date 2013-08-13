MongoidBlank::Application.routes.draw do
  # Because we are supplying our own UUIDs, we'll need some controller
  # actions to get them from the server (I don't depend on Javascript
  # to generate good UUIDs). Here we can generate one or many, returning
  # them in an array in a hash under the key "uuids".
  get "uuids" => "site#uuids", defaults: { format: :json }
  get "uuids/:num" => "site#uuids", defaults: { format: :json }
  
  # We no longer need the POST to /create route, as we will use a PUT
  # to /update to do both create and update (for idempotency)
  resources :designs, except: [:new, :create, :edit], defaults: { format: :json } do
    resources :periods, except: [:new, :create, :edit], defaults: { format: :json } do
      resources :expectations, except: [:new, :create, :edit], defaults: { format: :json }
    end
  end

  root "designs#index", defaults: { format: :json }
end
