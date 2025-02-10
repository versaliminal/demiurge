package main

import (
	"demiurge/universal-correlator/api"
	"fmt"

	"github.com/gin-gonic/gin"
)

func main() {
	fmt.Println("Starting universal correlator")
	router := gin.Default()
	server := api.NewServer()
	api.RegisterHandlers(router, server)
	router.Run()
}
