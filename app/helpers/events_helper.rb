module EventsHelper
  def events(name, events)
    render partial: name, locals: { obj: events }
  end
end
