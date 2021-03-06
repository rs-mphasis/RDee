require 'spec_helper'

class TestSubject
  include RDee::TargetParser
end


describe RDee::TargetParser do

  let(:parser) { TestSubject.new }

  it "should parse generic Firefox" do
    target, version, host = parser.parse(:firefox)
    expect(target).to eql :firefox
  end

  it "should parse the version number" do
    target, version, host = parser.parse(:firefox30)
    expect(version).to eql '30'
  end

  it "should handle just target and host" do
    target, version, host = parser.parse(:firefox_win81)
    expect(target).to eql :firefox
    expect(host).to eql 'Windows 8.1'
    expect(version).to be_nil
  end

  it "should parse the windows 10 host" do
    target, version, host = parser.parse(:firefox30_win10)
    expect(host).to eql 'Windows 10'
  end

  it "should parse the windows 8.1 host" do
    target, version, host = parser.parse(:firefox30_win81)
    expect(host).to eql 'Windows 8.1'
  end

  it "should parse the windows 8 host" do
    target, version, host = parser.parse(:firefox30_win8)
    expect(host).to eql 'Windows 8'
  end

  it "should parse the windows 7 host" do
    target, version, host = parser.parse(:firefox30_win7)
    expect(host).to eql 'Windows 7'
  end

  it "should parse the windows xp host" do
    target, version, host = parser.parse(:firefox30_winxp)
    expect(host).to eql 'Windows XP'
  end

  it "should parse el capitan" do
    target, version, host = parser.parse(:firefox30_el_capitan)
    expect(host).to eql 'OS X 10.11'
  end

  it "should parse mountain lion" do
    target, version, host = parser.parse(:firefox30_mountain_lion)
    expect(host).to eql 'OS X 10.8'
  end

  it "should parse mavricks" do
    target, version, host = parser.parse(:firefox30_mavricks)
    expect(host).to eql 'OS X 10.9'
  end

  it "should parse linux" do
    target, version, host = parser.parse(:firefox30_linux)
    expect(host).to eql 'Linux'
  end

  it "should cleanly handle an invalid host" do
    target, version, host = parser.parse(:firefox30_foobar)
    expect(host).to be_nil
  end
end
