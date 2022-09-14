require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:email) }
  it { should allow_value('example@example.com').for(:email) }
  it { should_not allow_value('example@example').for(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }
end

RSpec.describe User, type: :model do
  it 'saves email addresses as lowercase' do
    user = build(:user, email: 'Foo@ExAMPle.CoM')
    user.save
    expect(user.email).to eql 'foo@example.com'
  end
end
