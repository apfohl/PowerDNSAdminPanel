# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :api_token
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions do |user|
      link_to('Generate API-Token', user_generate_api_token_path(user),
              method: :put, data: { confirm: 'Are you sure?' })
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def generate_api_token
      @user = User.find(params[:id])
      @user.regenerate_api_token
      flash[:notice] = 'API-Token was successfully generated.'
      redirect_to users_path
    end
  end
end
