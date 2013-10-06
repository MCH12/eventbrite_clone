class AddTermsOfServiceToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :terms_of_service, :string
  end
end
