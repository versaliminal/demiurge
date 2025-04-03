package api

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

// optional code omitted

type Server struct{}

func NewServer() Server {
	return Server{}
}

// (GET /events)
func (Server) Events(ctx *gin.Context, params GetEventsParams) {
	fmt.Println("Events API called")
	resp := Event{}
	ctx.JSON(http.StatusOK, resp)
}
