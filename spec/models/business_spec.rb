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

    it 'also fails' do
      expect(->{
        business.agents.by_internal_ip(query).select(:id)
        + business.agents.by_external_ip(query).select(:id)
      }).to_not raise_error
    end

    it 'also works' do
      expect(->{
        business.agents.by_internal_ip(query).pluck(:id)
        + business.agents.by_external_ip(query).pluck(:id)
      })
    end
  end
end
