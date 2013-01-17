require "workflow_sequel_adapter/version"

module WorkflowSequelAdapter
  def before_validation
    write_initial_state
    super
  end

  def load_workflow_state
    send self.class.workflow_column
  end

  def persist_workflow_state(new_value)
    send "#{self.class.workflow_column}=", new_value
    save_changes
  end

  private
  def write_initial_state
    if load_workflow_state.nil? || load_workflow_state == ''
      send("#{self.class.workflow_column}=", current_state.to_s)
    end
  end
end