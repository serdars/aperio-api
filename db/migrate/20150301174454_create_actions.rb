class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.boolean :read
      t.integer :action_type

      t.references :subject, polymorphic: true, index: true
      t.references :object, polymorphic: true, index: true
      t.references :related_to, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
