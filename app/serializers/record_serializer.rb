# frozen_string_literal: true

# RecordSerializer class
class RecordSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :content, :ttl, :prio, :disabled
end
