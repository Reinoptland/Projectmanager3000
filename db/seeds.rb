Todo.delete_all
Project.delete_all

Project.create([
  { project_name: "ProjectX", project_active: false },
  { project_name: "Housekeeping", project_active: true },
  { project_name: "Robot Utopia", project_active: true },
  ])

Todo.create([
  { title: "Do the laundry", completed: false, project_id: 2 },
  { title: "Conquer the world", completed: true, project_id: 1  },
  { title: "Clean up room", completed: false, project_id: 2 },
  { title: "Recruit army of Referbots", completed: true, project_id: 1 },
  { title: "Show mercy to my enemies", completed: false, project_id: 3 },
  { title: "Welcome our new robot overlords", completed: true, project_id: 3 },
])



puts "Created #{Todo.count} Todos"
puts "Created #{Project.count} Projects"
