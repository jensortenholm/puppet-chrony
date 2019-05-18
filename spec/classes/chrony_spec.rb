require 'spec_helper'

describe 'chrony' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      case os_facts[:os]['family']
      when 'Debian'
        let(:chrony_conf) { '/etc/chrony/chrony.conf' }
        let(:chrony_pkg)  { 'chrony' }
        let(:chrony_svc)  { 'chrony' }
        let(:chrony_grp)  { 'root' }
        let(:keyfile)     { '/etc/chrony/chrony.keys' }
      when 'RedHat'
        let(:chrony_conf) { '/etc/chrony.conf' }
        let(:chrony_pkg)  { 'chrony' }
        let(:chrony_svc)  { 'chronyd' }
        let(:chrony_grp)  { 'chrony' }
        let(:keyfile)     { '/etc/chrony.keys' }
      end

      it { is_expected.to compile.with_all_deps }
      it {
        is_expected.to contain_file(chrony_conf).with(
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
            is_expected.to contain_package(chrony_pkg).with(
              ensure: pkg_status,
            )
          }
        end
      end

      ['running', 'stopped'].each do |svc_status|
        context "with service_ensure #{svc_status}" do
          let(:params) { { service_ensure: svc_status } }

          it {
            is_expected.to contain_service(chrony_svc).with(
              ensure: svc_status,
            )
          }
        end
      end

      [true, false].each do |svc_enable|
        context "with service_enabler #{svc_enable}" do
          let(:params) { { service_enable: svc_enable } }

          it {
            is_expected.to contain_service(chrony_svc).with(
              enable: svc_enable,
            )
          }
        end
      end

      context 'with keys' do
        let(:params) do
          {
            keys: [
              {
                'id'      => 5,
                'hashalg' => 'SHA1',
                'hash'    => 'HEX:B2C7F9816429F120C2B1C387A4802E07CA3930FA',
              },
            ],
          }
        end

        it {
          is_expected.to contain_file(keyfile).with(
            ensure: 'file',
            owner:  'root',
            group:  chrony_grp,
            mode:   '0640',
          )
        }
      end

      context 'with both noclientlog and ratelimit' do
        let(:params) do
          {
            noclientlog: true,
            ratelimit: {
              interval: 1,
            },
          }
        end

        it {
          is_expected.to compile.with_all_deps.and_raise_error(
            %r{You can't specify both noclientlog and ratelimit},
          )
        }
      end

      context 'with both rtcfile and rtcsync' do
        let(:params) do
          {
            rtcsync: true,
            rtcfile: '/path/file',
          }
        end

        it {
          is_expected.to compile.with_all_deps.and_raise_error(
            %r{You can't specify both rtcfile and rtcsync options},
          )
        }
      end

      if os_facts[:os]['name'] == 'Debian'
        ['servers', 'pools', 'peers'].each do |resource|
          ['mindelay', 'asymmetry'].each do |testparam|
            context "On Debian with resource #{resource} and param #{testparam}" do
              let(:params) do
                {
                  resource.to_s => [
                    {
                      hostname: 'test.ntp.org',
                      testparam.to_s => 5,
                    },
                  ],
                }
              end

              it {
                is_expected.to compile.with_all_deps.and_raise_error(
                  %r{does not support options mindelay and asymmetry},
                )
              }
            end
          end
        end

        context 'On Debian with refclock including param width' do
          let(:params) do
            {
              refclocks: [
                {
                  driver: 'PPS',
                  param:  '/dev/pps0',
                  width: 50,
                },
              ],
            }
          end

          it {
            is_expected.to compile.with_all_deps.and_raise_error(
              %r{does not support options width and pps in refclock},
            )
          }
        end

        context 'On Debian with refclock including param pps' do
          let(:params) do
            {
              refclocks: [
                {
                  driver: 'PPS',
                  param:  '/dev/pps0',
                  pps:    true,
                },
              ],
            }
          end

          it {
            is_expected.to compile.with_all_deps.and_raise_error(
              %r{does not support options width and pps in refclock},
            )
          }
        end
      end
    end
  end
end
