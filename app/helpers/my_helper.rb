module MyHelper
  def my_tasks
    @my_tasks ||= Task.where(tenant_id: current_user.tenant_id)
  end
end
