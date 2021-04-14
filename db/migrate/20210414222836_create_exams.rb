class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.string :title
      t.references :exam_window, foreign_key: true

      t.timestamps
    end
  end
end
