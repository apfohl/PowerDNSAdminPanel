class Record < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :domain
  before_save :update_change_date

  private
    def update_change_date
      self.change_date = Time.now.to_i
    end
end
