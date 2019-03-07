require  'swagger_helper'

describe 'Events API' do

  path '/api/v1/events' do

    post 'Creates a pet' do

      tags 'Events'
      consumes 'application/json'
      parameter name: :event, in: :body, schema: {
          type: :object,
          properties: {
              title: { type: :string },
              location: { type: :string },
              how_often: { type: :string },
              from_time: { type: :string },
              to_time: { type: :string },
              of_the_param: { type: :string },
              day_of_the_week: { type: :string},
              day_of_the_month: { type: :string},
              occurs_from_date: { type: :string},
              occurs_to_date: { type: :string}

          },
          required: [ 'title']
      }

      response '201', 'event created' do
        let(:event) { { title: 'My standup', location: 'west arch', how_often: 'daily', from_time: '09:00 AM', to_time: '10:00 AM',
                        of_the_param: 'same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31'} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:event) { { location: 'west arch' } }
        run_test!
      end

    end

  end


  path '/api/v1/events/{id}' do

    get 'retrieves an event' do
      tags 'Events'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
               properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   location: { type: :string },
                   how_often: { type: :string },
                   from_time: { type: :string },
                   to_time: { type: :string },
                   of_the_param: { type: :string },
                   day_of_the_week: { type: [ :string, :null ]},
                   day_of_the_month: { type: [ :string, :null ]},
                   occurs_from_date: { type: :string},
                   occurs_to_date: { type: :string}

               },
               required: [ 'id', 'title']
       let(:id) { Event.create(title: 'My standup', location: 'west arch', how_often: 'daily', from_time: '09:00 AM', to_time: '10:00 AM',
                               of_the_param: 'same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31').id}
        run_test!
      end

      response '404', 'event not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

end