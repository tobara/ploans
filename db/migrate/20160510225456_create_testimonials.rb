class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.belongs_to :user, null: false
      t.string :description, null: false
      t.string :rating, null: false

      t.timestamps null: false
    end
  end
end
