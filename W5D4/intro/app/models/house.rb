class House < ApplicationRecord
    def up
      create_table :houses do |t|
        t.string :name
  
        t.timestamps
      end
    end
  
    def down
      drop_table :houses
    end
end