# coding: utf-8
require 'user'

describe User do
  describe '#admin?' do
    context '管理者の場合' do
      before { @admin_user = User.new(role: 'admin') }

      subject { @admin_user }
      it { should be_admin }
    end
  end
end