class EventsController < InheritedResources::Base
	before_filter :check_privileges!, only: [ :new, :create ]

	def index
		# TODO: Use metasearch or ransack next time. It's already installed but I need to move fast
		# or people in Nigeria will die!
		@events = Event.search_for(params, current_user)
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

	def create
		# TODO: Remember the tag stuff

		# params[:start_date] = DateTime.parse(params[:start_date])
		# params[:end_date] = DateTime.parse(params[:end_date])
		# params[:start_registration] = DateTime.parse(params[:start_registration])
		# params[:end_registration] = DateTime.parse(params[:end_registration])
		@event = Event.new(params[:event])
		@event.user = current_user
		@event.start_date = DateTime.parse(params[:event][:start_date])
		@event.end_date = DateTime.parse(params[:event][:end_date])
		@event.published = false

		respond_to do |format|
			if @event.save
				format.html { redirect_to(@event, :notice => "Event creation was successful") }
				format.json { render :json => @event, :status => :created, :location => @event }
			else
				format.html { render :action => "new" }
				format.json { render :json => @event.errors, :status => :unprocessable_entity }
			end
		end
	end

end
