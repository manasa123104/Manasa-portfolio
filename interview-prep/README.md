# 100 AI & Forward Deployed Engineering Interview Questions

20 questions per topic. Original practice questions and concise answer outlines, not a ranked list or an employer question bank. Expand answers with your own real examples and measurable outcomes.


## RAG

### 1. What is retrieval-augmented generation?

RAG retrieves external evidence at request time and supplies it to a model before generation. It helps answer from changing or private information without retraining model weights; its quality still depends on retrieval and evidence use.

### 2. What are the main stages of a RAG pipeline?

Ingest and parse documents, split them into chunks, embed and index them, retrieve candidates, optionally rerank, and generate an evidence-grounded answer. Retain document IDs, versions, and permissions throughout the pipeline.

### 3. When would you choose RAG over fine-tuning?

Use RAG for frequently changing knowledge and traceable evidence. Fine-tuning is useful for repeatable behavior, format, or domain patterns; it does not provide reliable document lookup. Evaluate whether either is needed before combining them.

### 4. How do you choose chunk size?

Start with meaningful document boundaries and a modest size, then compare retrieval quality on representative queries. Small chunks may lose context; large chunks may dilute relevance and increase prompt cost. There is no universal best size.

### 5. Why use chunk overlap?

Overlap preserves information crossing chunk boundaries. Too much creates duplicates and extra storage, so measure whether it improves retrieval and deduplicate the final context.

### 6. What is an embedding?

An embedding is a numeric representation used to compare content in a learned space. Similarity can indicate related meaning, but it is not proof that two statements agree or that either is true.

### 7. What is hybrid retrieval?

Hybrid retrieval combines lexical matching with semantic matching. It can preserve exact identifiers while finding paraphrases; combine rankings with a defined fusion method and validate against your query set.

### 8. What does a reranker do?

A reranker scores query-document pairs after initial retrieval. It often improves ordering of a manageable candidate set but adds latency and compute, so compare the quality gain against those costs.

### 9. How do you evaluate retrieval?

Use labeled relevant documents or chunks to measure recall at k, precision at k, and ranking metrics such as MRR or nDCG. Include hard negatives, exact identifiers, and permission-sensitive queries.

### 10. How do you evaluate generated answers?

Check factual support, completeness, citation correctness, and appropriate abstention. Separate retrieval failures from generation failures and use human review to calibrate automated judges.

### 11. What should happen when evidence is missing?

The system should state the limitation and ask a targeted clarification or abstain. A high similarity score alone should not authorize an unsupported answer; calibrate decisions with examples.

### 12. How do you implement citations?

Pass stable source identifiers and locations with each chunk, require references to those identifiers, and validate that citations exist and support the associated claims. Linking a document is insufficient if the cited passage says something else.

### 13. How do you keep an index fresh?

Track source versions and content hashes, process changes incrementally, and propagate deletions. Monitor ingestion lag and rebuild or re-embed when parsing or embedding models change.

### 14. How do you handle PDFs and tables?

Use layout-aware extraction and preserve headings, row labels, units, and page references. Validate extraction on difficult samples; a table serialized without headers can retrieve well and still yield wrong answers.

### 15. How do you prevent permission leaks?

Apply authorization using trusted server-side identity before returning retrieved content to the model. Enforce it on documents, caches, logs, and citations; do not rely on a prompt asking the model to hide restricted text.

### 16. What is query rewriting?

Query rewriting converts an ambiguous or conversational request into a retrieval query. Preserve original intent, resolve references only from permitted context, and compare rewritten retrieval with a baseline to catch meaning drift.

### 17. What is multi-hop RAG?

Multi-hop RAG gathers evidence through multiple linked retrieval steps. Bound the steps and preserve provenance so an incorrect intermediate assumption does not silently become evidence.

### 18. How would you reduce RAG latency?

Measure parsing, embedding, retrieval, reranking, and generation separately. Consider caching permission-safe results, smaller candidate sets, shorter context, and parallel independent operations; check quality after each change.

### 19. What is context poisoning?

Malicious or misleading retrieved content can try to change system behavior or contaminate an answer. Treat documents as untrusted data, separate instructions from evidence, limit tool permissions, and test adversarial documents.

