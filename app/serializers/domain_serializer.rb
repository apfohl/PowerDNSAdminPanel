# frozen_string_literal: true

# DomainSerializer class
class DomainSerializer < ActiveModel::Serializer
  attributes :id, :name, :master, :type, :notified_serial
end
