module SeriesService
  class << self
    def create(params)
      @series = Series.new(params)
      create_events
      @series.save
    end

    def update(params, series)
      @series = series
      event_list = Event.find_by_series_id(@series.id)

      event_list.destroy_all if !event_list.nil?

      create_events
      @series.update(params)
    end
    
    def create_events

      if !@series.occurs_from_date.nil? && !@series.occurs_to_date.nil?

        from_date = @series.occurs_from_date.to_time
        to_date = @series.occurs_to_date.to_time
        current_date = from_date

        case @series.how_often
        when 'Daily'
          # daily event create loop
          begin
            @event = @series.events.new(title: @series.title, location: @series.location, from_time: @series.from_time, to_time: @series.to_time, date: current_date)
            @event.save
            current_date += 1.day
          end while current_date <= to_date
        when 'Weekly'
          # monthly event create loop
          begin
            @event = @series.events.new(title: @series.title, location: @series.location, from_time: @series.from_time, to_time: @series.to_time, date: current_date)
            @event.save
            current_date += 1.week
          end while current_date <= to_date
        when 'Monthly'
          # yearly event create loop
          begin
            @event = @series.events.new(title: @series.title, location: @series.location, from_time: @series.from_time, to_time: @series.to_time, date: current_date)
            @event.save
            current_date += 1.year
          end while current_date <= to_date
        when 'Custom'
          # custom event create
          @event = @series.events.new(title: @series.title, location: @series.location, from_time: @series.from_time, to_time: @series.to_time, date: current_date)
          @event.save
        else
          # do nothing
        end
      end
    end
  end
end