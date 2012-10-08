# coding: utf-8
require 'user'

describe User do
  describe '#admin?' do
    context '管理者の場合' do
      before { @admin_user = User.new(role: 'admin') }

      subject { @admin_user }
      it { should be_admin }
    end

    context '一般ユーザの場合' do
      before { @ordinary_user = User.new(role: nil) }

      subject { @ordinary_user }
      it { should_not be_admin }
    end
  end

  describe '#runnable_system?' do
    context '管理者がリンディさんの場合' do
      before do
        @lindi = User.new(name: 'Lindi')
        @lindi.stub!(admin?: true)
      end

      subject { @lindi }
      it { should be_runnable_system }
    end
  end
end