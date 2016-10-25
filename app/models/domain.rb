class Domain < ActiveRecord::Base
  self.inheritance_column = nil

  has_many :records, dependent: :destroy

  def update_soa
    soa = self.records.find_by(type: 'SOA')
    soa.save
  end
end
