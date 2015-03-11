require 'rails_helper'

describe Registration do
  it { should validate_presence_of :email }

  it "has a valid factory" do
    expect(create :registration).to be_an_instance_of Registration
  end
end
