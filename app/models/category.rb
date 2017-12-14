class Category < ApplicationRecord
  has_many :projects

  def self.search_projects(search)
    projects = where("name iLIKE ? ", "%#{search}%").map do |category|
      category.projects
    end
    projects.flatten
  end
end
