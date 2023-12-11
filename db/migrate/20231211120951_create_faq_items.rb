class CreateFaqItems < ActiveRecord::Migration[7.1]
  def change
    create_table :faq_items do |t|
      t.string :question, null: false
      t.text :answer, null: false
      t.timestamps
    end

    add_index :faq_items, :question, unique: true
  end
end
