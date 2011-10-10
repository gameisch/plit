require 'spec_helper'

describe "searches/edit.html.erb" do
  before(:each) do
    @search = assign(:search, stub_model(Search,
      :keywords => "MyString",
      :user_id => 1,
      :user_name => "MyString",
      :user_nick => "MyString",
      :user_proff => "MyString",
      :user_adress => "MyString",
      :user_detail => "MyString",
      :post_title => "MyString",
      :post_content => "MyText"
    ))
  end

  it "renders the edit search form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => searches_path(@search), :method => "post" do
      assert_select "input#search_keywords", :name => "search[keywords]"
      assert_select "input#search_user_id", :name => "search[user_id]"
      assert_select "input#search_user_name", :name => "search[user_name]"
      assert_select "input#search_user_nick", :name => "search[user_nick]"
      assert_select "input#search_user_proff", :name => "search[user_proff]"
      assert_select "input#search_user_adress", :name => "search[user_adress]"
      assert_select "input#search_user_detail", :name => "search[user_detail]"
      assert_select "input#search_post_title", :name => "search[post_title]"
      assert_select "textarea#search_post_content", :name => "search[post_content]"
    end
  end
end
