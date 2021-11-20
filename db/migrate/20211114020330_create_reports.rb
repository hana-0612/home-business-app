class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.datetime   :start_of_work,   null: false
      t.datetime   :breakstart
      t.datetime   :breakend
      t.datetime   :end_of_work
      t.text       :business_content
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
