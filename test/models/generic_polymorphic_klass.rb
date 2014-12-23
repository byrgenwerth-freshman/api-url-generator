require 'active_record'

class GenericPolymorphic
  extend ActiveModel::Naming
  extend  ActiveModel::Translation

  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :id, :some_attribute, :polymorphicable_type, :polymorphicable_id

  def initialize(attributes)
    self.id = attributes[:id]
    self.some_attribute = attributes[:some_attribute]
    self.polymorphicable_type = attributes[:polymorphicable_type]
    self.polymorphicable_id = attributes[:polymorphicable_id]
  end

end