### 20. How would you debug a confidently wrong RAG answer?

Reproduce the request and inspect authorized retrieved chunks, rankings, prompt, and cited passages. Identify whether the fault is extraction, missing evidence, ranking, stale data, or unsupported synthesis, then add a regression case.

## Vector DB

### 21. What is a vector database?

A vector database stores vectors and supports similarity search, usually with metadata and indexing features. Some applications instead use a relational database with vector support; choose based on workload and operations.

### 22. How does cosine similarity differ from dot product?

Cosine compares direction after accounting for vector magnitude; dot product includes magnitude. For unit-normalized vectors they produce the same ranking, but use the metric expected by the embedding model.

### 23. What is Euclidean distance?

It measures straight-line distance between vectors. Lower values indicate closer vectors under that metric; its usefulness depends on the embedding model, normalization, and data distribution.

### 24. What is approximate nearest-neighbor search?

ANN trades guaranteed exact results for lower search cost. Evaluate recall relative to exact search on a representative sample, along with latency and memory use.

### 25. What is HNSW?

HNSW is a graph-based ANN approach with multiple navigable layers. It often provides a useful latency-recall tradeoff, but construction parameters, query settings, and memory requirements must be benchmarked.

### 26. What is IVFFlat?

IVFFlat groups vectors into lists and searches selected lists near the query. More probes typically increase recall and work; its index training and tuning should reflect the data distribution.

### 27. How would you choose HNSW versus IVFFlat?

Benchmark recall, tail latency, build time, memory, updates, and filtered queries on realistic data. Treat default settings as a starting point rather than assuming one index wins every workload.

### 28. What is metadata filtering?

It restricts eligible records by fields such as tenant, date, or document type. Index frequently filtered fields where supported and enforce authorization through trusted filters or database policies.

### 29. Why can post-filtering reduce recall?

Filtering only after taking the nearest candidates may remove most candidates and miss eligible neighbors farther down the ranking. Use supported filtered search, iterative retrieval, or exact search on a selective subset when appropriate.

### 30. How do you choose embedding dimensions?

Use a model and supported dimension setting that meet your quality and cost goals. Higher dimensions increase storage and compute but do not guarantee better retrieval; benchmark with representative queries.

### 31. How do you migrate embedding models?

Build a versioned parallel index, re-embed the source corpus, and evaluate it before switching queries. Query vectors must match the indexed embedding space; matching dimension counts alone is insufficient.

### 32. What is vector quantization?

Quantization stores lower-precision or compressed vector representations to reduce resources. It can affect ranking accuracy; measure recall and consider rescoring candidates with original vectors.

### 33. How do you estimate vector storage?

A baseline for float32 vectors is record count times dimensions times four bytes. Add index overhead, metadata, replicas, and backups; real memory use can substantially exceed raw vector size.

### 34. How would you design multi-tenant search?

Bind tenant identity server-side and choose isolation through separate collections, partitions, policies, or mandatory filters. Test cross-tenant access, backup access, and cache isolation, not only the normal search path.

### 35. How do upserts and deletes affect retrieval?

Upserts should use stable IDs to avoid duplication. Deletion visibility and index maintenance vary by system, so verify consistency guarantees and ensure removed documents disappear from downstream caches and citations.

### 36. When is exact search appropriate?

Exact search is useful for small datasets, highly selective subsets, and ground-truth evaluation. It can also be simpler and fast enough; measure it before introducing ANN complexity.

### 37. What causes vector-search latency spikes?

Possible causes include cold caches, expensive filters, high concurrency, compaction, network delays, and large search budgets. Inspect percentile latency and resource saturation rather than average response time alone.

### 38. How do you evaluate a vector database?

Use your own data and access patterns to test retrieval quality, filtered search, latency, throughput, updates, reliability, and total cost. Include operational needs such as backup, restore, observability, and migration.

### 39. Can vector search replace SQL?

Vector search finds similar content; SQL expresses structured constraints and joins. Many applications need both, such as filtering authorized invoices by date before semantic retrieval of descriptions.

### 40. How would you back up a vector index?

