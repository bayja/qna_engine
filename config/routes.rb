QnaEngine::Engine.routes.draw do
	resources :questions do
		resources :answers
	end

	namespace :admin do
		resources :questions do
			resources :answers
		end
	end
end
