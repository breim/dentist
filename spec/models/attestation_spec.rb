# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attestation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :user }
  end
end
