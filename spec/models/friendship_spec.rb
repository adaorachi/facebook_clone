# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'validations' do
    it { should validate_presence_of(:passive_friend_id) }
    it { should validate_presence_of(:active_friend_id) }
  end

  context 'Associations' do
    it { should belong_to(:active_friend).class_name('User') }
    it { should belong_to(:passive_friend).class_name('User') }
  end
end