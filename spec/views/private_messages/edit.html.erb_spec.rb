require 'spec_helper'

describe "private_messages/edit.html.erb" do
  before(:each) do
    @private_message = assign(:private_message, stub_model(PrivateMessage,
      :user_id => 1,
      :Message => "MyString"
    ))
  end

  it "renders the edit private_message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => private_messages_path(@private_message), :method => "post" do
      assert_select "input#private_message_user_id", :name => "private_message[user_id]"
      assert_select "input#private_message_Message", :name => "private_message[Message]"
    end
  end
end
