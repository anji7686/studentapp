class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.string    :username,            :null => false
      t.string    :email,               :null => false
      t.string    :encrypted_password,  :null => false
      t.string    :first_name
      t.string    :last_name
      t.string    :sur_name
      t.string    :gender
      t.string    :city
      t.string    :state
      t.string    :country_id
      t.string    :phone
      t.string    :address1
      t.string    :address2
      t.string    :address3
      t.string    :dob
      t.string    :image_id
      t.integer   :external_id, :default => 1, :null => false
      t.datetime  :current_sign_in_at
      t.datetime  :last_sign_in_at
      t.string    :current_sign_in_ip
      t.string    :last_sign_in_ip
      t.integer   :sign_in_count, :default => 0, :null => false 
      t.datetime  :remember_created_at
      t.string    :reset_password_token
      t.datetime  :reset_password_sent_at
      t.timestamps
    end
  end
end
