package main

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin" //#nosec
)

// message represents data about a message post
type message struct {
	ID        int    `json:"id"`
	Message   string `json:"message"`
	Timestamp int64  `json:"timestamp"`
}

// Need struct to be in64 to use this
var t = time.Now().UnixMilli()

// message slice to seed data
var messages = []message{
	{ID: 1, Message: "Automate all the things!", Timestamp: t},
}

// getMessages responds with list of all the messages as json
func getMessages(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, messages)
}

func getHealthCheck(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, "API is running!")
}

func main() {
	router := gin.Default()
	router.GET("/messages", getMessages)
	router.GET("/healthcheck", getHealthCheck)

	err := router.Run("0.0.0.0:8080")
	if err != nil {
		panic("Cannot run server: " + err.Error())
	}
}
