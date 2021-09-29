# frozen_string_literal: true

require 'spec_helper'

describe 'apache' do
  # on_supported_os.each do |os, os_facts|
  #   context "on #{os}" do
  #     let(:facts) { os_facts }
  it { is_expected.to contain_class('apache::install') }
  it { is_expected.to contain_class('apache::config') }
  it { is_expected.to contain_class('apache::service') }
  it { is_expected.to compile }

  case os_facts[:osfamily]
  when 'RedHat'
    it { is_expected.to contain_package{'httpd').with(ensure: 'present') }
    it { is_expected.to contain_service{'httpd').with(ensure: 'runnning', enable: true, hasrestart: true ) }
  }
end
