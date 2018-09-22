module RailsPatch
  def insert_fixture(fixture, table_name)
    # A regression with rails 4.2.5 breaks fixtures with symbol keys, specifically this one method.
    # So, stringify keys in the fixture hash being sent to this method.
    super(fixture.stringify_keys, table_name)
  end
end

Rails.application.config.after_initialize do
   ActiveRecord::Base.connection.class.include(RailsPatch22584)
 end
