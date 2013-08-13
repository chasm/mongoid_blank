MongoidBlank::Application.routes.draw do
  get "uuids" => "site#uuids", defaults: { format: :json }
  get "uuids/:num" => "site#uuids", defaults: { format: :json }
  
  resources :designs, except: [:new, :create, :edit], defaults: { format: :json } do
    resources :periods, except: [:new, :create, :edit], defaults: { format: :json } do
      resources :expectations, except: [:new, :create, :edit], defaults: { format: :json } do
        member do
          get ':attribute' => "expectations#attribute"
        end
      end
    
      member do
        get ':attribute' => "periods#attribute"
      end
    end
    
    member do
      get ':attribute' => "designs#attribute"
    end
  end

  root "designs#index", defaults: { format: :json }
end
