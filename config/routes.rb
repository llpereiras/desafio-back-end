Rails.application.routes.draw do
  root 'importers#import'
  match 'create', to: 'importers#create', via: [:post]
end
