require 'spec_helper'

describe "private_messages/show.html.erb" do
  before(:each) do
    @private_message = assign(:private_message, stub_model(PrivateMessage,
      :user_id => 1,
      :Message => "Message"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Message/)
  end
end
