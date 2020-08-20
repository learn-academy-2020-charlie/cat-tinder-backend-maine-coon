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




end
