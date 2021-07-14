class OpenMic
  attr_reader :event_info, :performers

  def initialize(event_info)
    @event_info = event_info
    @performers = []
  end

  def location
    self.event_info[:location]
  end
end
