namespace :expert_todo do
  namespace :load do
    desc 'Load demo data'
    task demodata: :environment do
      tenant = Tenant.find_or_create_by!(name: 'Demo')
      p tenant
      user   = User.create_with(password: 'P@ssw0rd', tenant: tenant, name: 'demo user', confirmed_at: Time.now)
                   .find_or_create_by!(email: 'demouser@example.com')
      p user
    end
  end
end
