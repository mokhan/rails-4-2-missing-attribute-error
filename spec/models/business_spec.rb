require 'rails_helper'

describe Business do
  context "when silly things happen" do
    let!(:business) { Business.create! }
    let!(:computer) { business.computers.create!(ip_external: '8.8.8.8') }
    let!(:agent) { Agent.create!(computer: computer) }
    let!(:nic) { Nic.create(computer: computer, ip: '10.0.0.1') }
    let(:query) { ['10.0.0.1', '8.8.8.8'] }

    it 'does not work' do
      business.agents.includes([:computer]).by_ip_with_failure(query)
    end

    it 'works' do
      business.agents.includes([:computer]).by_ip(query)
    end
  end
end
