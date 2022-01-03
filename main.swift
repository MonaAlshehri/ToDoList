//
//  main.swift
//  Resturant
//
//  Created by Mona alshehri on 26/12/2564 BE.
//





class TodoList {
    var taskList : Array<Task>
    init(){
        taskList = Array()
    }
    
  
    func listAllTasks(){
        print("What to do list ")
        
        if(taskList.count > 0){
            for (index, task) in taskList.enumerated() {
                print("\(index+1)- \(task.formattedStringOfTask())")
            }
        }else{
            print("Nothing to do sweetie")
        }
        
        
    }
    func addToDoListItem  (){
        var newTaskName :String
        print("what is new  ? :")
        if let userInput = readLine(){
            newTaskName = userInput
            self.taskList.append(Task(taskName: newTaskName, isDone: false))
            print("aright , its saved  ")
        }else{
            print("there is somthing wrong")
        }
        
    }
 
    func RemoveToDoListItem (){
        var taskIndex :Int
        if(taskList.count == 0){
            print("Is Empty ,you know we can't remove ")
        }else{
            print("what to do you want to remove :")
            if let userInput = readLine() {
                taskIndex = Int(userInput)!
                let task = taskList.index(before: taskIndex)
                taskList.remove(at: task)
                print(" alright ")
            }else{
                print("there is somthing wrong")
            }
            
        }
    }
   
    func UpdateToDoListItem (){
        var taskIndex :Int
        var newTaskName :String
        if(taskList.count == 0){
            print("Empty ,you know we can update ")
        }else{
            print("what do you want to update :")
            if let userInput = readLine() {
                taskIndex = Int(userInput)!
                let task = taskList.index(before: taskIndex)
                for (index, item ) in taskList.enumerated() {
                    if index == task {
                        if item.getIsDone(){
                            print("You amazing ,you complete your task successfully")
                        }else{
                            print("what do you want to update:")
                            if let userInput = readLine() {
                                newTaskName = userInput
                                item.setTaskName(taskName: newTaskName)
                                print("its has ubdate")
                            }
                        }
                        
                    }
                }
                
            }else{
                print("there is somthing wrong")
            }
            
        }
        
    }
    //    function to make the task Done
    func MarkDoneForToDoListItem (){
        var taskIndex :Int
        if(taskList.count == 0){
            print("  Empty,you know we can't mark Done ")
        }else{
            print("what is done ?:")
            if let userInput = readLine() {
                taskIndex = Int(userInput)!
                let task = taskList.index(before: taskIndex)
                for (index, item ) in taskList.enumerated() {
                    if index == task {
                        item.markIsDone()
                        print("Done")
                    }
                }
            }else{
                print("there is somthing wrong")
            }
            
        }
        
    }
    
    
}

class Task{
    var  taskName : String = ""
    var  isDone : Bool
    init(taskName:String,isDone:Bool){
        self.taskName = taskName
        self.isDone = isDone
    }
    func getTaskName() -> String {
        return self.taskName
    }
    func setTaskName(taskName:String)  {
        self.taskName = taskName
    }
    func getIsDone() -> Bool {
        return self.isDone
    }
    func setIsDone(isDone:Bool)  {
        self.isDone = isDone
    }
    func markisInDone() {
        self.isDone = false
    }
    func markIsDone(){
        self.isDone = true
    }
   
    func formattedStringOfTask()-> String{
        var comStatus : String?
        if isDone == true {
            comStatus = "Completed "
        }else{
            comStatus = "Not Completed "
        }
        return """
                Your To-do task is : \(taskName), Status : \(comStatus!)
                """
    }
}


let  todoList = TodoList()
var menuChoice :String = ""

print("""
      Will hello there ,
           choice what you option from the menu
      
                 1. Your List
                 2. Add new
                 3. Done
                 4. Upate
                 5. Remove
                 0. Exit
      """)
while(menuChoice != "0") {
    print("\n Enter your option choice:")
    if let  userInput = readLine(){
        menuChoice = userInput
        switch menuChoice {
        case "1":
            todoList.listAllTasks()
        case "2":
            todoList.addToDoListItem()
        case "3":
            todoList.MarkDoneForToDoListItem()
        case "4":
            todoList.UpdateToDoListItem()
        case "5":
            todoList.RemoveToDoListItem()
        case "0":
            break;
        default:
            print("please sweetie, Enter your  choice 1,2,3,4, or 0  ⌨️:")
        }
    }
}
