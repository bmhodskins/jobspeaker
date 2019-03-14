require  'swagger_helper'

describe 'Series API' do

  path '/api/v1/series' do

    post 'Creates a series' do

      tags 'Series'
      consumes 'application/json'
      parameter name: :series, in: :body, schema: {
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

      response '201', 'series created' do
        let(:series) { { title: 'My standup', location: 'west arch', how_often: 'Daily', from_time: '09:00 AM', to_time: '10:00 AM',
                         of_the_param: 'Same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31',
                         day_of_the_week: [ 'Monday', 'Wednesday', 'Friday']} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:series) { { location: 'west arch' } }
        run_test!
      end

    end

  end


  path '/api/v1/series/{id}' do

    get 'retrieves a series' do
      tags 'Series'
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
        let(:id) { Series.create(title: 'My standup', location: 'west arch', how_often: 'Daily', from_time: '09:00 AM', to_time: '10:00 AM',
                                of_the_param: 'Same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31',
                                day_of_the_week: [ 'Monday', 'Wednesday', 'Friday']).id}
        run_test!
      end

      response '404', 'series not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/series/{id}' do

    put 'updates a series' do
      tags 'Series'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, :in => :path, :type => :string

      parameter name: :series, in: :body, schema: {
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
        let(:id) { Series.create(title: 'My standup', location: 'west arch', how_often: 'Daily', from_time: '09:00 AM', to_time: '10:00 AM',
                                of_the_param: 'Same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31').id}
        let(:series) { { title: 'My standup - updated', location: 'east arch', how_often: 'Daily', from_time: '09:00 AM', to_time: '10:00 AM',
                        of_the_param: 'Same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31'} }
        run_test!
      end

      response '404', 'series not found' do
        let(:id) { 'invalid' }
        let(:series) { { title: 'My standup - updated', location: 'east arch', how_often: 'Daily', from_time: '09:00 AM', to_time: '10:00 AM',
                        of_the_param: 'Same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31'} }
        run_test!
      end

    end
  end

  path '/api/v1/series/{id}' do

    delete 'deletes a series' do
      tags 'Series'
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
        let(:id) { Series.create(title: 'My standup', location: 'west arch', how_often: 'Daily', from_time: '09:00 AM', to_time: '10:00 AM',
                                of_the_param: 'Same day', occurs_from_date: '2019-03-04', occurs_to_date: '2019-12-31').id}
        run_test!
      end

      response '404', 'series not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

end