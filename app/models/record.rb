# frozen_string_literal: true

# Record class
class Record < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :domain
  before_save :update_change_date
  after_destroy :update_soa_change_date

  validates :name, :type, :content, :ttl, presence: true

  def self.types
    %w[SOA NS MX A AAAA CNAME ALIAS TXT SRV TLSA DS]
  end

  private

  def update_change_date
    self.change_date = Time.now.to_i
  end

  def update_soa_change_date
    domain.update_soa
  end
end
