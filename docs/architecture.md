# Architecture

## Overview

LeadFlow AI is designed as a lightweight automation system for small and medium-sized businesses.

The MVP separates the project into four main components:

- Lovable for the user interface
- n8n for workflow orchestration
- Supabase for data storage
- AI for lead analysis and classification

GitHub is used to document the project and keep track of the workflow design and technical decisions.

## High-Level Architecture

User
↓
Lovable Form
↓
n8n Webhook
↓
Data Normalization
↓
AI Analysis
↓
Business Rules
↓
Supabase
↓
Lovable Dashboard

## Components

### Lovable

Lovable is used as the frontend layer.

Its role is to:

- collect lead information through a simple form
- send lead data to n8n
- display stored and processed leads
- provide a simple dashboard for SME users

Lovable should not contain sensitive backend credentials.

### n8n

n8n is the orchestration layer of the system.

Its role is to:

- receive incoming requests through a webhook
- normalize incoming JSON data
- call the AI model
- process structured AI output
- apply business rules
- send data to Supabase
- coordinate future actions such as notifications or response generation

n8n acts as the central automation engine of the project.

### Supabase

Supabase is used as the backend and database.

Its role is to:

- store incoming leads
- store AI-generated classifications
- store lead status
- provide data to the Lovable dashboard
- maintain a persistent history of processed requests

The main table used in the MVP is:

leads

Current fields:

- id
- created_at
- name
- email
- company
- message
- category
- subcategory
- priority
- summary
- next_action
- status

### AI Layer

The AI layer will analyze the free-text message submitted by the lead.

Its role will be to generate structured information such as:

- category
- subcategory
- priority
- summary
- recommended next action

The AI will not make final business decisions.

Its role is to assist with classification and preparation of the next step.

## Current MVP Architecture

The first working version currently uses:

Webhook
↓
Edit Fields
↓
Supabase

The webhook receives a POST request.

The Edit Fields node extracts and normalizes the relevant values from the incoming JSON.

The Supabase node creates a new record in the leads table.

## Planned AI Workflow

The next version will use:

Webhook
↓
Edit Fields
↓
AI Analysis
↓
Structured Output
↓
Business Rules
↓
Supabase

The AI output should use a predictable structured format instead of unrestricted text.

Example:

{
  "category": "Sales",
  "subcategory": "Process Automation",
  "priority": "medium",
  "summary": "SME interested in automating invoice processing.",
  "next_action": "Schedule a discovery call."
}

## Design Principles

### Keep the MVP simple

The first objective is to prove that the workflow works end-to-end.

Complex features should only be added after the basic process is reliable.

### Separate responsibilities

Each tool has a specific role:

Lovable = interface

n8n = automation and orchestration

Supabase = data and persistence

AI = text interpretation and classification

GitHub = documentation and version control

### Human oversight

AI-generated recommendations should support the user rather than automatically make important business decisions.

Future response-generation features should include human approval before sending messages to customers.

### Security

Sensitive credentials must never be stored in the GitHub repository.

Examples include:

- Supabase secret keys
- AI provider API keys
- database passwords
- n8n credentials

Secrets should be stored only inside the relevant platform's secure credential system.

## Future Extensions

Possible future additions include:

- automated email intake
- duplicate lead detection
- automatic routing to departments
- Slack or Microsoft Teams notifications
- AI-generated email drafts
- approval workflows
- lead analytics
- response-time tracking
- CRM integration