Back up source documents, IDs, metadata, permissions, embedding versions, and configuration alongside supported database snapshots. Test restoration and rebuilding, since an untested snapshot is not a recovery plan.

## Agentic AI

### 41. What does agentic AI mean?

It describes systems in which a model helps choose actions toward a goal using feedback. The term varies, so specify the available tools, decision freedom, state, and stopping conditions rather than relying on the label.

### 42. How does an agent differ from a workflow?

A workflow follows predefined control paths, while an agent can choose its next steps dynamically. Use the simplest approach that meets the task; dynamic control increases flexibility and the evaluation burden.

### 43. When should you avoid an agent?

Avoid one when deterministic code or a fixed workflow is sufficient, or when errors cannot be contained. An agent should earn its additional latency, cost, and operational complexity through measured task success.

### 44. What is a plan-act-observe loop?

The system chooses a step, invokes an allowed action, inspects the result, and updates its next decision. Bound iterations, time, cost, and permissions so the loop cannot run indefinitely.

### 45. What is tool calling?

A model proposes a structured tool name and arguments; application code validates and executes the request. A tool call is not inherently trusted, and the model should not receive credentials just to request an action.

### 46. How do you design a good tool schema?

Define one clear purpose, typed fields, required arguments, constraints, and understandable error outputs. Prefer narrow operations over an unrestricted shell or database tool when the task permits it.

### 47. What is an autonomy boundary?

It defines which decisions and actions the system may take without human approval. Express it in executable policies, permissions, and budgets, with explicit review for consequential actions.

### 48. What is human-in-the-loop control?

A person reviews a specific decision or action before execution or at a defined checkpoint. Present the exact proposed effect and preserve its identity so approval cannot accidentally authorize a changed action.

### 49. How should an agent handle tool failures?

Classify errors as transient, invalid input, permission failure, or permanent failure. Retry only appropriate operations with bounds and backoff, and escalate when a safe recovery is unavailable.

### 50. How do you prevent infinite agent loops?

Enforce iteration and time limits, detect repeated equivalent calls, and require progress signals. Return a clear partial result and reason for stopping instead of consuming the entire budget silently.

### 51. How do you measure agent success?

Measure task completion, correctness, policy compliance, intervention rate, latency, and cost across realistic scenarios. Evaluate complete trajectories and side effects, not only the final answer's wording.

### 52. What is trajectory evaluation?

It examines intermediate decisions, tool arguments, observations, and final outcomes. This reveals cases where an acceptable-looking answer hides unnecessary actions, unauthorized access, or fragile recovery behavior.

### 53. What is prompt injection in an agent?

Untrusted content attempts to redirect the model's instructions or actions. Treat tool outputs and documents as data, enforce permissions outside the model, and isolate secrets from content the model can expose.

### 54. How do you control agent cost?

Set task budgets for model calls, tokens, tools, and execution time. Use simpler routes when sufficient, cache safe repeat work, and monitor cost per successful task rather than cost per call alone.

### 55. What is checkpointing?

Checkpointing saves execution state at defined boundaries so a run can resume after interruption. Include completed side effects and idempotency keys to prevent replay from duplicating real actions.

### 56. How do you make agent actions auditable?

Record structured events with request IDs, decisions, policy checks, tool calls, and outcomes. Redact sensitive data and retain useful evidence without assuming private reasoning traces are required.

### 57. What is an evaluator-optimizer pattern?

One component proposes a result and another assesses it against explicit criteria before revision. Cap revision cycles and independently verify objective requirements; an evaluator can also be wrong.

### 58. What is routing in an AI system?

Routing selects a model, tool, or workflow based on the request. Validate the route and fallback behavior, and ensure routing never weakens the user's authorization boundaries.

### 59. How do you deploy agent changes safely?

Version models, prompts, tools, and policies; run regression evaluations before a canary rollout. Monitor task success and harmful side effects with a fast rollback path.

### 60. How would you design a customer-support agent?

Start with scoped retrieval and read-only account tools, authenticate the customer, and cite relevant policy. Add narrowly permitted actions with validation, approval where needed, escalation, and end-to-end evaluation.

