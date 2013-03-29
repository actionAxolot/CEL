class EventsController < InheritedResources::Base
	def index
		# TODO: Use metasearch or ransack next time. It's already installed but I need to move fast
		# or people in Nigeria will die!
		@events = Event.search_for(params)
		respond_to do |format|
    	format.html  # index.html.erb
	    format.json  { render :json => @events }
	  end
	end

	def new
		@event = Event.new
		respond_to do |format|
			format.html
			format.json { render :json => @event }
		end
	end

	# def create
	# 	# params[:start_date] = DateTime.parse(params[:start_date])
	# 	# params[:end_date] = DateTime.parse(params[:end_date])
	# 	# params[:start_registration] = DateTime.parse(params[:start_registration])
	# 	# params[:end_registration] = DateTime.parse(params[:end_registration])
	# 	params[:event][:user] = current_user
	# 	@event = Event.new(params[:event])

	# 	respond_to do |format|
	# 		if @event.save
	# 			format.html { redirect_to(@event, :notice => "Event creation was successful") }
	# 			format.json { render :json => @event, :status => :created, :location => @event }
	# 		else
	# 			format.html { render :action => "new" }
	# 			format.json { render :json => @event.errors, :status => :unprocessable_entity }
	# 		end
	# 	end
	# end

end
