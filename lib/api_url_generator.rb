require "api_url_generator/version"

module APIURLGenerator
  @@url

  def self.url(x)
    @@url = x
  end

  def self.get_url
    @@url
  end


  def self.generate_url(object, nest = nil, polymorphous = nil)
    if polymorphous
      nested_id = "/#{nest.pluralize}/#{object.instance_eval("#{polymorphous}_id")}"
      object_id = "/#{object.class.to_s.tableize.downcase}/#{object.id}"
      return "#{@@url}#{nested_id}#{object_id}"
    elsif nest
      begin
        nested_id = "/#{nest.pluralize}/#{object.instance_eval("#{nest}_id")}"
        object_id = "/#{object.class.to_s.tableize.downcase}/#{object.id}"
        return "#{@@url}#{nested_id}#{object_id}"
      rescue NameError
        raise ArgumentError, "Invalid parent param"
      end
    else
      return "#{@@url}/#{object.class.to_s.tableize.downcase}/#{object.id}"
    end
  end
end