## Agents

### 61. What components make up an AI agent?

Typical components are a model, instructions, tools, state, and a control loop. Production systems also need authorization, observability, evaluation, and explicit termination behavior.

### 62. What is short-term versus long-term memory?

Short-term memory holds current task context; long-term memory persists information across tasks. Persist only useful, consented data with provenance, expiry, and deletion controls.

### 63. How do you manage limited context?

Keep relevant recent state, summarize older material with source references, and retrieve details when needed. Preserve constraints and unresolved actions so summarization does not silently change the task.

### 64. When are multiple agents useful?

They can help when work splits into independent specialties or parallel subtasks. Compare against a single-agent baseline because coordination overhead and conflicting outputs can reduce reliability.

### 65. What is an orchestrator-worker design?

An orchestrator assigns bounded work to workers and integrates their results. Define ownership, inputs, outputs, and verification so delegation does not create duplicated actions or inconsistent state.

### 66. How do agents share state safely?

Use explicit structured state with access controls and concurrency rules. Version updates or use transactions where needed, and prevent a worker from overwriting another worker's newer result.

### 67. What is an agent handoff?

A handoff transfers responsibility along with relevant context and constraints. Include completed actions, remaining work, permissions, and a clear return or escalation path.

### 68. How do you avoid duplicate tool actions?

Use idempotency keys, persistent execution records, and transaction boundaries. Before retrying an uncertain action, query its status rather than assuming it did not happen.

### 69. What is a structured output?

It is output constrained to a defined schema rather than free-form prose. Validate it in application code; syntactic validity does not guarantee semantic correctness or permission to execute it.

### 70. What is a tool allowlist?

It explicitly limits available operations for a given task and identity. Combine it with argument validation and backend access checks; exposing a tool name should not confer unrestricted access.

### 71. How should an agent use external APIs?

Use server-managed credentials, scoped access, input validation, timeouts, and rate limits. Treat returned content as untrusted and avoid logging tokens or unnecessary personal data.

### 72. How do you handle API rate limits?

Apply bounded exponential backoff with jitter where safe, respect retry guidance, and queue work within task deadlines. Use concurrency limits and report partial completion if the deadline cannot be met.

### 73. What is durable execution?

Durable execution preserves state and progress across process failures or long waits. It needs clear replay semantics and side-effect handling; simply saving a chat transcript is insufficient.

### 74. How do you sandbox code-executing agents?

Use isolated execution with limited filesystem and network access, resource quotas, and short-lived credentials where required. Keep permission enforcement outside the generated code.

### 75. How do you test a tool-using agent?

Test schema errors, denied permissions, timeouts, repeated calls, malicious results, and successful tasks. Use controlled tools or test environments and verify final state as well as messages.

### 76. What should happen when agents disagree?

Resolve disagreements using evidence, deterministic checks, or human review according to task risk. Majority vote alone does not establish truth when agents share the same blind spot.

### 77. How do you build a research agent?

Define scope and source criteria, search and retrieve within bounds, track claim-level provenance, and verify citations. Make uncertainty visible and prevent retrieved pages from changing the agent's instructions.

### 78. How do you build a coding agent safely?

Provide a constrained repository, clear acceptance criteria, and appropriate test tools. Review diffs and dependencies, protect secrets, and gate production side effects according to policy.

### 79. How do you personalize an agent responsibly?

Use explicit preferences and minimal relevant history with user controls. Separate preferences from instructions that authorize actions, and avoid inferring sensitive traits without a legitimate need.

### 80. How would you investigate an agent incident?

Contain further actions, preserve redacted execution evidence, and identify the affected users and side effects. Fix the root policy or implementation issue and add a representative regression before restoring autonomy.

## Forward Deployed Engineer

### 81. What does a forward deployed engineer do?

An FDE works closely with customers to turn operational problems into deployed software. The role often combines discovery, integration, engineering, delivery, and feedback to the product team; responsibilities vary by employer.

### 82. How is an FDE different from a solutions engineer?

The boundary varies by company. Explain whether the role owns production implementation, pre-sales evaluation, ongoing operations, or all three rather than assuming a universal title definition.

