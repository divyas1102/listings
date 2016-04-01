require 'spec_helper'

describe Address do

  context 'address with duplicate latitude and longitude' do
    it 'is invalid' do
      expect { FactoryGirl.create(:address, latitude: 1.0, longitude: 2.0) }.to raise_error(ActiveRecord::RecordInvalid)      
    end
  end
end