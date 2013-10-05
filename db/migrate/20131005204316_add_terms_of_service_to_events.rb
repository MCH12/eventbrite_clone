class AddTermsOfServiceToEvents < ActiveRecord::Migration
  def change
    add_column :events, :terms_of_service, :string
  end
end
