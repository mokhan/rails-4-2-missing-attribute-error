class CreateNic < ActiveRecord::Migration
  def change
    create_table :nics do |t|
      t.references :computer, index: true, foreign_key: true
      t.string :ip
    end
  end
end
