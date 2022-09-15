require 'rails_helper'

RSpec.describe ApplicationController, type: :routing do
  describe 'routing' do
    it 'routes to blocks#index' do
      expect(get: '/').to route_to('blocks#index')
    end
  end
end
