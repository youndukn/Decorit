class CreatePublishes < ActiveRecord::Migration
  def change
    create_table :publishes do |t|
      t.string :publishTitle

      t.timestamps
    end
  end
end
