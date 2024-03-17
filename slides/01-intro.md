> main = P1-context 
> title = Part 1: Domain Knowledge
> file = def-RE

\LectureOnly{\section{Introduction}}

# What is Requirements Engineering (RE)?


\begin{minipage}[t]{0.65\textwidth}
* RE is focused on the
  * **features** of software systems 
  * **system context**, including users and connected systems
  * **development context**, including stakeholders' intentions 
\end{minipage}%
\begin{minipage}[t]{0.35\textwidth}
\vspace{-1em}\hfill\includegraphics[width=0.8\textwidth]{../img/phone-support}
\end{minipage}%


* The RE process involves 
  * knowledge-building \hfill research
  * consensus-building \hfill agree
  * decision-making    \hfill choose
  * innovation         \hfill generate ideas
  * communication      \hfill be pedagogical


> file = def-req

# What is a requirement?

\begin{minipage}[t]{0.65\textwidth}
* A simple definition:
  * Something **needed** or **wanted**.
  * A documented **representation** of\\something needed or wanted.
\end{minipage}%
\begin{minipage}[t]{0.35\textwidth}
\vspace{-1em}\hfill\includegraphics[width=0.5\textwidth]{../img/light-bulb}
\end{minipage}%

* Are we representing what is **actually** needed or wanted? 

* *'Requirement'* can in practice mean many different things:\\
  must, option, idea, innovation, intent, rationale, function, quality, design, feature, decision, constraint, ...

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

* Feasible and helpful foundation for software development
* Cost-effective process with high artifact quality
* Happy stakeholders
* Good system 
  * commercially successful
  * beneficial to its users
  * ethical, helpful to society
* When are we ready? What is good enough?

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
    * a function can be unreliable and unsafe due to bugs 
  * Logic and data is related: 
    * functions have input, state, output
  * Quality is supported by functions: 
    * a login function supports system security


> file = req-levels
# Requirements at different levels

* Level of **design abstraction**: \hfill from 'why' to 'how' 
* Level of **detail**: \hfill amount and richness of information 
* Level of **aggregation**: \hfill grouping, hierarchical decomposition 
* Level of **formality**: \hfill from unstructured to mathematical


> file = req-goal-design-scale
# Abstraction on the Goal-Design-scale

*why* $\rightarrow$ *what* $\rightarrow$  *how*:
* **Goal-level**: why? 
 * intentions of stakeholders and users
* **Domain-level**: what do users do with the system?
  * focus on how users' tasks are supported by the system
* **Product-level**: what does the system do?
  * focus on system behavior in terms of input-logic-state-output
* **Design-level**: how? 
  * up-front design choices
  * are they really required and justified?  

Which level is best? It depends. They can be combined.
* Too much 'how' may over-constrain the solution space giving too little freedom for developers to find the best solution.  
* Without 'why' the risk of an unsuccessful solution is high.

> file = req-levels-of-formality
# Levels of Formality
From unstructured to mathematical:
* Very informal: free-form representation, no explicit rules
* Very formal: syntax, semantics, inference, meta-language
* Pragmatic middle-ground: restricted natural language + diagrams with explanations
* Pro: Formality enables automatic checks, concise models, ...
* Con: Formalization requires effort, knowledge, skills, ...

> file = req-explicit-vs-implicit
# Explicit or implicit requirements?

* **Explicit** requirement: 
  * has a unique id, such as a mnemonic (short name) or number
  * often has status, priority, or similar 
  * often has an explicit ''shall''-statement
  * often has links to other related spec parts with id
* **Implicit** requirement:
  * part of spec but no id, no status, no ''shall'' 
  * is text/diagram a requirement or just help for the reader?
* Advice: 
  * Make most important requirements explicit.
  * Link diagrams to explanatory text with explicit requirements. 



> file = good-req-spec

