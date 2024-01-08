class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :app_id, index: { unique: true }
      t.string :client_id, index: { unique: true } 
      t.string :client_secret, index: { unique: true } 
      t.string :redirect_url 

      t.belongs_to :users, foreign_key: true

      t.timestamps
    end
  end
end 
