class AddAgentIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :agent_id, :integer
    add_column :users, :is_agent, :boolean
  end
end
