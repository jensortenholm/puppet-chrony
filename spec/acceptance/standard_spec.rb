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
    case fact('osfamily')
    when 'RedHat'
      'chronyd'
    else
      'chrony'
    end

  it 'should apply with no errors' do
    result = apply_manifest(manifest, :catch_failures => true)
    expect(@result.exit_code).to eq 2
  end

  it 'should apply a second time without changes' do
    result = apply_manifest(manifest, :catch_failures => true)
    expect(@result.exit_code).to eq 0
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
