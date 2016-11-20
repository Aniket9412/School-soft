Rails.application.routes.draw do
  devise_for :users
  root 'studm#index'
  
  get 'studm/index'=>'studm#index'

  post 'studm/create'=>'studm#create'

  patch 'studm/update'=>'studm#update'

  get 'studm/search'=>'studm#search'

  get 'studm/delete'=>'studm#delete'
  
  get 'studm/new'=>'studm#new'
  
  get 'studm/show'=>'studm#show'
  
  get 'studm/edit'=>'studm#edit'
  
  get 'studm/fees_details'=>'studm#fees_details'
  
  get 'studm/fee_edit/:id'=>'studm#fee_edit'
  
  patch 'studm/update_fees'=>'studm#update_fees'
  
  get 'studm/attendance_details'=>'studm#attendance_details'
  
  get 'studm/attendance_edit'=>'studm#attendance_edit'
  
  patch 'studm/attendance_update'=>'studm#attendance_update'
  
  get 'studm/library_details'=>'studm#library_details'
  
  get 'studm/books_show' => 'studm#books_show'
  
  get 'studm/new_book/:id' => 'studm#new_book'
  post 'studm/issue_book' => 'studm#issue_book'
  
  get 'studm/return_book/:id' => 'studm#return_book'
  get 'studm/delete_book/:id' => 'studm#delete_book'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
