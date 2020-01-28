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
    it { should have_many(:comments) }
    it { should have_many(:like_posts).with_foreign_key('user_id').dependent(:destroy) }
    it { should have_many(:liked_posts).through(:like_posts) }
  end
end