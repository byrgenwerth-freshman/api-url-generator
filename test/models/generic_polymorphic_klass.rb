require 'active_record'

class GenericPolymorphicKlass
  extend ActiveModel::Naming
  extend  ActiveModel::Translation

  include ActiveModel::Validations
  include ActiveModel::Conversion


end