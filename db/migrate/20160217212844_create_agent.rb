class CreateAgent < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.references :computer, index: true, foreign_key: true
    end
  end
end
