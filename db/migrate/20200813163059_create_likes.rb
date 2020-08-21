class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.boolean :statut, default: false
      t.belongs_to :message, index: true
      t.timestamps
    end
  end
end
