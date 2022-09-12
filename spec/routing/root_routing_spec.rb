require 'rails_helper'

RSpec.describe ApplicationController, type: :routing do
  describe 'routing' do
    it 'routes to teachers#index' do
      expect(get: '/').to route_to('teachers#index')
    end
  end
end
