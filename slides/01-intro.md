> main = P1-context 
> title = Part 1: Context
> file = def-RE

\LectureOnly{\section{Introduction}}

# What is Requirements Engineering (RE)?

* RE is focused on the
  * **features** of software-intensive systems 
  * **system context**, including users and connected systems
  * **development context**, including stakeholders' intentions 

* The RE process involves 
  * knowledge-building \hfill research
  * consensus-building \hfill agree
  * decision-making    \hfill choose
  * innovation         \hfill generate ideas
  * communication      \hfill be pedagogical

> file = def-req

# What is a requirement?

* A simple definition:
  * Something **needed** or **wanted**.
  * A documented **representation** of\\something needed or wanted.

* Are we representing what is **actually** needed or wanted? 

* A ''requirement'' can in practice mean many different things:\\
  must, wish, need, idea, rationale, function, quality, design, feature, decision, option, constraint, ...

* The most **general** meaning:\\
  *any* kind of **information entity** used in RE

> file = activities

# Core Activities of RE

%{\vspace{1em}\resizebox{!}{3em}{\hspace{0.5em}{\bf ?}\hspace{0.5em}\WritingHand\hspace{0.5em}\Checkedbox\hspace{0.5em}\LeftScissors}\vspace{0.5em}}

* The 4 core activities of RE are: 
  * **Elicitation** \hfill learning
  * **Specification** \hfill representing
  * **Validation**  \hfill checking
  * **Selection**   \hfill deciding
* In practice, these activities are often
  * **Interdependent** \hfill output of one is input to others
  * **Concurrent** \hfill one activity triggers others
  * **Continuous** \hfill throughout the product's life as it evolves

> file = good-RE

# What is good RE?

* \TODO{Should the decision quality model go here or in the Product Scoping chapter?}
  * Cost-effective
  * Happy stakeholders
  * When are we ready?

> file = req-dev

# RE in the Development Process

* RE interprets stakeholders intentions into validated req specs
* RE provides input to, and learns from down-stream activities
  * System Design
    * Quality reqs determine architectural decisions
  * System Implementation
    * Functional reqs (data and logic) are realized in code  
  * System Verification 
    * The req spec define correct output in test cases
  * System Operation
    * User feedback is input to requirements evolution
* As requirements evolve you must manage impact of changes
* Traceability: 
  * Links among artifacts to support change management
  * Forwards: from requirements to down-stream activities
  * Backwards: from requirements to stakeholders

> file = re-as-constr

# Requirements as Solution Constraints

* U: the **universe** of all possible software systems

* S: the **solution space**, a subset of U including\\all systems that **fulfill the spec**

* S contains both ''**good**'' and ''**bad**'' systems

* The **general purpose** of RE:
  * to **constrain the solution space** so that software development is likely to produce a **good enough** solution

* The req spec should be a good enough definition of what we mean with a ''good enough solution''

* RE is the **foundation for software quality**.


> file = acronyms

# Common Acronyms
  * RE   \hfill requirements engineering
  * SE   \hfill software engineering
  * SW   \hfill software
  * HW   \hfill hardware
  * FR   \hfill functional requirements
  * QR   \hfill quality requirements
  * SRS  \hfill software (or system) requirements specification
  * req  \hfill requirement 
  * spec \hfill specification
  * constr \hfill constraint
  * sys  \hfill system
  * dev  \hfill development
  * ops  \hfill operations
  * org  \hfill organisation




> file = def-spec

\LectureOnly{\section{Specification}}


# What is a Requirements Specification?

* A simplistic definition:  
  * *''A document that describes what the system should do''*
    * what is what and what is how?
    * how much about the context is needed?
    * not always a document; database, issue tracker, prototype, ...

* A collection of requirements models + Help for the reader

* Expressed using a combination of suitable media, such as:
  * text
  * diagrams
  * prototypes
  * test cases
  * videos
  * ...

* Similar to a shopping list:
  * You don't always get what you want.
  * You often want things that you don't need.

