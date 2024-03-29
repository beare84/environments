# frozen_string_literal: true

require 'spec_helper'

describe 'apache::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      it { is_expected.to contain_class('apache::install') }
      it { is_expected.to contain_class('apache::config') }
      it { is_expected.to contain_class('apache::service') }
      it { is_expected.to compile }
    end
  end
end
