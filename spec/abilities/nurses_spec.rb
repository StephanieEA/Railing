require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, '#nurses' do
  let(:acting_nurse) { FactoryGirl.create(:user, :nurse) }
  subject(:nurse_ability) { Ability.new(acting_nurse) }

  describe 'on Account' do
    let(:user) { FactoryGirl.create(:user) }

    it { is_expected.to be_able_to(:manage, user) }
    it { is_expected.to_not be_able_to(:destroy, user) }
  end
  # on Account
end
