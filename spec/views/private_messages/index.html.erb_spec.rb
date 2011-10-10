require 'spec_helper'

describe "private_messages/index.html.erb" do
  before(:each) do
    assign(:private_messages, [
      stub_model(PrivateMessage,
        :user_id => 1,
        :Message => "Message"
      ),
      stub_model(PrivateMessage,
        :user_id => 1,
        :Message => "Message"
      )
    ])
  end

  it "renders a list of private_messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Message".to_s, :count => 2
  end
end
