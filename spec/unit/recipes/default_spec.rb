#
# Cookbook Name:: tomcat_okram
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'tomcat_okram::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'create the tomcat user' do
      expect(chef_run).to create_user('tomcat')
    end

    it 'creats the tomcat group'

    it 'create the tomcat systemd file'

  end
end
