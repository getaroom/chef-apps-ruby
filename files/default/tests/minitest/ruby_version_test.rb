describe_recipe "apps-ruby::ruby_version" do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "/srv/www/shared/.ruby-version" do
    let(:app_user) { user "www" }
    let(:app_group) { group "www" }
    let(:ruby_version) { file "/srv/www/shared/.ruby-version" }
    let(:stat) { File.stat(ruby_version.path) }

    it "exists" do
      ruby_version.must_exist
    end

    it "is owned by the app user" do
      assert_equal app_user.uid, stat.uid
      assert_equal app_group.gid, stat.gid
    end

    it "can be read by everyone but written to only by the user and group" do
      assert_equal "664".oct, (stat.mode & 007777)
    end

    it "specifies the configured ruby version" do
      ruby_version.must_include "1.9.3-p125"
    end
  end

  describe "an application not hosted on this server" do
    it "does not create a .ruby-version file" do
      file("/srv/princess/shared/.ruby-version").wont_exist
    end
  end

  describe "an application hosted on this server but not using .ruby-version" do
    it "does not create a .ruby-version file" do
      file("/srv/toad/shared/.ruby-version").wont_exist
    end
  end
end
