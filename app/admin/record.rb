ActiveAdmin.register Record do
  permit_params :domain_id, :name, :type, :content, :ttl, :prio, :disabled

  belongs_to :domain

  config.sort_order = 'type_desc'

  actions :all, except: [:show]

  filter :type, as: :select
  filter :ttl
  filter :disabled

  index do
    selectable_column
    column :id
    column :type do |record|
      case record.type
        when 'SOA'
          status_tag(record.type, :blue)
        when 'NS'
          status_tag(record.type, :green)
        when 'A'
          status_tag(record.type, :red)
        when 'AAAA'
          status_tag(record.type, :orange)
        else
          status_tag(record.type)
      end
    end
    column :name
    column :content
    column :ttl
    column :prio
    column :disabled
    column :change_date do |record|
      Time.at(record.change_date).iso8601
    end
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      if f.object.new_record?
        f.input :name
      else
        f.input :name, input_html: { readonly: true }
      end
      f.input :type, as: :select, collection: Record.types
      f.input :content
      f.input :ttl
      f.input :prio, hint: 'Insert only if type is MX'
      f.input :disabled
    end
    f.actions
  end
end
