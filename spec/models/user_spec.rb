require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:username)}
  it {should validate_uniqueness_of(:username)}
  it {should validate_presence_of(:uid)}
  it {should validate_uniqueness_of(:uid)}
  it {should validate_presence_of(:token)}
  it {should validate_uniqueness_of(:token)}
end
