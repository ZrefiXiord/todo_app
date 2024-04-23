class Todo{
  final String name;
  bool isDone=false;
  Todo(this.name);
  Todo.fromIsDone(this.name,this.isDone);

  @override
  String toString() {
    return '{$name,$isDone}';
  }
}