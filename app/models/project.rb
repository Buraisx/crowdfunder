class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :updates
  has_many :comments
  has_many :users, through: :pledges # backers
  belongs_to :user # project owner
  belongs_to :category

  validates :title, :description, :goal, :start_date, :end_date, :user_id, presence: true


  #============= Validation 2, 3, 4  ===============
   validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_after_start_date
  validates :goal, numericality: { only_integer: true, greater_than: 0 }


  #============= Validation 2.  ===============
  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:expiration_date, "You cannot go back in time")
    end
  end

  #============= Validation 3.  ===============
  def end_date_cannot_be_after_start_date
    if start_date > end_date
      errors.add(:expiration_date, "Start Date must come before end date, duh")
    end
  end

  #============= Search Bar  ===============
  def self.search(search)
    where("title iLIKE ?", "%#{search}%")
  end

end
