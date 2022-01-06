module RubygemSetters
  def set_gemnames
    @gemnames = params[:query].downcase.split("~")
  end

  def set_rubygems
    set_gemnames
    @rubygems = @gemnames.map do |gemname|
      Rubygem.find_or_create_by name: gemname
    end
  end
end