### 83. How do you start an ambiguous customer engagement?

Identify users, the operational decision, current workflow, constraints, and a measurable outcome. Validate the problem with concrete examples before selecting a technical solution.

### 84. How do you run a discovery session?

Ask stakeholders to walk through a recent real case, inspect the data and handoffs, and record pain points and success criteria. Confirm your understanding and distinguish stated requests from the underlying problem.

### 85. How do you scope a first pilot?

Choose one valuable workflow with accessible data, a named owner, and a measurable baseline. Agree on acceptance criteria, exclusions, rollout conditions, and the decision that follows the pilot.

### 86. How do you translate business goals into metrics?

Connect the goal to an observable workflow measure such as resolution time, error rate, or throughput. Add quality and risk guardrails so improving one metric does not hide worse outcomes elsewhere.

### 87. How do you handle poor customer data?

Profile completeness, consistency, lineage, and update frequency with the customer. Fix critical defects or narrow scope, and make data limitations visible rather than masking them with model outputs.

### 88. How would you integrate a legacy system?

Clarify supported interfaces, authentication, data ownership, and operational limits. Start with a small end-to-end integration, add monitoring and recovery, and avoid undocumented dependencies where possible.

### 89. How do you choose build versus buy?

Compare requirements, integration effort, security, reliability, cost, and ownership over time. Validate the hardest requirement with a small proof of concept and consider exit or migration costs.

### 90. How do you explain technical tradeoffs to a customer?

Present options in terms of user outcomes, delivery time, recurring cost, and risk. Recommend one option with assumptions and a clear way to revisit the decision as evidence changes.

### 91. How do you respond to scope creep?

Acknowledge the new need and assess its impact on the agreed outcome. Offer an explicit tradeoff, phased delivery, or revised timeline rather than silently expanding commitments.

### 92. How do you handle conflicting stakeholders?

Identify the decision owner and document each stakeholder's goals and constraints. Use shared evidence and acceptance criteria to surface tradeoffs, then record the agreed decision.

### 93. What makes a good technical demo?

Show a realistic user journey tied to the customer's success criteria. Explain limitations, use safe representative data, and have a fallback without presenting a staged result as a live capability.

### 94. How do you move from prototype to production?

Add authentication, authorization, monitoring, recovery, capacity planning, and deployment controls. Confirm support ownership and acceptance tests; a successful demo alone does not establish readiness.

### 95. How would you handle a production outage?

Prioritize containment and service restoration, assign clear ownership, and communicate verified facts and updates. Afterward, document causes and implement actions that reduce recurrence and improve detection.

### 96. How do you protect customer data during delivery?

Use least-privilege access, approved environments, encryption, and limited retention. Keep production data out of demos and logs unless specifically approved and necessary.

### 97. How do you measure adoption after launch?

Measure repeated use in the target workflow and the agreed operational outcome. Combine telemetry with user feedback to distinguish low awareness, usability problems, and a solution that misses the real need.

### 98. How do you hand a solution over?

Provide runbooks, architecture and integration documentation, known limitations, and named operational owners. Walk through recovery and common changes, and verify that the receiving team can operate it.

### 99. How should you answer behavioral interview questions?

Use a real situation, explain your responsibility and actions, and report the actual outcome and lesson. Do not invent metrics or experience; if the scenario is hypothetical, label it clearly.

### 100. Design a document assistant for an enterprise customer.

Begin with users, permitted documents, freshness needs, and success metrics. Propose authorized ingestion and retrieval, grounded answers, evaluation, monitoring, and phased rollout; discuss cost and latency with a fallback for unsupported questions.

## Further reading

Answers are study guidance; consult current documentation for product-specific behavior.

- [RAG overview — Pinecone](https://www.pinecone.io/learn/retrieval-augmented-generation/)
- [Agent patterns — Anthropic](https://www.anthropic.com/research/building-effective-agents)
- [Vector indexes — pgvector](https://github.com/pgvector/pgvector)
- [Filtering — Qdrant](https://qdrant.tech/documentation/search/filtering/)
- [Forward-deployed roles — Palantir](https://www.palantir.com/careers/students-and-early-talent)
