require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

#============= Validation 2.  ===============
  test 'start date must be greater than now' do
    poorject = build(:project, start_date: DateTime.new(2001,2,3,4,5,6))

    # poorject = Project.new(title: "Wowzers", description: "It is really Wow", goal: 5, user_id: 1, start_date: DateTime.new(2001,2,3,4,5,6), end_date: DateTime.new(2020,2,3,4,5,6))

    # poorject.start_date = DateTime.civil_from_format :local, 2012, 12, 17
    # poorject.end_date = DateTime.civil_from_format :local, 2018, 12, 17
    # poorject.save

    assert poorject.invalid?, "You cannot go back in time"
  end

#============= Validation 3.  ================
  test 'End date must be greater than start date' do

    poorject = build(:project, end_date: Date.today - 200)
    assert poorject.invalid?, "Start Date must come before end date, duh"
  end

#============= Validation 4.  ================
  test 'Goal must be greater than 0' do

    poorject = build(:project, goal: 0)
    assert poorject.invalid?
  end

  test 'valid project can be created' do
    project = create(:project)
    assert project.valid?
    assert project.persisted?
    assert project.user
  end

  test 'project is invalid without owner' do
    project = build(:project, user: nil)
    assert project.invalid?, 'Project should not save without owner.'
  end

end
