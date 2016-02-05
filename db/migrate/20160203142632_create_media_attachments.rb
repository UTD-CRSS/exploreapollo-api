class CreateMediaAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :media_attachments do |t|
      t.references :media, null: false, foreign_key: true
      t.references :media_attachable, polymorphic: true, null: false, index: { name: 'media_attachable_type_and_id' }
      t.integer :met_start, limit: 8
      t.integer :met_end, limit: 8

      t.timestamps
    end
    add_index :media_attachments, :media_id
  end
end
