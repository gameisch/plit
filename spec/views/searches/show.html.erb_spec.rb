require 'spec_helper'

describe "searches/show.html.erb" do
  before(:each) do
    @search = assign(:search, stub_model(Search,
      :keywords => "Keywords",
      :user_id => 1,
      :user_name => "User Name",
      :user_nick => "User Nick",
      :user_proff => "User Proff",
      :user_adress => "User Adress",
      :user_detail => "User Detail",
      :post_title => "Post Title",
      :post_content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Keywords/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Nick/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Proff/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Adress/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Detail/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Post Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
