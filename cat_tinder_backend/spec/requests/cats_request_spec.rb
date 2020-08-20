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
    # it "can update a cat" do
    #     before :each do
    #         @cat_params = {
    #             name: "Roscoe",
    #             age: 2,
    #             enjoys: 'Walks in the park'
    #             }
        
    #     # post '/cats', params: cat_params
        
    #     Cat.create(cat_params)

    #     cat_params2 = {
    #         cat: {
    #         name: "Roscoe",
    #         age: 9,
    #         enjoys: 'Walks in the park'
    #         }
    #     }

    #     cat = Cat.last
    #     id = cat[:id]

    #     patch '/cats/:id', params: cat_params2

    #     get '/cats/1'

    #     cat1 = JSON.parse(response.body)

    #     expect(cat1['age']).to_equal 9
    # end
    it "updates an item with valid params" do
        cat_params = {
                name: "Roscoe",
                age: 2,
                enjoys: 'Walks in the park'
                }
        cat = Cat.create(cat_params)
        post :update, id: 1, cat: {name: "Tyler", age: 23, enjoys: "Eating catnip and dancing"}
        item.reload
        expect(item.first_attribute).to eq("Tyler")
    end
end
