package main

import (
	"context"
	"errors"
	"log"
	"os"

	"github.com/joho/godotenv"
	"github.com/sashabaranov/go-openai"
)

func main() {

	// call to an AI engine to create some content
	// just write to the FS or cmd line
	// content can be returned as markdown, CSV, JSON and then added to the FS maybe
	// ....

	if err := godotenv.Load(".env"); err != nil {
		log.Fatalf("error loading env %s", err.Error())
	}
	err := GetAIContent()

	if err != nil {
		log.Fatalf("error from AI call %s", err.Error())
	}

}

func GetAIContent() error {

	apiKey := os.Getenv("OPENAI_API_KEY")

	client := openai.NewClient(apiKey)
	ctx := context.Background()

	prompt, err := os.ReadFile("prompt.md")
	if err != nil {
		return err
	}

	promptStr := string(prompt)

	resp, err := client.CreateChatCompletion(ctx, openai.ChatCompletionRequest{
		Model: openai.GPT4, // Or "gpt-3.5-turbo" if you are using GPT-3.5
		Messages: []openai.ChatCompletionMessage{
			{
				Role:    openai.ChatMessageRoleUser,
				Content: promptStr,
			},
		},
	})
	if err != nil {
		return errors.New("chat completion error:" + err.Error())
	}

	data := resp.Choices[0].Message.Content

	log.Println(data)

	return nil

}
