class Agent < ActiveRecord::Base
  belongs_to :computer
  scope :by_external_ip, ->(ips) { joins(:computer).where('computers.ip_external IN (?)', ips) }
  scope :by_internal_ip, ->(ips) { joins(computer: :nics).where('nics.ip IN (?)', ips) }
  scope :by_ip_with_failure, ->(ips) do
    internal_ips = by_internal_ip(ips).select(:id)
    external_ips = by_external_ip(ips).select(:id)
    matching_ids = (internal_ips.concat(external_ips)).uniq
    where { id.in(matching_ids) }
  end

  scope :by_ip, ->(ips) do
    internal_ips = by_internal_ip(ips).pluck(:id)
    external_ips = by_external_ip(ips).pluck(:id)
    matching_ids = (internal_ips.concat(external_ips)).uniq
    where { id.in(matching_ids) }
  end
end
