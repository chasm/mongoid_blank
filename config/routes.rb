MongoidBlank::Application.routes.draw do
  get "uuids" => "site#uuids", defaults: { format: :json }
  get "uuids/:num" => "site#uuids", defaults: { format: :json }
  
  resources :designs, except: [:new, :create, :edit], defaults: { format: :json } do
    resources :periods, except: [:new, :create, :edit], defaults: { format: :json } do
      resources :expectations, except: [:new, :create, :edit], defaults: { format: :json } do
        # We add a "member" route, which will have the following pattern:
        # /designs/:design_id/periods/:period_id/expectations/:id/:attribute
        # and pass it to the attribute action on the controller
        member do
          get ':attribute' => "expectations#attribute"
          patch ':attribute' => "expectations#attribute"
        end
      end
    
      # We want to do this *after* the nested expectations so that
      # /designs/:design_id/periods/:period_id/expectations
      # is not interpreted as looking for the expectations attribute
      member do
        get ':attribute' => "periods#attribute"
        patch ':attribute' => "periods#attribute"
      end
    end
    
    member do
      get ':attribute' => "designs#attribute"
      patch ':attribute' => "designs#attribute"
    end
  end

  root "designs#index", defaults: { format: :json }
end
