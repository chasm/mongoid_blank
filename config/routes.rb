MongoidBlank::Application.routes.draw do
  resources :designs, except: [:new, :edit], defaults: { format: :json } do
    resources :periods, except: [:new, :edit], defaults: { format: :json } do
      resources :expectations, except: [:new, :edit], defaults: { format: :json }
    end
  end

  root "formats#index", defaults: { format: :json }
end
