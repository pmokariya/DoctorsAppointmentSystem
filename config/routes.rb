# frozen_string_literal: true

Rails.application.routes.draw do
  resources :unavailabilities
  devise_for :patients, path: 'patients', controllers: { sessions: "patients/sessions"}
  devise_for :doctors, path: 'doctors', controllers: { sessions: "doctors/sessions"}
  resources :patients
  resources :doctors
  resources :appointments do
    get "accept"
    get "reject"
  end
  get "/get_docter_availabilities" => "appointments#get_docter_availabilities"
  root 'home#index'
end
