# encoding: utf-8
require "spec_helper"

describe ApplicationHelper do
  let(:user) { build(:user) }

  describe "#page_title" do
    it "should generate a page_title" do
      helper.page_title.should eql("Ruby Usergroup Hamburg - Hamburg on Ruby - Heimathafen der Hamburger Ruby Community - Ruby / Rails Usergroup Hamburg")
    end

    it "should have a page_title for default label" do
      Whitelabel.label = nil
      helper.page_title.should eql("Wir on Ruby - Ruby Communities Deutschland - Ruby Communities Deutschland")
    end
  end
end
