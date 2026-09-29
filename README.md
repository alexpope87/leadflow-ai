# LeadFlow AI

LeadFlow AI is a simple AI-powered lead intake and qualification workflow designed as an MVP for small and medium-sized businesses.

The goal of the project is to automate the first steps of lead handling: receiving a request, structuring the data, storing it, and later classifying it with AI.

## Business Problem

Many SMEs receive customer or sales requests through website forms, email, or other channels.

These requests often need to be manually reviewed before they can be stored, classified, and assigned to the appropriate next action.

LeadFlow AI demonstrates how this process can be partially automated using a lightweight workflow.

## MVP Flow

Current version:

Lead Request
↓
n8n Webhook
↓
Edit Fields / Data Normalization
↓
Supabase

Planned version:

Lead Request
↓
n8n Webhook
↓
Data Normalization
↓
AI Classification
↓
Business Rules
↓
Supabase
↓
Lovable Dashboard

## Current Features

- Receives lead data through an n8n webhook
- Normalizes incoming JSON data
- Creates a new lead record in Supabase
- Automatically generates record ID and creation timestamp
- Stores leads for future AI processing

## Lead Data

The current MVP processes:

{
  "name": "Mario Rossi",
  "email": "mario@test.it",
  "company": "Rossi Srl",
  "message": "Vorrei automatizzare la gestione delle fatture."
}

## Tech Stack

- n8n — workflow automation and orchestration
- Supabase — database and backend
- Lovable — frontend and dashboard
- AI / LLM — lead classification and response generation
- GitHub — documentation and version control

## Project Status

### Completed

Webhook → Data normalization → Supabase

### Next Steps

- Add AI lead classification
- Extract structured lead information
- Add priority and category rules
- Generate suggested next actions
- Build a Lovable dashboard
- Add human approval for AI-generated responses

## Security

No credentials or API keys are stored in this repository.

Sensitive values such as database credentials and API keys must be managed through environment variables or secure credential stores.
