class AddProjectIdToReferences < ActiveRecord::Migration[5.0]
  def change
    add_column :references, :project_id, :integer
  end
end
