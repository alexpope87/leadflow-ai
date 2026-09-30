# AI Lead Classification

## Purpose

The AI component of LeadFlow AI analyzes the free-text message submitted by a potential customer and converts it into structured business information.

The AI is responsible for interpretation only.

Workflow decisions are handled separately by deterministic n8n rules.

This creates a clear separation between:

AI = understand the message

n8n = decide what action to execute

---

## Input

The AI receives the lead message after the incoming webhook data has been normalized.

Example:

Vorrei automatizzare la gestione delle fatture.

---

## Structured Output

The AI must return the following fields:

- category
- subcategory
- priority
- summary
- next_action

Example:

{
  "category": "Sales",
  "subcategory": "Invoice automation",
  "priority": "medium",
  "summary": "User requests automation of invoice management.",
  "next_action": "Request more information"
}

---

## Classification Prompt

You analyze inbound business enquiries for a small or medium-sized company.

Analyze only the information explicitly contained in the lead message.

Do not invent missing information.

Return the requested structured fields according to these rules:

CATEGORY

Choose exactly one:

- Sales
- Support
- Administration
- Partnership
- Other

SUBCATEGORY

Write a short description of the specific subject of the request.

Maximum 5 words.

PRIORITY

Choose exactly one:

- high
- medium
- low

Use HIGH only when the message explicitly indicates:

- an urgent problem
- a business-critical interruption
- an explicit immediate deadline
- or a deadline within approximately 48 hours

Use MEDIUM for a clear and actionable commercial or business request that requires follow-up.

Use LOW for generic, incomplete, informational, or non-urgent requests.

SUMMARY

Summarize the request in one concise sentence.

Do not add information that is not present in the original message.

NEXT_ACTION

Choose the most appropriate option:

- Schedule discovery call
- Request more information
- Route to support
- Route to administration
- Manual review

When information is insufficient, prefer "Manual review" or "Request more information" rather than inventing details.

---

## Design Decision

The AI does not directly execute business actions.

It only produces structured information.

The structured result is then processed by the n8n Switch node.

Current routing logic:

Sales
→ sales_review

Support
→ support_review

Administration
→ administration_review

Anything else
→ manual_review

This approach makes the automation easier to understand, test, audit and modify.

---

## Example Tests

### Sales

Input:

Vorrei automatizzare la gestione delle fatture.

Expected classification:

category = Sales

priority = medium

---

### Support

Input:

Il nostro servizio non funziona da questa mattina e abbiamo bisogno di assistenza urgente.

Expected classification:

category = Support

priority = high

Workflow result:

status = support_review

---

### Administration

Input:

Avrei bisogno di una copia della fattura relativa al nostro ultimo pagamento.

Expected classification:

category = Administration

Workflow result:

status = administration_review

---

### Partnership / Fallback

Input:

Vorremmo proporvi una partnership per un evento aziendale.

Expected classification:

category = Partnership

Workflow result:

status = manual_review

---

## Reliability Principles

The system follows several principles:

1. AI output should be structured rather than free-form.

2. Missing information must not be invented.

3. AI interpretation and workflow execution are separated.

4. Important customer-facing actions should eventually include human approval.

5. Unexpected categories are sent to manual review instead of triggering an uncontrolled automation.

---

## Current Model

During MVP development the workflow uses an OpenAI chat model through n8n Gateway credits.

The specific model may be changed later depending on cost, latency and accuracy requirements.

The workflow architecture is intentionally model-independent.
