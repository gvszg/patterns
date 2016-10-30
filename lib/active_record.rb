require "connection_adapter"
# every component has dependency on each other
# so need to all file
require "active_model"
require "pry"

module ActiveRecord
  class Base
    include ActiveModel::Validations

    @@connection = SqliteAdapter.new

    def initialize(attributes={})
      @attributes = attributes
    end

    def self.table_name
      name.downcase + "s"
    end

    # instance level
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

    def self.find_by_sql(sql)
      @@connection.execute(sql).map do |attributes|
        new(attributes)
      end
    end

    def self.find(id)
      # attributes = @@connection.execute("SELECT * FROM #{table_name} WHERE users.id = #{id.to_i} LIMIT 1").first
      # new(attributes)

      attributes = find_by_sql("SELECT * FROM #{table_name} WHERE users.id = #{id.to_i} LIMIT 1").first
    end

    def self.all
      # atrribute_hash = @@connection.execute("SELECT * FROM #{table_name}")
      # users = []
      # atrribute_hash.each { |h| users << new(h) }
      # users
      # atrribute_hash.map { |h| new(h) }

      atrribute_hash = find_by_sql("SELECT * FROM #{table_name}")
    end
  end
end