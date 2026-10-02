# LeadFlow AI

**AI-powered lead intake, classification and workflow automation MVP**

LeadFlow AI is a functional automation MVP designed to demonstrate how inbound business requests can be automatically received, analyzed with AI, classified and routed through a structured workflow.

The project combines **n8n workflow orchestration, AI classification, deterministic business rules, Supabase persistence and a Lovable dashboard**.

Built independently as a portfolio project to explore how AI can be integrated into real business process automation.

---

## 🔗 Project Links

**Live Demo:** https://lead-watch-guide.lovable.app 
**GitHub:** https://github.com/alexpope87/leadflow-ai

---

## 🎯 Business Problem

SMEs receive customer and sales requests through websites, forms, email and other channels.

These requests often require someone to manually:

- read the incoming message
- understand the type of request
- categorize it
- enter the information into a system
- decide which team or workflow should handle it
- track its status

LeadFlow AI explores how these repetitive steps can be automated while keeping deterministic business rules around AI-generated classifications.

---

## 🚀 What I Built

I designed and implemented an end-to-end automated lead processing workflow:

```text
Incoming Lead
      ↓
n8n Webhook
      ↓
Data Normalization
      ↓
AI Classification
      ↓
Structured Output
      ↓
Supabase
      ↓
Deterministic Business Routing
      ↓
Status Update
      ↓
Lovable Dashboard
```

The AI interprets the incoming message and produces structured classification data.

**n8n controls the workflow and applies deterministic routing rules based on the AI output.**

This separates AI interpretation from business process control.

---

## ✨ Current Features

- inbound lead capture through an n8n webhook
- automatic JSON data normalization
- AI-powered message classification
- structured AI output
- deterministic category-based routing
- automatic Supabase record creation
- workflow status management
- Lovable dashboard connected to Supabase
- authenticated dashboard access
- Row Level Security
- end-to-end workflow testing

The complete workflow runs automatically from incoming request to dashboard without manual database updates.

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
- AI / LLM — lead classification and structured output generation
- GitHub — documentation and version control


## Security

No credentials or API keys are stored in this repository.

Sensitive values such as database credentials and API keys must be managed through environment variables or secure credential stores.

## MVP Validation

The LeadFlow AI MVP has been tested successfully end-to-end.

The validated workflow is:

Incoming Lead
→ n8n Webhook
→ Data Normalization
→ AI Classification
→ Structured Output
→ Supabase Record Creation
→ Deterministic Routing
→ Status Update
→ Lovable Dashboard

### Tested Scenarios

The workflow has been tested with different types of inbound requests:

- Sales
- Support
- Administration
- Partnership / Manual Review

The AI classifies the incoming request, while n8n applies deterministic workflow rules.

Example routing:

Sales
→ sales_review

Support
→ support_review

Administration
→ administration_review

Other or unmatched categories
→ manual_review

### End-to-End Test

A new test lead was submitted through the production n8n webhook.

The system automatically:

1. received the inbound request
2. normalized the lead information
3. analyzed the message using AI
4. generated structured classification data
5. stored the lead in Supabase
6. routed the lead using n8n business rules
7. updated the workflow status
8. displayed the new lead automatically in the Lovable dashboard

No manual database or frontend update was required.

This confirmed that the MVP works as an integrated automation system rather than as separate disconnected components.

## Screenshots

### n8n Workflow

![n8n Workflow](screenshots/01-n8n-workflow.png)

### LeadFlow Dashboard

![LeadFlow Dashboard](screenshots/02-dashboard.png)

### Lead Detail

![Lead Detail](screenshots/03-lead-detail.png)

### Supabase Data

![Supabase Leads](screenshots/04-supabase-leads.png)

## Current Architecture

Lead Source
↓
n8n Webhook
↓
Data Normalization
↓
AI Classification
↓
Structured Output
↓
Supabase
↓
Business Routing
↓
Status Update
↓
Lovable Dashboard

## What This MVP Demonstrates

- workflow automation with n8n
- AI-assisted text classification
- structured AI output
- deterministic business routing
- backend persistence with Supabase
- Row Level Security and authenticated dashboard access
- frontend dashboard with Lovable
- end-to-end integration between multiple platforms
- documentation and version control with GitHub

## Next Possible Improvements

Future versions could include:

- AI-generated reply drafts
- human approval before sending responses
- email notifications
- automatic department notifications
- duplicate lead detection
- CRM integration
- workflow analytics
- response-time tracking
- additional user roles and permissions
