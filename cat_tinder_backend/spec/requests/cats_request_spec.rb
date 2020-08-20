require 'rails_helper'

RSpec.describe "Cats", type: :request do
    it "gets a list of cats" do
        cat_params = {
            name: 'Bandit',
            age: 2,
            enjoys: 'Stealing lunches from my owners.'

        }

        Cat.create(cat_params)
       
        get '/cats'
        
        # Converst the JSON to Ruby Hash
        cats = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)

        expect(cats.length).to eq 1
    end

    it "creates a cat" do
        cat_params = {
            cat: {
                name: 'Bandit',
                age: 2,
                enjoys: 'Stealing lunches from my owners.'
            }
        }
        
        post '/cats', params: cat_params

        expect(response).to have_http_status(:ok)

        cat = Cat.first

        expect(cat.name).to eq 'Bandit'
    end
    it "doesn't create a cat without a name" do
        cat_params = {
            cat: {
            age: 2,
            enjoys: 'Walks in the park'
            }
        }
        # Send the request to the  server
        post '/cats', params: cat_params
        # expect an error if the cat_params does not have a name
        expect(response.status).to eq 422
        # Convert the JSON response into a Ruby Hash
        json = JSON.parse(response.body)
        # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
        expect(json['name']).to include "can't be blank"
    end
end
