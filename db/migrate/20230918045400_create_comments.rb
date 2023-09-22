class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.timestamps
      t.text :content,             null:false

      t.references :user, null: false, foreign_key: true
      t.references :prototype, null: false, foreign_key: true

      # belongs_to :users
      # belongs_to :prototypes
    end
  end
end