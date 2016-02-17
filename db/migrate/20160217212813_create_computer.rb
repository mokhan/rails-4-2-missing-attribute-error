class CreateComputer < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.references :business, index: true, foreign_key: true
      t.string :ip_external
    end
  end
end
