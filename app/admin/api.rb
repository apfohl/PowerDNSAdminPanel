# frozen_string_literal: true

ActiveAdmin.register_page 'Api' do
  menu label: 'API', priority: 20

  content title: 'JSON API' do
    render partial: 'documentation'
  end
end
