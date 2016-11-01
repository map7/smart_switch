class CreateButtons < ActiveRecord::Migration
  def change
    create_table :buttons do |t|
      t.string :name
      t.string :on_command
      t.string :off_command
      t.boolean :power_status

      t.timestamps null: false
    end
  end
end
