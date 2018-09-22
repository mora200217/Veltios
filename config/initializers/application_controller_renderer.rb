# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )
module RailsPatch22584
  def insert_fixture(fixture, table_name)
    # A regression with rails 4.2.5 breaks fixtures with symbol keys, specifically this one method.
    # So, stringify keys in the fixture hash being sent to this method.
    super(fixture.stringify_keys, table_name)
  end
end

ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.include(RailsPatch22584)
