class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :profile_pic
      t.string :project_link
      t.string :focus

      t.timestamps
    end
  end
end
