require "api_url_generator/version"

module APIURLGenerator
  @@url

  def self.url(x)
    @@url = x
  end

  def self.get_url
    @@url
  end

  def self.dectect_polymorphic(object)
    object.instance_variables.each do |variable|
      if variable.to_s[-9..-1] == "able_type"
        return {
          name: {variable.to_s[1..-1].to_sym => object.instance_eval(variable.to_s)},
          id: {(variable.to_s[1..-5] + "id").to_sym => object.instance_eval(variable.to_s[1..-5] + "id")}
        }
      end
    end

    return false

  end


  def self.generate_url(object, nest = nil)
    polymorphous = dectect_polymorphic(object)
    if polymorphous && nest
      nested_id = "/#{object.instance_eval(polymorphous[:name].keys[0].to_s).tableize.downcase}/#{object.instance_eval("#{polymorphous[:id].keys[0]}")}"
      object_id = "/#{object.class.to_s.tableize.downcase}/#{object.id}"
      if object.instance_eval(polymorphous[:name].keys[0].to_s).downcase != nest
        raise ArgumentError, "Invalid nest param"
      end
      return "#{@@url}#{nested_id}#{object_id}"
    elsif nest
      begin
        nested_id = "/#{nest.pluralize}/#{object.instance_eval("#{nest}_id")}"
        object_id = "/#{object.class.to_s.tableize.downcase}/#{object.id}"
        return "#{@@url}#{nested_id}#{object_id}"
      rescue NameError
        raise ArgumentError, "Invalid nest param"
      end
    else
      return "#{@@url}/#{object.class.to_s.tableize.downcase}/#{object.id}"
    end
  end
end
