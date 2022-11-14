package main

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

// Setup sn instance of Gin router
func SetUpRouter() *gin.Engine {
	gin.SetMode(gin.ReleaseMode)
	router := gin.Default()
	return router
}

func TestMessage(t *testing.T) {
	r := SetUpRouter()
	r.GET("/messages", getMessages)
	req, _ := http.NewRequest("GET", "/messages", nil)
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var messages []message
	err := json.Unmarshal(w.Body.Bytes(), &messages)
	if err != nil {
		panic(err)
	}

	assert.Equal(t, http.StatusOK, w.Code)
	assert.NotEmpty(t, messages)

}

func TestHealthCheck(t *testing.T) {
	r := SetUpRouter()
	r.GET("/healthcheck", getHealthCheck)
	req, _ := http.NewRequest("GET", "/healthcheck", nil)
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	assert.Equal(t, http.StatusOK, w.Code)
	assert.NotEmpty(t, "API is running!")
}
