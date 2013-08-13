MongoidBlank::Application.routes.draw do
  # We're doing a JSON API so we don't need the new or edit HTML forms
  # We set the default to JSON so we don't have to add ".json" to the URLs
  resources :designs, except: [:new, :edit], defaults: { format: :json } do
    # Nesting the resources inside each other means that the periods (e.g.)
    # are accessible only via a design and the expectations only via a period
    resources :periods, except: [:new, :edit], defaults: { format: :json } do
      resources :expectations, except: [:new, :edit], defaults: { format: :json }
    end
  end

  root "designs#index", defaults: { format: :json }
end
