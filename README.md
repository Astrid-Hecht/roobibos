# Roobibos (Ruby + Rooibos) Tea API
<br>

### Project Description
   This was a small take home challenge that focuses on rapidly implementing an API in Rails with a small web of relationships (customers, subscriptions, and teas) meant to represent one that might be used by a tea subscription box service. The MVP only covered exposing enough endpoints to view a customer's subscriptions and to subscribe or unsubscribe the customer from them at a seperate endpoint.
<br>


### Learning Goals
- Practice and demonstrate competence at rapid API prototyping
- Practice serilization.
- Explore using scaffolding to vastly speed up development

### MVP Requirements

At a minimum, you must create:

- An endpoint to subscribe a customer to a tea subscription
- An endpoint to cancel a customer’s tea subscription
- An endpoint to see all of a customer’s subsciptions (active and cancelled)
Beyond the base requirements, include any additional endpoints you’d like, but be mindful of your time. You don’t need to go overboard, consider what might be necessary to achieve MVP so that this API is easy to understand and consume by a Frontend Developer.

### Planning Schema

![Schema diagram](https://github.com/Astrid-Hecht/roobibos/blob/main/public/schema.png?raw=true)

### Setup Instructions
  * Fork and clone this repo
  * Run `bundle install`
  * Run `rails db:{create,migrate,seed}`
  * Run `rails s`
  * And you're good to go! The endpoint will be accessible on your chosen port through tools like [Postman](https://www.postman.com/)

#### Testing

  * Use the setup steps above, but instead of running `rails s`, run `bundle exec rspec`

### Endpoints

  * View a customer's subscriptions at: `GET api/v1/customers/:id' 
    The response will use the following schema:
    ```
    {:data=>
      {:id=>"159",
      :type=>"customer",
      :attributes=>
        {:first_name=>"Krissy",
        :last_name=>"Torphy",
        :email=>"pansy@spencer.co",
        :address=>"676 Simonis Burgs, East Marcport, VA 08001",
        :subscriptions=>
          [{:id=>237,
            :customer_id=>159,
            :title=>"Oolong",
            :price=>80.14,
            :status=>"active",
            :frequency=>37,
            :created_at=>"2023-02-23T06:24:34.145Z",
            :updated_at=>"2023-02-23T06:24:34.145Z"}
          ]
        }
      }
    }
    ```

  * Update a specific subscription's status (or any other attributes) at: `PATCH /subscriptions/:id' The JSON payload will need to follow the following format:

    ```
    { title: "String",
      price: 10.99,
      status: <0 for inactive, 1 for active>,
      frequency: 4 <weeks> }
    ```

    The response will also be in the following format, and will show the updated data if successful.

    ```
     "data": {
        "id": "2",
        "type": "subscription",
        "attributes": {
            "title": "Green",
            "price": 87.45,
            "frequency": 26,
            "status": "inactive"
        }
    }
    ```

### Future Plans
  * Use time before it's due to refactor the db to have a many to many relationship between customers and subscriptions. This would allow the service to release subsription options with pre-set parameters that many users could subscribe to. Transitioning the current subscription relation to a custom subsription option would allow for the current flexibility of subscriptions to persist in a different form.
  * Add more endpoints for fully fleshed out CRUD functionality
  * Add endpoints to see most popular subscriptions
  * Implement an API key and user authentication system to restrict API access
  * Implement a frontend service using Tailwind CSS


### Tech Stack
![rubyonrails](https://img.shields.io/badge/Ruby-100000?style=for-the-badge&logo=rubyonrails&logoColor=cc0000&labelColor=000000&color=000000)
![ruby](https://img.shields.io/badge/Ruby-100000?style=for-the-badge&logo=Ruby&logoColor=cc0000&labelColor=000000&color=000000)
![json](https://img.shields.io/badge/json-000000?style=for-the-badge&logo=json&logoColor=white)
![postgresql](https://img.shields.io/badge/postgresql-000000?style=for-the-badge&logo=postgresql&logoColor=light-blue)
![Markdown](https://img.shields.io/badge/markdown-000000.svg?style=for-the-badge&logo=markdown&logoColor=white)



### Contributors
<table>
  <tr>
    <th>Astrid Hecht</th>
  </tr>
 
  <tr>
    <td>
       <a href="https://github.com/Astrid-Hecht" rel="nofollow noreferrer">
           Github
      </a><br>
        <a href="https://www.linkedin.com/in/astrid-hecht/" rel="nofollow noreferrer">
     LinkedIn
      </a>
    </td>
  </tr>
</table>
