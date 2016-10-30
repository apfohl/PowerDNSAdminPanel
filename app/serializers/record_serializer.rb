class RecordSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :content, :ttl, :prio, :disabled
end
