module Filterable
  extend ActiveSupport::Concern

  class_methods do
    def filter_by_name(name)
      where('name LIKE ?', "%#{name}%")
    end
  end
end
