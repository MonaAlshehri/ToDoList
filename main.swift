//
//  main.swift
//  last
//
//  Created by Mona alshehri on 29/12/2564 BE.
//

import Foundation

class TodoList {
    var taskList : Array<Task>
    init(){
    taskList=Array()
    }

func listAllTasks(){
    print ("Your to do list honey is ")
    if (taskList.count > 0)
    {
        for (index , task )in taskList.enumerated(){
            print("\(index+1)-\(task.formattedstringoftask())")
        }
        else{
            print("You dont't a to do")
        }
    }
    
}
func addToDoListItem (){
    var newtaskname : String
    print("Enter whats is new to do :")
    if let userinput =readLine(){
        newtaskname =userinput
        self.taskList.append(Task(taskName:newtaskname ,isdone : fasle))
        print("it has been seved ...  ")
    }else{
        print("your did not enter the input correctly")
    }
    
}
func removetodolistitem (){
    var taskindex : int
    if (taskList.count == 0){
        print ("The list is empty ")
    }
    else{
        print("what should i delete ?  ")
        if let userinput = readLine(){
            taskindex=Int(userinput)!
            let task = taskList.index(before: taskindex)
            taskList.remove(at: task)
            print(" it has been removed")
        }
        else{
            print("you did not enter the input right ")
        }
    }
}
func updatetodolistitem (){
    var taskindex: Int
    var newtaskname :String
    if(taskList.count==0){
        print("the list is empty ")
    }
    else{
        print("do you need update ? ")
        if let userinput = readLine(){
            taskindex=Int(userinput)!
            let task = taskList.index(before:taskindex)
            for (index , item )in taskList.enumerated() {
                if index == task {if item.getisdone () {print("you complet yor task ")}
                    else{
                        print("enter your new to do task ")
                        if let userinput = readLine(){
                            newtaskname = userinput
                            item.settaskname(taskname :newtaskname)
                            print("your to do task update ")
                        }
                    }}
            }
            
        }else{print("you did not enter the input correctly ")}
    }
}
func markdone (){
    var taskindex : Int
    if (taskList.count==0 ){
        print("you to do lis is empty ")
    }else{
        print("enter the ro do task that has done ")
        if let userinput = readLine(){
            let task = taskList.index(before: taskindex)
            for (index , item )in taskList.enumerated(){
                if index == task {
                    item.markdone()
                    print("its done ")
                }
            }
        }else{
            print("you did not enter right ")
        }
    }
}
class task {
    var  taskname : String = ""
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
              comStatus = "Completed yayy"
          }else{
              comStatus = "Not Completed "
          }
          return """
                  Your To-do task is 🗒: \(taskName), Status ✅: \(comStatus!)
                  """
      }
  }
    let  todoList = TodoList()
    var menu :String = " "
    print("""
Will hello there
this is the menu
1- display yoour to do
2- add new to do
3- mark as done
4- update item
5 remove item
0 exit

""")
    while (menu != "0"){
        print ("enter your option ")
        if let userinput = readLine(){
            menu=userinput
            switch menu {
            case"1" :
                TodoList.listAllTasks()
            case"2" :
                TodoList.addToDoListItem ()
            case"3" :
                TodoList.removetodolistitem ()
            case"4" :
                TodoList.updatetodolistitem ()
            case"5" :
                TodoList.markdone ()
            case"0" :
                break;
            default:
                print("please , enter you choice ")
            }
        }
    }
    



