Refinery::Core::Engine.routes.append do
 
  # Frontend routes
  namespace :objects do
    resources :objects, :path => '', :only => [:index, :show]
  end
  # Admin routes
  namespace :objects, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :objects, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
