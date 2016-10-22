require "connection_adapter"
require "pry"

module ActiveRecord
  class Base
    @@connection = SqliteAdapter.new

    def initialize(attributes={})
      @attributes = attributes
    end

    def table_name
      self.class.table_name
    end

    # dynamically define attributes get method
    def method_missing(name, *args)
      columns = @@connection.columns(table_name)

      if columns.include?(name)
        @attributes[name]
      else
        super
      end
    end

    def self.find(id)
      attributes = @@connection.execute("SELECT * FROM #{table_name} WHERE users.id = #{id.to_i} LIMIT 1").first
      new(attributes)
    end

    def self.table_name
      name.downcase + "s"
    end
  end
end