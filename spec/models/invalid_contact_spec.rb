require "rails_helper"

RSpec.describe InvalidContact, type: :model do
  describe "relationships" do
    it { is_expected.to belong_to :user }
  end
end
