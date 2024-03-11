> main = L1-context 
> title = Part 1: Introduction
> file = def-RE

\LectureOnly{\section{Terminology}}

# What is Requirements Engineering (RE)?

* RE is focused on the
  * **requirements** of software-intensive systems 
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

# Main Activities of RE

%{\vspace{1em}\resizebox{!}{3em}{\hspace{0.5em}{\bf ?}\hspace{0.5em}\WritingHand\hspace{0.5em}\Checkedbox\hspace{0.5em}\LeftScissors}\vspace{0.5em}}

* The 4 main activities of RE: 
  * **Elicitation** \hfill learning
  * **Specification** \hfill representing
  * **Validation**  \hfill checking
  * **Selection**   \hfill deciding
* These activities are
  * **Interdependent** \hfill output of one is input to other activities
  * **Concurrent** \hfill one activity you often trigger another
  * **Continuous** \hfill in the product life-cycle as software evolves

> file = def-spec

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

* Requirements are often labeled as:
  * **Functional Requirements** (FR), including:
    * Requirements on **Logic**
    * Requirements on **Data**
  * **Quality Requirements** (QR)
    * Accuracy, Capacity, Performance, Reliability, Usability, Safety, Security, ...
* In practice FR and QR are often combined and related:
  * Functions have quality:
    * a function can be unreliable due to bugs 
  * Logic and data is related: 
    * functions have input, state, output
  * Quality is supported by functions: 
    * a login function supports system security

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
  * sys  \hfill system
  * dev  \hfill development
  * ops  \hfill operations
  * org  \hfill organisation


> file = req-dev

\LectureOnly{\section{Purpose}}

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

> file = good-req-spec

# What is good Req Spec?

  * \TODO{}
    * Correct \hfill represents the actual needs of stakeholders

> file = good-RE

# What is good RE?

* \TODO{}
  * Cost-effective
  * Happy stakeholders
  * When are we ready?


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

> file = req-levels

# Requirements at different levels

* Abstraction level: The goal-design scale
* Levels of detail
* \TODO{}

>file = elicit

\LectureOnly{\section{Elicitation}}

# Elicitation

* \TODO{}

> file = prio

\LectureOnly{\section{Prioritization}}

# Prioritization
Hello
* \TODO{}