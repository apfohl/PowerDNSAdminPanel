class Domain < ActiveRecord::Base
  self.inheritance_column = nil

  has_many :records, dependent: :destroy

  validates :name, :type, presence: true

  def self.types
    %w(
      NATIVE
      MASTER
      SLAVE
    )
  end

  def update_soa
    soa = self.records.find_by(type: 'SOA')
    soa.save
  end
end
