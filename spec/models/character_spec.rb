require 'rails_helper'

RSpec.describe Character, type: :model do
    it "should validate name" do
      character = Character.create
      expect(character.errors[:name]).to_not be_empty
    end
    it "should validate animal type" do
      character = Character.create
      expect(character.errors[:animal]).to_not be_empty
    end
    it "should validate enjoys statement" do
      character = Character.create
      expect(character.errors[:enjoys]).to_not be_empty
    end
    it "should validate enjoys length to be >= 10 characters" do
    character = Character.create
    expect(character.errors[:enjoys]).to_not be_empty
    end
    it "should validate personality" do
      character = Character.create
      expect(character.errors[:personality]).to_not be_empty
    end
  end
