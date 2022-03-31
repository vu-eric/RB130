# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title
  
  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation
  def add(todo)
    raise TypeError.new "Can only add Todo objects" unless todo.instance_of?(Todo)

    todos << todo 
  end

  alias_method :<<, :add

  def size 
    todos.length 
  end

  def first 
    todos.first 
  end

  def last 
    todos.last 
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all?{|todo| todo.done?}
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    todos.fetch(index).done!
  end

  def mark_undone_at(index)
    todos.fetch(index).undone!
  end

  def done!
    todos.each {|todo| todo.done!}
  end

  def shift 
    todos.shift 
  end

  def pop 
    todos.pop
  end

  def remove_at(index)
    todos.delete_at(index) if todos.fetch(index)
  end

  def to_s
    str = "---- Today's Todos ----"
    todos.each{|todo| str += "\n#{todo}"}
    str
  end

  def each 
    todos.each {|todo| yield(todo)}
    self
  end

  def select 
    new_list = TodoList.new(title)
    each {|todo| new_list << todo if yield(todo)}
    new_list
  end

  def find_by_title(todo_title)
    each{|todo| return todo if todo.title == todo_title}
    nil
  end

  def all_done 
    select{|todo| todo.done?}
  end

  def all_not_done
    select{|todo| !todo.done?}
  end

  def mark_done(todo_title)
    find_by_title(todo_title) && find_by_title(todo_title).done!
  end

  def mark_all_done
    each{|todo| todo.done!}
  end

  def mark_all_undone 
    each{|todo| todo.undone!}
  end

  protected 

  attr_reader :todos
end

