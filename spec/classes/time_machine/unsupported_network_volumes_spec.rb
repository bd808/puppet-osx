require 'spec_helper'

describe 'osx::time_machine::unsupported_network_volumes' do
  let(:facts) { {:boxen_user => 'ilikebees' } }
  describe('allow') do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to true' do
      should contain_boxen__osx_defaults('Toggle Whether Unsupported Network Volumes are Displayed in Time Machine').with({
        :user   => facts[:boxen_user],
        :key    => 'TMShowUnsupportedNetworkVolumes',
        :domain => 'com.apple.systempreferences',
        :value  => true,
      })
    end
  end

  describe('disallow') do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to false' do
      should contain_boxen__osx_defaults('Toggle Whether Unsupported Network Volumes are Displayed in Time Machine').with({
        :user   => facts[:boxen_user],
        :key    => 'TMShowUnsupportedNetworkVolumes',
        :domain => 'com.apple.systempreferences',
        :value  => false,
      })
    end
  end

end
