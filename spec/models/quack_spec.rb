require "spec_helper"

describe Quack do
  describe 'validations' do
    it 'has a body' do
      quack = build(:quack, body: nil)
      quack.save
      expect(quack.errors[:body]).to include "can't be blank"
    end

    it 'is less than 140 characters' do
      quack = build(:quack, body: 'This quack is more than 140 characters long and should therefore fail the validation that I have written in the Quack model for this application.')
      quack.save
      expect(quack.errors[:body]).to include "is too long (maximum is 140 characters)"
    end

    it 'has an author' do
      quack = build(:quack, author: nil)
      quack.save
      expect(quack.errors[:author]).to include "can't be blank"
    end

    it 'is valid' do
      quack = build(:quack)
      expect(quack).to be_valid
    end
  end
end