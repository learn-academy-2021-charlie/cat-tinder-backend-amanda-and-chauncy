require 'rails_helper'

RSpec.describe "Characters", type: :request do
  describe "GET /index" do
    it "gets a list of characters" do
    Character.create(name: 'Tom Nook ', animal: 'Squirrel', enjoys: 'processing loan payments', personality: 'greedy')

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
          enjoys: 'processing loan payments',
          personality: 'greedy'
        }
      }
      # make a request
      post '/characters', params: character_params
      new_character = Character.first
      expect(response).to have_http_status(200)
      expect(new_character.name).to eq 'Tom'
      expect(new_character.animal).to eq 'Squirrel'
      expect(new_character.enjoys).to eq 'processing loan payments'
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
          enjoys: 'processing loan payments',
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
          enjoys: 'processing loan payments',
          personality: 'greedy'
        }
      }
      patch "/characters/#{character.id}", params: updated_character_params
      updated_character = Character.find(character.id)
      expect(response).to have_http_status(200)
      expect(updated_character.enjoys).to eq 'processing loan payments'
    end
  end
      it "doesnt create a character without a name" do
        character_params = {
          character: {
            animal: 'Squirrel',
            enjoys: 'processing loan payments',
            personality: 'greedy'
          }
        }
        post '/characters', params: character_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['name']).to include "can't be blank"
      end
      it "doesnt create a character without an animal type" do
        character_params = {
          character: {
            name: 'Tom',
            enjoys: 'processing loan payments',
            personality: 'greedy'
          }
        }
        post '/characters', params: character_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['animal']).to include "can't be blank"
      end
      it "doesnt create a character without an enjoys entry" do
        character_params = {
          character: {
            name: 'Tom',
            animal: 'Squirrel',
            personality: 'greedy'
          }
        }
        post '/characters', params: character_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['enjoys']).to include "can't be blank"
      end
      it "doesnt create a character without a personality entry" do
        character_params = {
          character: {
            name: 'Tom',
            animal: 'Squirrel',
            enjoys: 'processing loan payments'
          }
        }
        post '/characters', params: character_params
        expect(response.status).to eq 422
        json = JSON.parse(response.body)
        expect(json['personality']).to include "can't be blank"
      end
      it "doesnt create a character with enjoy statement <10 characters" do
        character_params = {
          character: {
            name: 'Tom',
            animal: 'Squirrel',
            enjoys: 'finance',
            personality: 'greedy'
          }
        }
        post '/characters', params: character_params
        expect(response).to have_http_status(422)
        json = JSON.parse(response.body)
        expect(json['enjoys']).to include "is too short (minimum is 10 characters)"
      end
end