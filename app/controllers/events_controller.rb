class EventsController < InheritedResources::Base
	def index
		@events = Event.where{}
		if params[:short_description_or_name].present?
			@events = @events.joins(:user).where{
				(user.first_name =~ "%#{my{params[:short_description_or_name]}}%") | (user.last_name =~ "%#{my{params[:short_description_or_name]}}%") | (short_description =~ "%#{my{params[:short_description_or_name]}}%")
			}
		end

		if params[:category_id].present?
			@events = @events.joins(:category).where{
				(category.id = my{params[:category_id]})
			}
		end

		if params[:tags].present?
			@events = @events.tagged_with(params[:tags].split(","))
		end

		if params[:city].present?
			@events = @events.where{
				(city =~ "%#{my{params[:city]}}%")
			}
		end

		if params[:locale].present?
			@events = @events.where{
				(locale =~ "#{my{params[:locale]}}")
			}
		end

		if params[:zipcode].present?
			@events = @events.where{
				(zipcode = my{params[:zipcode]})
			}
		end
		@events
	end
end
