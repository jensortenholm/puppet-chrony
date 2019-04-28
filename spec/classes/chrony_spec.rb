require 'spec_helper'

describe 'chrony' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it {
        is_expected.to contain_file('/etc/chrony.conf').with(
          ensure: 'file',
          owner:  'root',
          group:  'root',
          mode:   '0644',
        )
      }

      ['present', 'absent'].each do |pkg_status|
        context "with package_ensure #{pkg_status}" do
          let(:params) { { package_ensure: pkg_status } }

          it {
            is_expected.to contain_package('chrony').with(
              ensure: pkg_status,
            )
          }
        end
      end

      ['running', 'stopped'].each do |svc_status|
        context "with service_ensure #{svc_status}" do
          let(:params) { { service_ensure: svc_status } }

          it {
            is_expected.to contain_service('chronyd').with(
              ensure: svc_status,
            )
          }
        end
      end

      [true, false].each do |svc_enable|
        context "with service_enabler #{svc_enable}" do
          let(:params) { { service_enable: svc_enable } }

          it {
            is_expected.to contain_service('chronyd').with(
              enable: svc_enable,
            )
          }
        end
      end
    end
  end
end
