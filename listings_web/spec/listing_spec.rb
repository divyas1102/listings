require 'spec_helper'

describe Listing do

  context 'photo' do
    it 'is invalid if number of photos is less than 3' do
      expect{FactoryGirl.create(:listing, photo: [FactoryGirl.create(:photo)])}.to raise_error(ActiveRecord::RecordInvalid)      
    end

    # it 'is valid if number of photos is > 3' do
    #   photos = [FactoryGirl.create(:photo), FactoryGirl.create(:photo), FactoryGirl.create(:photo), FactoryGirl.create(:photo)]
    #   expect(FactoryGirl.create(:listing, photo: photos).valid?).to be_truthy
    # end
  end
end