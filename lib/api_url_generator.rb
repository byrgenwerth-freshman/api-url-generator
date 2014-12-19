require "api_url_generator/version"

module APIURLGenerator
  def generate_url(object, nest = nil, polymorphous = nil)
    if polymorphous
      nested_id = "/#{nest.pluralize}/#{object.instance_eval("#{polymorphous}_id")}"
      object_id = "/#{object.class.to_s.tableize.downcase}/#{object.id}"
      return "#{ENV["API_URL"]}#{nested_id}#{object_id}"
    elsif nest
      nested_id = "/#{nest.pluralize}/#{object.instance_eval("#{nest}_id")}"
      object_id = "/#{object.class.to_s.tableize.downcase}/#{object.id}"
      return "#{ENV["API_URL"]}#{nested_id}#{object_id}"
    else
      return "#{ENV["API_URL"]}/#{object.class.to_s.tableize.downcase}/#{object.id}"
    end
  end
end
