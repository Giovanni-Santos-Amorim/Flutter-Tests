package main

import (
	"encoding/json"
	"fmt"
	"log"
	"math/rand"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
)

type Tasks struct {
	ID         string `json:"id"`
	TaskName   string `json:"task_name"`
	TaskDetail string `json:"task_detail"`
	Date       string `json:"datte"`
}

var tasks []Tasks

func allTasks() {
	task := Tasks{
		ID:         "1",
		TaskName:   "New projects",
		TaskDetail: "You must lead the project and finish it.",
		Date:       "2022-01-22",
	}

	tasks = append(tasks, task)

	task1 := Tasks{
		ID:         "2",
		TaskName:   "Power project",
		TaskDetail: "We need to hire more stuffs before the deadline.",
		Date:       "2022-01-22",
	}

	tasks = append(tasks, task1)

	fmt.Println("Your tasks are: ", tasks)
}

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println("home page")
}

func getTasks(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(tasks)
}

func getTask(w http.ResponseWriter, r *http.Request) {
	taskId := mux.Vars(r)
	flag := false

	for i := 0; i < len(tasks); i++ {
		if taskId["id"] == tasks[i].ID {
			json.NewEncoder(w).Encode(tasks[i])
			flag = true
			break
		}
	}

	if !flag {
		json.NewEncoder(w).Encode(map[string]string{"status": "error"})
	}
}

func createTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	var task Tasks
	_ = json.NewDecoder(r.Body).Decode(&task)
	task.ID = strconv.Itoa(rand.Intn(10000))
	tasks = append(tasks, task)
	json.NewEncoder(w).Encode(task)
}

func deleteTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println("home page")
}

func updateTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println("home page")
}

func handleRoutes() {
	router := mux.NewRouter()

	router.HandleFunc("/", homePage).Methods("GET")
	router.HandleFunc("/gettasks", getTasks).Methods("GET")
	router.HandleFunc("/gettask/{id}", getTask).Methods("GET")
	router.HandleFunc("/create", createTask).Methods("POST")
	router.HandleFunc("/delete{id}", deleteTask).Methods("DELETE")
	router.HandleFunc("/{update{id}}", updateTask).Methods("PUT")

	log.Fatal(http.ListenAndServe(":8080", router))
}

func main() {
	allTasks()
	handleRoutes()

}
