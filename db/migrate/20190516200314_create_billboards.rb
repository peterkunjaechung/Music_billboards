class CreateBillboards < ActiveRecord::Migration[5.2]
  def change
    create_table :billboards do |t|
      t.string :top_100_us
      t.string :top_100_eu
      t.string :top_50_us
      t.string :top_50_eu
      t.string :top_10

      t.timestamps
    end
  end
end
