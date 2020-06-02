ActiveAdmin.register Item do
  permit_params :name, :price, :user_id
end
