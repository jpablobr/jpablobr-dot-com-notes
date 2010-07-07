class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.boolean :done, :default => false
      t.string :name
      t.text :notes
      t.integer :priority
      t.date :due

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
