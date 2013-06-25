require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :name => "MyString",
      :team_members => "MyText",
      :notes => "MyText",
      :idea_id => 1,
      :completed => false
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tasks_path, "post" do
      assert_select "input#task_name[name=?]", "task[name]"
      assert_select "textarea#task_team_members[name=?]", "task[team_members]"
      assert_select "textarea#task_notes[name=?]", "task[notes]"
      assert_select "input#task_idea_id[name=?]", "task[idea_id]"
      assert_select "input#task_completed[name=?]", "task[completed]"
    end
  end
end
