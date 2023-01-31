class CreateResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :resumes do |t|
      t.string     :title,       null: false
      t.text       :resume_text, null: false
      t.integer    :price,       null: false
      t.references :user,        null: false, foreign_key: true
      t.text       :answer,      null: false
      t.timestamps
    end
  end
end
