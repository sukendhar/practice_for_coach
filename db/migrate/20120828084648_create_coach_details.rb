class CreateCoachDetails < ActiveRecord::Migration
  def change
    create_table :coach_details do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
