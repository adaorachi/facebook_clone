# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user_id) }
  end

  context 'Associations' do
    it { should belong_to(:user) }
  end
end
