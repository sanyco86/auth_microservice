RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end

FactoryBot.use_parent_strategy = false
FactoryBot.define { to_create(&:save) }
