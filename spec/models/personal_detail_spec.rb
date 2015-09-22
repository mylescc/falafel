require 'rails_helper'

describe PersonalDetail, type: :model do
  it { is_expected.to validate_presence_of(:user) }
end
