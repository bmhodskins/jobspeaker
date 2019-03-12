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
        let(:event) { { title: 'My standup', location: 'west arch', how_often: 'Daily', from_time: '09:00 AM', to_time: '10:00 AM',
                        of_the_param: 'Same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31'} }
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
                   occurs_to_date: { type: :string},
                   series_id: { type: :integer }

               },
               required: [ 'id', 'title']
       let(:id) { Event.create(title: 'My standup', location: 'west arch', how_often: 'Daily', from_time: '09:00 AM', to_time: '10:00 AM',
                               of_the_param: 'Same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31',
                               day_of_the_week: [ 'Monday', 'Wednesday', 'Friday'], series_id: Series.create( title: "My standup" ).id).id}
        run_test!
      end

      response '404', 'event not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/events/{id}' do

    put 'updates an event' do
      tags 'Events'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, :in => :path, :type => :string

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

      response '200', 'updated' do
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
        let(:id) { Event.create(title: 'My standup', location: 'west arch', how_often: 'Daily', from_time: '09:00 AM', to_time: '10:00 AM',
                                of_the_param: 'Same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31', series_id: Series.create( title: "My standup" ).id).id}
        let(:event) { { title: 'My standup - updated', location: 'east arch', how_often: 'Daily', from_time: '09:00 AM', to_time: '10:00 AM',
                        of_the_param: 'Same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31'} }
        run_test!
      end

      response '404', 'event not found' do
        let(:id) { 'invalid' }
        let(:event) { { title: 'My standup - updated', location: 'east arch', how_often: 'Daily', from_time: '09:00 AM', to_time: '10:00 AM',
                        of_the_param: 'Same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31'} }
        run_test!
      end

    end
  end

  path '/api/v1/events/{id}' do

    delete 'deletes an event' do
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
        let(:id) { Event.create(title: 'My standup', location: 'west arch', how_often: 'Daily', from_time: '09:00 AM', to_time: '10:00 AM',
                                of_the_param: 'Same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31', series_id: Series.create( title: "My standup" ).id).id}
        run_test!
      end

      response '404', 'event not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

end