require 'active_record'

class Generic
  extend ActiveModel::Naming
  extend  ActiveModel::Translation

  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :id, :some_attribute, :project_id

  def initialize(attributes = {})
    self.id = attributes[:id]
    self.some_attribute = attributes[:some_attribute]
    self.project_id = attributes[:project_id]
  end

end