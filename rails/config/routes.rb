Rails.application.routes.draw do
  root "dashboards#index"
  get 'dashboards', to: "dashboards#index"
end
