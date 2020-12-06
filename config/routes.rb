Rails.application.routes.draw do
    resources :todo_lists do
        resources :todo_items do
            member do
                patch :complete
                patch :uncomplete
            end
        end
    end

    authenticated :user do
        root to: 'todo_lists#index', as: :authenticated_root
    end

    root to: redirect('/users/sign_in')

    devise_for :users, controllers: {
        :sessions => "users/sessions",
        :registrations => "users/registrations"
    }

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
