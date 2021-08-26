require 'rails_helper'

RSpec.describe "Characters", type: :request do
  describe "GET /index" do
    it "gets a list of characters" do
    Character.create(name: 'Tom Nook ', animal: 'Squirrel', enjoys: 'finance', personality: 'greedy')

    # Make a request
    get '/characters'

    character = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(character.length).to eq 1
    end
  end
  describe "POST /create" do
    it 'creates a character' do
      character_params = {
        character: {
          name: 'Tom',
          animal: 'Squirrel',
          enjoys: 'finance',
          personality: 'greedy'
        }
      }
      # make a request
      post '/characters', params: character_params
      new_character = Character.first
      expect(response).to have_http_status(200)
      expect(new_character.name).to eq 'Tom'
      expect(new_character.animal).to eq 'Squirrel'
      expect(new_character.enjoys).to eq 'finance'
      expect(new_character.personality).to eq 'greedy'
    end
  end
  describe "PATCH /update" do
    it 'updates a character' do
      # create the character
      character_params = {
        character: {
          name: 'Tom',
          animal: 'Squirrel',
          enjoys: 'finance',
          personality: 'greedy'
        }
      }
      post '/characters', params: character_params
      character = Character.first
      # update the character
      updated_character_params = {
        character: {
          name: 'Tom',
          animal: 'Squirrel',
          enjoys: 'loan payments',
          personality: 'greedy'
        }
      }
      patch "/characters/#{character.id}", params: updated_character_params
      updated_character = Character.find(character.id)
      expect(response).to have_http_status(200)
      expect(updated_character.enjoys).to eq 'loan payments'
    end
  end
end