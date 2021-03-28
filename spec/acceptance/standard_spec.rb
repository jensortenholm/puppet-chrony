require 'spec_helper_acceptance'

describe 'chrony class' do
  let(:manifest) do
    <<-EOS
      class { 'chrony':
        access_rules => [
          {
            access => 'allow',
            subnet => '192.168.',
          },
        ],
      }
    EOS
  end

  servicename =
    case host_inventory['facter']['os']['family']
    when 'RedHat'
      'chronyd'
    when 'Suse'
      'chronyd'
    else
      'chrony'
    end

  it 'applies idempotently' do
    idempotent_apply(manifest)
  end

  describe package('chrony') do
    it { is_expected.to be_installed }
  end

  describe service(servicename) do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end

  describe port(123) do
    it { is_expected.to be_listening.with('udp') }
  end
end
