# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'is valid if username present' do
      user = create(:user)
      expect(user).to be_valid
    end

    it 'is not valid if username not given' do
      user = User.new(username: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid if name not unique' do
      user_one = create(:user)
      duplicate_user = User.new(username: user_one.username)
      expect(duplicate_user).to_not be_valid
    end
  end
end
