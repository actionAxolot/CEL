class EventsController < InheritedResources::Base
	def index
	  @search = Event.search(params[:q])
	  @events = @search.result
  end
  
  def search
    index
    render :index
  end
  
end
