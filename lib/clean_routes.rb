require_relative "./clean_routes/version"

module CleanRoutes

  def clean_routes
		routes_list.each_key do |controller|
			puts controller_name(controller)

			routes_list[controller].each do |route|
		    	print left_indent(route[:name])
		    	print name_format(route[:name]), verb_format(route[:verb]),
		    			path_format(route[:path]), reqs_format(route[:reqs])
		    end
	  	end
	end

  private

	def routes_list
		routes = []
		Application.routes.set.each do |r|
			routes << {
						:name => r.name,
						:verb => r.verb,
						:path => r.path.spec,
						:reqs => r.requirements
					  }
		end
		routes.group_by { |r| r[:reqs][:controller] }
	end

	def name_format(name)
		name.ljust(30)
	end

	def verb_format(verb)
		clean_verb = verb.delete(/^[A-Z]+/)
		clean_verb.ljust(10)
	end

	def path_format(path)
		path.ljust(35)
	end

	def reqs_format(reqs)
		"#{reqs[:controller]}##{reqs[:action]}".ljust(30)
	end

	def left_indent(has_name)
	  has_name ? "|- " : "| "
	end

	def controller_name(controller)
	  controller ? name = controller : name = "no name"
	  capitalized_name(name)
	end

	def capitalized_name(name)
	  c_name = name
	  ["/", "_"].each do |separator|
	    c_name = c_name.split(separator).each do |n|
	      n[0] = n[0].upcase
	    end.join(separator)
	  end
	  c_name
	end
end
