require 'rails_helper'

describe "Users API", type: :request do
  it "gets a list of the Users /GET" do
    # Create a new cat in the Test Database (not the same one as development)
    User.create(name: 'Patsy', profile_pic: "https://stroseschool.stroselions.net/wp-content/uploads/2018/04/profile-blank-reva.png", project_link: "https://github.com/explore", focus: "All things Elixir")

    # Make a request to the API
    get '/users'

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we got a successful response
    expect(response).to have_http_status(:ok)

    # Assure that we got one result back as expected
    expect(json.length).to eq 1
  end

  it "creates a User" do
    # The params we are going to send with the request
    user_params = {
        user: {
            name: 'Patsy',
            profile_pic: "https://stroseschool.stroselions.net/wp-content/uploads/2018/04/profile-blank-reva.png",
            project_link: "https://github.com/explore",
            focus: "All things Elixir"
        }
    }

    # Send the request to the server
    post '/users', params: user_params

    # Assure that we get a success back
    expect(response).to have_http_status(:ok)

    # Look up the cat we expect to be created in the Database
    new_user = User.first

    # Assure that the created cat has the correct attributes
    expect(new_user.name).to eq('Patsy')
  end

  it "doesn't create a user without a name" do

      user_params = {
          user: {
              profile_pic: "https://stroseschool.stroselions.net/wp-content/uploads/2018/04/profile-blank-reva.png",
              project_link: "https://github.com/explore",
              focus: "All things Elixir"
          }
      }

      post '/users', params: user_params

      # This is a new test to make sure that our status is correct when the record can't be created
      # You can read more about HTTP response codes here: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
      expect(response.status).to eq 422

      # We also want to check that the API lets us know what is wrong, so the frontend can prompt the user to fix it.
      json = JSON.parse(response.body)
      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      expect(json['name']).to include "can't be blank"
    end
end
