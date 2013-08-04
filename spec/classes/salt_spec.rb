require 'spec_helper'

describe 'salt' do

  context 'on unsupported distributions' do
    let(:facts) {{ :osfamily => 'Unsupported' }}

    it 'we fail' do
      expect { subject }.to raise_error(/Unsupported platform: Unsupported/)
    end
  end

  ['Debian', 'RedHat', 'SUSE', 'Archlinux'].each do |distro|
    context "on #{distro}" do
      let(:facts) {{
        :osfamily => distro,
      }}
      
      it { should contain_class('salt::master::install') }
      it { should contain_class('salt::master::config') }
      it { should contain_class('salt::master::service') }
      it { should contain_class('salt::minion::install') }
      it { should contain_class('salt::minion::config') }
      it { should contain_class('salt::minion::service') }
      end
  end
end
      