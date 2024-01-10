Rails.application.routes.draw do
# Routes pour les actions relatives aux voyages
get 'trips/index' # Page d'index des voyages (peut être redondant avec la prochaine route)
get '/trips', to: 'trips#index' # Affiche la liste des voyages
get '/trips/:id', to: 'trips#show', as: 'trip' # Affiche les détails d'un voyage
get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip' # Affiche le formulaire pour éditer un voyage
patch '/trips/:id', to: 'trips#update' # Met à jour un voyage
get '/newtrips', to: 'trips#new', as: 'new_trip' # Affiche le formulaire pour créer un nouveau voyage
post '/trips', to: 'trips#create' # Crée un nouveau voyage
get '/trips/:id/delete', to: 'trips#destroy', as: 'delete_trip' # Supprime un voyage

# Routes pour les actions relatives aux utilisateurs
get 'users/index' # Page d'index des utilisateurs (peut être redondant avec la prochaine route)
get '/users', to: 'users#index' # Affiche la liste des utilisateurs
get '/users/:id', to: 'users#show', as: 'user' # Affiche les détails d'un utilisateur
get '/users/:id/edit', to: 'users#edit', as: 'edit_user' # Affiche le formulaire pour éditer un utilisateur
patch '/users/:id', to: 'users#update' # Met à jour un utilisateur
get '/new_users', to: 'users#new', as: 'new_user' # Affiche le formulaire pour créer un nouvel utilisateur
post '/users', to: 'users#create' # Crée un nouvel utilisateur
get '/users/:id/delete', to: 'users#destroy', as: 'delete_user' # Supprime un utilisateur

# Route pour vérifier l'état de santé de l'application
get "up" => "rails/health#show", as: :rails_health_check

# Route racine de l'application, redirige vers la liste des voyages
root 'trips#index'


end
