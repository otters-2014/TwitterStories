require 'spec_helper'

describe Ratings do
  let(:rating){Rating.create(user_id: 1, rateable_id: 1, rating: 7)}

  it 'should belong to a user' do
    expect(rating.user.id).to eq 1
  end

  it 'should have a rating' do
    expect(rating.rating).to eq 7
  end

  it 'should have (many) comments' do
    expect(rating.comments).to eq []
  end

  it 'should have a rateable_id' do
    expect(rating.rateable_id).to eq 1
  end

end
