# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    it { should validate_presence_of(:post_id) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:body) }
  end

  context 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end