# What is a good enough requirements specification?
Example of **quality factors**:\\can only be achievable to some degree; can be conflicting
* **Correctness**: represents the stakeholders' intentions
* **Unambiguity**: stakholders have similar interpretation
* **Completeness**: most of important relevant aspects included
* **Consistency**: no contradictions among requirements
* **Conciseness**: suitable level of abstraction and detail 
* **Comprehensibility**: understood by stakeholders 
* **Verifiability**: possible to check fulfillment 
* **Feasibility**: possible to implement, value to justifiable cost 
* **Traceability**: reqs can be referred to, can find origin of reqs
* **Modifiability**: easy to change, good structure
* **Ranked**: includes assessment of importance and stability



> file = dev-context

\LectureOnly{\section{Context}}

# How to best do RE is highly context-dependent

Aspects of the RE context to consider: 
* **Stakeholder configuration**: relation customers -- supplier  
  * Examples of customers (users) and suppliers (developers): \\
    *public authority, private consumer, individual contributor, company (system integrator, subcontractor), community, company, company-internal department, ...*
* **Business model**: risk-sharing, profit-sharing: \\
  * internal budget, license fee, subscription, freemium, ad-based, donations, open-source community, non-profit, ... 
* **Delivery model**: one-off, eventually updated, continuous integration and delivery

* Questions regarding customer--supplier relation:
  * Who has the knowledge?
  * Who has the power?
  * Who gets the biggest value/profit? short- vs long-term
  * Who takes the biggest risk?


> file = product-type
# Type of product
* Level of customization
  * generic
  * customer specific
* Hardware integration:
  * HW+SW 
  * Pure SW
* Network integration
  * off-grid
  * connected
  * distributed
  * concurrent massive multi-user online communication, ...

> file = dev-context-examples
# Examples of common RE Contexts:
* Public tender: a public authority invites suppliers to bid
* B2B: both customer and supplier are companies
* B2C: the supplier provides SW to a consumer market
* In-house: one org develops system for internal use
* Open-source library: organisations share SW investments 
* Embedded system
* Webb app: backend-frontend
* High-assurance systems: security and safety is critical


> file = cost-of-RE-defects
# Cost of RE defects
The cost of RE defects increase exponentially with time.

> file = scale
# Scale of RE
* The RE effort increases exponentially with size! 
  * Number of requirements: $N$
  * Number of pairwise relations: $R = N(N -1)/2 \approx N^2$
* Orders of magnitude:
  * **Small-scale RE**: \hfill $N \approx 10^1$, $R \approx 10^2 = 100$
    * requires small effort, all pairwise relations can be considered 
  * **Medium-scale RE**: \hfill $N \approx 10^2$, $R \approx 10^4 = 10~000$ 
    * feasible but requires large effort, consider subset of relations
  * **Large-scale RE**: \hfill $N \approx 10^3$, $R \approx 10^6 = 1~000~000$
    *  unfeasible unless requirements are bundled into groups with high cohesion within groups and low coupling across groups
  * **Very large-scale RE**: \hfill $N \approx 10^4$, $R \approx 10^8 = 100~000~000$
    * unfeasible even if requirements are bundled into groups as the groups become either too many or too large
    * feasible only if the system can be split into subsystems with independent RE 




> file = def-context-diagram
# Context Diagram

* A diagram describing the environment of a product
* The named product in the center as a **closed** box
* Entities interacting with the product are connected by arrowed lines to show data flow direction
  * User roles (actors), shown as straw man icons
  * Other connected systems, shown as named closed boxes
* **Inner domain**: *direct* interaction with product
* **Outer domain**: *indirect* interaction with product
* If product is shown as an open box with system parts inside then it is an architecture diagram, *not* a context diagram
* Accompanying explaining text, including explicit requirements: ''the system shall have interface X''


> file = def-context-diagram-example
# Context Diagram Example
\begin{minipage}[t]{1.0\textwidth}
\vspace{-1em}\includegraphics[width=0.9\textwidth]{../img/context-diagram-example}
\end{minipage}%
\vspace{1em}
\texttt{*~Interface~CRA}:\\ 
  \texttt{~~*~Spec:~The system shall ...~data entities ...}

>file = elicit

\LectureOnly{\section{Elicitation}}

# Elicitation

* \TODO{}

> file = prio

\LectureOnly{\section{Prioritization}}

# Prioritization
Hello
* \TODO{}