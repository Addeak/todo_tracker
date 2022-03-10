require 'todo'

RSpec.describe Todo do
  context "initially" do
    it "raises an error if task is an empty string" do
      expect { Todo.new("") }.to raise_error "Task cannot be empty."
    end

    it "returns the task as a string" do
      task = Todo.new("Clean bedroom")
      expect(task.task).to eq "Clean bedroom"
    end

    it "knows the task has not been completed" do
      task = Todo.new("Clean bedroom")
      expect(task.done?).to eq false
    end
  end

  context "after marking a method as completed" do
    it "returns true upon checking" do
      task = Todo.new("Meal prep")
      task.mark_done!
      expect(task.done?).to eq true
    end
  end
end