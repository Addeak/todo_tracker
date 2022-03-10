require 'todo'
require 'todolist'

RSpec.describe "integration" do
  context "after adding some tasks" do
    it "returns incomplete tasks" do
      todo_list = TodoList.new
      task_1 = Todo.new("Meal prep")
      task_2 = Todo.new("Find miissing sock")
      todo_list.add(task_1)
      todo_list.add(task_2)
      expect(todo_list.incomplete).to eq [task_1, task_2]
    end
  end

  context "after completing some tasks" do
    it "returns completed tasks" do
      todo_list = TodoList.new
      task_1 = Todo.new("Meal prep")
      task_2 = Todo.new("Find miissing sock")
      todo_list.add(task_1)
      todo_list.add(task_2)
      task_1.mark_done!
      expect(todo_list.complete).to eq [task_1]
    end

    it "returns incomplete tasks" do
      todo_list = TodoList.new
      task_1 = Todo.new("Meal prep")
      task_2 = Todo.new("Find miissing sock")
      todo_list.add(task_1)
      todo_list.add(task_2)
      task_1.mark_done!
      expect(todo_list.incomplete).to eq [task_2]
    end

    it "outputs correct list after several iterations" do
      todo_list = TodoList.new
      task_1 = Todo.new("Meal prep")
      task_2 = Todo.new("Find miissing sock")
      task_3 = Todo.new("Get a life")
      todo_list.add(task_1)
      todo_list.add(task_2)
      task_1.mark_done!
      todo_list.complete
      todo_list.add(task_3)
      task_2.mark_done!
      expect(todo_list.complete).to eq [task_1, task_2]
    end
  end

  context "after losing all hope" do
    it "marks all tasks as complete" do
      todo_list = TodoList.new
      task_1 = Todo.new("Meal prep")
      task_2 = Todo.new("Find miissing sock")
      task_3 = Todo.new("Get a life")
      todo_list.add(task_1)
      todo_list.add(task_2)
      todo_list.add(task_3)
      task_2.mark_done!
      todo_list.incomplete
      todo_list.give_up!
      expect(todo_list.complete).to eq [task_2, task_1, task_3]
    end
  end
end

