class CreateExamWindows < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_windows do |t|
      t.integer :exam_id
      t.timestamp :start_time
      t.timestamp :end_time
    end
  end
end
