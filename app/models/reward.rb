class Reward < ActiveRecord::Base
  belongs_to :project
  validates :description, :dollar_amount, presence: true

  #============= Validation 5.  ===============
  validates :dollar_amount, numericality: { greater_than: 0 }

end