> file = req-types
# Different kinds of requirements

* (Parts of) Requirements are often labeled as:
  * **Functional Requirements** (FR), including:
    * Requirements on **Data**
    * Requirements on **Logic**
  * **Quality Requirements** (QR)
    * Accuracy, Capacity, Performance, Reliability, Usability, Safety, Security, ...
* In practice FR and QR are often **combined** and **related**:
  * Functions have quality:
    * a function can be unreliable due to bugs 
  * Logic and data is related: 
    * functions have input, state, output
  * Quality is supported by functions: 
    * a login function supports system security


> file = req-levels
# Requirements at different levels

* Levels of Abstraction: the Goal-Design scale 
* Levels of Detail: amount and richness of information 
* Levels of Aggregation: grouping and linking 
* Levels of Formality: from unstructured to mathematical


> file = req-goal-design-scale
# Abstraction on the Goal-Design-scale

From *why* to *how*:
* Goal-level: why? intentions of stakeholders and users
* Domain-level: what users do? how users' tasks are supported by the system to achieve goal
* Product-level: what the system does? system behavior in terms of input-logic-output
* Design-level: how? required and justified design choices

> file = req-levels-of-formality
# Levels of Formality
From unstructured to mathematical:
* Very informal: free-form representation, no explicit rules
* Very formal: syntax, semantics, inference, meta-language
* Pro: Formality enables automatic checks, concise models, ...
* Con: Formalization requires effort, knowledge, skills, ...




> file = good-req-spec

# What is good spec?

  * \TODO{Quality Factors}
    * Correct \hfill represents the actual needs of stakeholders



> file = dev-context

\LectureOnly{\section{Context}}

# How to best do RE is highly context-dependent

Aspects of the RE context to consider: 
* **Stakeholder configuration**: relation customers -- supplier  
  * Examples of customers (users) and suppliers (developers): \\
    *public authority, private consumer, individual contributor, company (system integrator, subcontractor), community, company, company-internal department, ...*
* **Business model**: risk-sharing, profit-sharing: \\
  * internal budget, license fee, subscription, freemium, ad-based, donations, open-source community, non-profit, ... 
* **Customization**: generic -- customer specific
* **Platform**: Pure SW, SW + HW, Embedded, Cloud, ...
* **Network integration**: off-grid, connected, distributed, concurrent massive multi-user online communication, ...
* **Delivery model**: one-off, eventually updated, continuous integration and delivery

> file = dev-context-examples

# Examples of common RE Contexts:
* Public tender: a public authority invites suppliers to bid
* B2B: both customer and supplier are companies
* B2C: the supplier provides SW to a consumer market
* In-house: one org develops system for internal use
* Open-source library: organisations share SW investments 


* Questions to consider:
  * Who has the knowledge?
  * Who has the power?
  * Who gets the biggest value/profit? short- vs long-term
  * Who takes the biggest risk?

> file = scale

# Scale

RE challenges increase with scale!

\TODO{}
* Small-scale RE
* Medium-scale RE
* Large-scale RE
* Very large-scale RE



> file = the-domain

\LectureOnly{\section{Domain}}

# Product Context: The Domain

* Type of product
  * HW+SW or Pure SW
  * Webb app: backend-frontend
  * Embedded system
  * High-assurance system: security and safety is critical
* The inner domain
  * \TODO{}
* The outer domain
  * \TODO{}

> file = def-context-diagram

# Context Diagram

* \TODO{}
* Depict the scope of the product
* The product in the center as a closed box
* Entities interating with the product
  * Other Connected Systems
  * Actors (user roles) interacting directly with the system
* Inner domain
* Outer domain
* (If the product is depicted as an open box with system parts inside then it is an achitecture diagram and not a context diagram)


>file = elicit

\LectureOnly{\section{Elicitation}}

# Elicitation

* \TODO{}

> file = prio

\LectureOnly{\section{Prioritization}}

# Prioritization
Hello
* \TODO{}