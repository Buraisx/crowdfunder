require 'test_helper'


class RewardTest < ActiveSupport::TestCase

  #================ Validation 5. ================
  test 'dollar_amount_must_be_positive' do
    pony = build(:reward, dollar_amount: -5.0)
    assert pony.invalid?
  end

  test 'A reward can be created' do
    project = create(:project)
    reward = create(:reward, project: project)
    assert reward.valid?
    assert reward.persisted?
  end

  test 'A reward cannot be created without a dollar amount' do
    project = create(:project)
    reward = build(:reward, project: project, dollar_amount: nil)
    assert reward.invalid?, 'Reward should be invalid without dollar amount'
    assert reward.new_record?, 'Reward should not save without dollar amount'
  end

  test 'A reward cannot be created without a description' do
    project = create(:project)
    reward = build(:reward, project: project, description: nil)
    assert reward.invalid?, 'Reward should be invalid without a description'
    assert reward.new_record?, 'Reward should not save without a description'
  end

end
