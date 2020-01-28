# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:firstname) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:birthdate) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context 'Associations' do
    it { should have_many(:posts) }
  end
end