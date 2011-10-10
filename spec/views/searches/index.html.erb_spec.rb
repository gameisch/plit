require 'spec_helper'

describe "searches/index.html.erb" do
  before(:each) do
    assign(:searches, [
      stub_model(Search,
        :keywords => "Keywords",
        :user_id => 1,
        :user_name => "User Name",
        :user_nick => "User Nick",
        :user_proff => "User Proff",
        :user_adress => "User Adress",
        :user_detail => "User Detail",
        :post_title => "Post Title",
        :post_content => "MyText"
      ),
      stub_model(Search,
        :keywords => "Keywords",
        :user_id => 1,
        :user_name => "User Name",
        :user_nick => "User Nick",
        :user_proff => "User Proff",
        :user_adress => "User Adress",
        :user_detail => "User Detail",
        :post_title => "Post Title",
        :post_content => "MyText"
      )
    ])
  end

  it "renders a list of searches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Keywords".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Nick".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Proff".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Adress".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Detail".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Post Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
