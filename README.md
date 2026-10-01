<h1 align="center">
  <img src="frontend/assets/images/logo.png" alt="Streamly" width="128" height="128"/>
  <br>
  Streamly
</h1>

<p align="center">
  <strong>AI-powered subscription clarity and billing assistant</strong>
</p>

<p align="center">
  Streamly uses RAG and LLM technology to provide clear subscription explanations and reduce billing confusion.
</p>

---

## Original System Flow (Without Our Implementation)

```mermaid
flowchart TD

A[User opens Streamly mobile app] --> B[Subscription Dashboard]

B --> C[User selects Take a Break]

C --> D[Subscription gets paused]

D --> E[No explanation about pause vs cancellation]

E --> F[Billing resumes automatically]

F --> G[User receives unexpected charge]

G --> H[User contacts Support]

H --> I[Support checks account status]

I --> J[Agent explains Pause is not Cancellation]

J --> K[User dissatisfaction]

L[Old Help Article] --> M[Conflicting information]

M --> K
```

## Our AI-Powered Implementation Flow

```mermaid
flowchart TD

A[User opens Streamly mobile app] --> B[Subscription Dashboard]

B --> C{Select Subscription Action}

C -->|Pause| D[AI explains Pause details]
C -->|Cancel| E[AI explains Cancellation details]
C -->|Renew| F[AI explains Renewal details]

D --> G[User confirms action]
E --> G
F --> G

G --> H[Backend Subscription Service]

H --> I[Update Subscription Status]

I --> J[AI Assistant]

J --> K[User asks subscription question]

K --> L[RAG retrieves relevant information]

L --> M[Knowledge Base]

M --> N[Subscription Policies]
M --> O[Billing Rules]
M --> P[Help Articles]

L --> Q[Relevant Context]

Q --> R[LLM generates response]

R --> S[Personalized answer shown to user]
```

## Prototype

| <img title="" src="frontend/assets/prototype/chat.png" alt="" width="330" align="center"> | <img title="" src="frontend/assets/prototype/llmmsg.png" alt="" width="330" align="center"> 