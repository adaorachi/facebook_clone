# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:surname) }
  end

  context 'Associations' do
    it { should belong_to(:user) }
  end
end