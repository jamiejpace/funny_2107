class OpenMic
  attr_reader :event_info, :performers

  def initialize(event_info)
    @event_info = event_info
    @performers = []
  end

  def location
    self.event_info[:location]
  end

  def date
    self.event_info[:date]
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    jokes_by_performer = performers.map do |performer|
      performer.jokes
    end
    jokes_by_performer.uniq.length != jokes_by_performer.length
  end

end
