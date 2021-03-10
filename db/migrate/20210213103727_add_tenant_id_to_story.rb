class AddTenantIdToStory < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :tenant_id, :integer
  end
end
