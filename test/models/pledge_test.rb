require_relative '../test_helper'

class PledgeTest < ActiveSupport::TestCase

#================ Validation 1. ================
  test 'dollar_amount_is_required' do
    pledger = build(:pledge, dollar_amount: nil)
    assert pledger.invalid?
  end

  test 'A pledge can be created' do
    pledge = build(:pledge)
    pledge.save
    assert pledge.valid?
    assert pledge.persisted?
  end

  test 'owner cannot back own project' do
    owner = build(:user)
    owner.save
    project = build(:project, user: owner)
    project.save
    pledge = build(:pledge, project: project, user: owner)
    pledge.save
    assert pledge.invalid?, 'Owner should not be able to pledge towards own project'
  end

end
