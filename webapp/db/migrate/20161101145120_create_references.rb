class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.integer :user_id
      t.string :ref_title
      t.string :ref_link
      t.string :ref_note

      t.timestamps
    end
  end
end
