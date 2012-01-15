require 'spec_helper'

describe Weibo::Base do

  before(:each) do
    @client = create_weibo_client
  end

  context "#trends_statuses" do
    it "pass query argument" do
      @client.stub(:perform_post)
      @client.should_receive(:perform_post).with("/trends/statuses.json", {:body => {:count=>1999, :trend_name => "cat", :page =>5 }})
      @client.trends_statuses('cat', {:page => 5, :count => 1999})
    end
  end

  context "Making requests" do
    it "should posts with the parameters in the body" do
      query = {:status => "hello world", :url => 'url'}
      Weibo::Request.should_receive(:post).with(@client, "/statuses/upload_url_text.json", {:body=>{:status=>"hello world", :url=>"url"}, :query=>{:source=>"dev_key"}})
      @client.upload_url_text(query)
    end
  end

end
