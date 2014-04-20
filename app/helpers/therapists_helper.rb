module TherapistsHelper
  def check_if_subsections_exist
    @therapist = current_therapist
    if @therapist.approach_sub1.nil?
    else
  		if @therapist.approach_sub1.empty?
  			@approach1_style = "none"
        @approach1_title_style = "block"
  		else
  			@approach1_style = "block"
        @approach1_title_style = "none"
  		end
		
  		if @therapist.approach_sub2.empty?
  			@approach2_style = "none"
        @approach2_title_style = "block"
  		else
  			@approach2_style = "block"
        @approach2_title_style = "none"
  		end
    end
  end
  
  def define_subdomain
    if Rails.env.development?
      @subdomain = ''
    elsif Rails.env.production?
      @subdomain = 'www'
    end
  end
end
