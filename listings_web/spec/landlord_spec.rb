require 'spec_helper'

describe Landlord do

  context 'phone format' do
    it 'converts phone number to only numbers and no special characters' do
      landlord1 = FactoryGirl.create(:landlord, phone: '(310)-123/4561')
      expect(landlord1.phone).to eql('3101234561')
    end

    it 'returns invalid if phone length is > 10' do
      expect{FactoryGirl.create(:landlord, phone: '12345678911')}.to raise_error(ActiveRecord::RecordInvalid)      
    end

    it 'returns invalid if phone length is < 10' do
      expect{FactoryGirl.create(:landlord, phone: '1234567')}.to raise_error(ActiveRecord::RecordInvalid)      
    end
  end
end