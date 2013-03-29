# -*- coding: utf-8 -*-

require 'spec_helper'
require 'rspec/expectations'

describe Zhiyi::Member do

  before(:each) do
    Zhiyi::Member.load (File.dirname(__FILE__) + "/config.yaml")

    @person = {
      uid: 'member-test-000',
      sn: '张',
      cn: '三',
      displayName: '张三',
      userPassword: 'zhangsan'
    }
    @newpass = 'zhangsannew'
    
    Zhiyi::Member::User.delete @person[:uid] if Zhiyi::Member::User.exist?(@person[:uid])
  end

  describe "[#2], 增加新用户" do
    it "创建一个新用户" do |t|
      Zhiyi::Member::User.add @person
      Zhiyi::Member::User.exist?(@person[:uid]).should == true
    end
  end


  describe "[#3], [#4], 口令管理" do
    it "修改与重置口令" do |t|
      Zhiyi::Member::User.add @person
      Zhiyi::Member::User.mypass?(@person[:uid], @person[:userPassword]).should == true
      Zhiyi::Member::User.reset_password(@person[:uid], @newpass)
      Zhiyi::Member::User.mypass?(@person[:uid], @person[:userPassword]).should == false
      Zhiyi::Member::User.mypass?(@person[:uid], @newpass).should == true
      Zhiyi::Member::User.all.empty?.should == false
    end
  end
end
