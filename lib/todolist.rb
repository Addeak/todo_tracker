class TodoList
  def initialize
    @complete_list = []
    @incomplete_list = []
  end

  def add(todo)
    @incomplete_list << todo
  end

  def incomplete
    move_done
    @incomplete_list
  end

  def complete
    move_done
    @complete_list
  end

  def give_up!
    @incomplete_list.each { |todo| todo.mark_done! }
  end

  private

  def move_done
    @incomplete_list.each do |todo| 
      @complete_list << todo if todo.done?
    end 
    @incomplete_list.reject! { |todo| todo.done? }
  end
end