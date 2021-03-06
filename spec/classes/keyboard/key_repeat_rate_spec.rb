require 'spec_helper'

describe 'osx::keyboard::key_repeat_rate' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'with parameters' do
    let(:params) { {:rate => 10} }

    it 'allows you to pass a rate value' do
      should contain_boxen__osx_defaults('key repeat rate').with({
        :domain => 'NSGlobalDomain',
        :key    => 'KeyRepeat',
        :value  => params[:rate],
        :user   => facts[:boxen_user]
      })
    end
  end
end
