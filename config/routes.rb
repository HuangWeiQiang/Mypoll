Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'homepage#index'
	resources 'categories'
	resources 'questions' do
		get ':l_or_r', to: 'questions#answer', as: :answer, l_or_r: /\d+/
		get 'star', to: 'questions#star', as: :star
		get 'next', to: 'questions#next', as: :next
	end
	get 'answer/:id', to: 'answer#show', as: :answer
	post 'comment', to: 'comments#post', as: :comment
end
