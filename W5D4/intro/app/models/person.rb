require_relative "application_record.rb"

class Person < ApplicationRecord
    def up
        create_table :persons do |t|
            t.string :name
            
            t.timestamps
            validates :name, presence: true
      end
    end
  
    def down
      drop_table :persons
    end
end
Person.create(name: 'John Doe').valid? # => true
