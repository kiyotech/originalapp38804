class AddAddressToResume < ActiveRecord::Migration[6.0]
  def change
    add_column :resumes, :point_address, :string
    add_column :resumes, :latitude, :float
    add_column :resumes, :longitude, :float
  end
end
