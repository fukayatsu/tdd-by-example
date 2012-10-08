require 'user'

describe User do
  describe '#admin?' do
    subject { @admin_user }
    it { should be_admin }
  end
end