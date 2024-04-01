> main = P2-functionality 
> title = Part II: Functionality
> file = intro-modeling

\LectureOnly{\section{Modeling}}

# Requirements Modeling

A requirements model...

*  is an informative **representation** of the intended system.

* is an **abstraction** of the intended system 
  * only *some* aspects are represented, 
  * while other aspects are *excluded*.

* captures important knowledge gained from **elicitation**.

* is often textual or a diagram, or both.

* is often part of a **specification**.

* should be **validated** by (some) stakeholders.

> file = intro-mod-aspects

# Different aspects of requirements to model 

\begin{minipage}[t]{0.6\textwidth}
* Functional aspects:
  * Data aspects:
    * What is stored and processed by the system?
    * What is the format of input and output data?

  * Business Logic aspects: 
    * How should the system behave in different usage contexts?
    * What output should be produced, given input and state?  
\end{minipage}%
\begin{minipage}[t]{0.4\textwidth}
\vspace{0.0em}\hfill\includegraphics[width=0.82\textwidth]{../img/cog1}
\end{minipage}%

* Quality aspects: 
  * What is a 'good' function from stakeholders' viewpoints?
  * More on quality modeling in Part III.

> file = intro-which-model

# Which modeling technique is best? 

* A modeling technique may be more or less suitable for  representing a certain aspect.

* A well-balanced combination of techniques can capture a larger set of aspects in a better way than a single model.

* What modeling technique is best depends on...
  * abstraction level
  * project type
  * stakeholders
  * tool support
  * the number and kind of requirements
  * ...

* Model interpretation often requires specific knowledge: 
  * Choose modeling technique based on stakeholders' ability to understand and validate!

* How do you know that your chosen mix of models fit together and does not contradict each other?
  * Make sure to check model inter-consistency in validation!

> file = abstraction-iceberg
# Abstraction and level of detail

\begin{minipage}[t]{0.4\textwidth}
\vspace{-0.5em}\includegraphics[width=0.9\textwidth]{../img/iceberg4}
\end{minipage}%
\begin{minipage}[t]{0.6\textwidth}
* The iceberg metaphor: 
  * Initial requirements are only the tip of a requirements ''iceberg''.
  * Most requirements are still hidden under the surface.
* Abstraction means simplification:
  * focusing on what's important,
  * reduction of less relevant details.
* Different parts of the req space need different levels of detail.
* Which parts of the under-surface iceberg should be unravel first?
\end{minipage}%


> file = mix-of-details
# Mixed levels of detail over time

* The picture below illustrates elaboration of reqs over time:
  * Time on x-axis. Different reqs on y-axis. 
  * Lighter color means deeper knowledge, improved spec.

\begin{minipage}[t]{1.0\textwidth}
\vspace{-1.0em}\includegraphics[width=1.0\textwidth]{../img/details-time}
\end{minipage}

* It is not cost-effective to spend the same amount of effort on all requirements.

* Some requirements need more effort than others in elicitation, specification, validation and selection.


> file = ontology
# Ontology
* Ontology is the philosophical study of being:
  * What types of entities exist?
  * How are entities grouped into categories? 
  * How are entities related to one another?
* Example of ontological concepts
  * Particulars and universals
  * Abstract and concrete
  * Identity and persistence over time
  * Modality: what is possible, actual, necessary?
  * Properties and relations
* Further reading: 
  * \url{https://en.wikipedia.org/wiki/Ontology}
  * \url{https://en.wikipedia.org/wiki/Ontology_engineering}

> file = data-modeling
\LectureOnly{\section{Data}}
# Data Modeling 
* **Data dictionary**:  
  * a list of data entities (classes) with textual descriptions of data attributes (fields) and relations among entities.
* **Data views**: (a.k.a ''virtual windows'')
  * examples of data values (instances) shown in a specific usage context sketched as a mockup screen
  * *not* intended as interface design -- instead the focus is on modeling of stored and processed data 
* **Data diagrams**: 
  * boxes and arrows with data entities (classes), attributes (fields) and relations
  * **E/R-diagram**: focus on entities and their relations 
  * **UML Class diagram**: also inheritance, aggregation, methods
* **Data format specifications**:
  * Reqular expressions (regexp)
  * Protocol buffers (protobuf)

> file = data-dictionaries
# Data dictionary example
Each data entity (class) together with attributes (fields) are specified in structured natural language.

```reqt
* Product: MusicStreamingApp
* Data: Dictionary
  * Class: listener has
    * Spec: A user that listens to music.
    * Field: id has
      * Spec: A unique identifier of listener. Must only contain letters and digits.
      * Example: abc123
    * Field: password has
      * Spec: ...
  * Class: artist has Spec: ...
  * Class: track has Spec: ...
  * Class: album has Spec: ...
```

{\small\url{https://en.wikipedia.org/wiki/Data_dictionary}}

> file = data-views
# Data Views
\begin{minipage}[t]{0.55\textwidth}
* Example data shown in a mockup screen.
* Good for data model validation with stakeholders.
  * Are examples relevant?
  * Any missing data?
* Also called ''virtual window''.
* Not a user interface design.
\end{minipage}%
\begin{minipage}[t]{0.45\textwidth}
\vspace{-1.0em}\hfill\includegraphics[width=0.85\textwidth]{../img/virtual-window}

{\hfill\fontsize{4}{4}\fontfamily{qtm}\itshape\selectfont From: S. Lauesen ''Software Requirements'' \textcopyright~Addison-Wesley 2002}

\end{minipage}

> file = er-diagram
# Entity-Relationship-diagram
\footnotesize\url{https://en.wikipedia.org/wiki/Entity-relationship_model}

\begin{minipage}[t]{0.9\textwidth}
\vspace{-0.4em}\includegraphics[width=1.0\textwidth]{../img/ER-diagram}
\vspace{-0.1em}
\end{minipage}

{\hfill\fontsize{5}{5}\fontfamily{qtm}\itshape\selectfont From: S. Lauesen ''Software Requirements'' \textcopyright~Addison-Wesley 2002}

> file = ulm-class-diagram
# UML Class diagram
\footnotesize\url{https://en.wikipedia.org/wiki/Class_diagram}

\begin{minipage}[t]{0.82\textwidth}
\vspace{-0.4em}\includegraphics[width=1.0\textwidth]{../img/uml-class-diagram}
\vspace{-1.4em}
\end{minipage}

{\hfill\fontsize{5}{5}\fontfamily{qtm}\itshape\selectfont From: S. Lauesen ''Software Requirements'' \textcopyright~Addison-Wesley 2002}




> file = intro-logi
\LectureOnly{\section{Logic}}
# Business Logic Modeling
* Contextual usage modeling:
  * User story: short description ''user ... wants ... to ...''
  * Task: domain-focused model of user's work
  * Use case: product-focused model of user's interaction
  * Narrative: rich, detailed story of personas' experiences
  * ...
* System behavior modelling:
  * State machines: events trigger transitions between states
  * Interaction diagrams: user--system interaction sequences
  * Data-flow diagrams: flow of input/output to/from functions
  *  ...

> file = work-split
# Work Split: When to decide who does what?

* Domain-focused logic: 
  * users' work and system behaviour is joint
  * the work split is decided in later design
* Product-focused logic: 
  * users' work and system behaviour is separated  
  * the work split is explicitly specified in req spec
 

> file = contextual-usage
\LectureOnly{\section{Usage}}
# Contextual usage modeling
Also called **scenario-based requirements** 
{\footnotesize\url{https://en.wikipedia.org/wiki/Scenario_(computing)}}
* User story:
  * Short description of what a user role wants to do with the system in order to achieve a goal.
  * {\footnotesize\url{https://en.wikipedia.org/wiki/User_story}}
* Use cases and tasks: 
  * *Domain-focus:* often called (user) **task**\\
    A piece of work by users, potentially supported by a system.
  * *Product-focus:* often called **use case**\\
    A goal-fulfilling interaction between users and the product.
  * {\footnotesize\url{https://en.wikipedia.org/wiki/Use_case}}
* Narrative:
  * A detailed story from a user's perspective including thoughts and emotions when using the system for a specific purpose.



> file = user-stories
# User Stories
* Short description of what a user role wants to do with the system in order to achieve a goal. 
* Some proposed templates:
  * \fontsize{9}{11}\selectfont\code{As a <role> I can <capability>, so that <receive benefit>.}
  * \fontsize{9}{11}\selectfont\code{In order to <receive benefit> as a <role>, I can <desire>.}
  * \fontsize{9}{11}\selectfont\code{As <who> <when> <where>, I want <what> because <why>.}


> file = use-cases
# Use Cases and Tasks
* \TODO example


> file = narratives
# Narratives and Personas
* \TODO example

> file = system-behavior
\LectureOnly{\section{Behavior}}
# System behavior modeling

* State diagrams
  * Events trigger transitions between states
  * A model of many possible event sequences
  * {\footnotesize\url{https://en.wikipedia.org/wiki/State_diagram}}

* Interaction Diagrams
  * Messages between the system and its surroundings
  * A model of one specific interaction scenario
  * {\footnotesize\url{https://en.wikipedia.org/wiki/Message_sequence_chart}}
  * {\footnotesize\url{https://en.wikipedia.org/wiki/Sequence_diagram}}

* Data Flow Diagrams
  * Flow of input/output to/from functions
  * A model of how functions are connected with data stores
  * {\footnotesize\url{https://en.wikipedia.org/wiki/Data-flow_diagram}}

> file = state-machines
# State diagram example
\begin{minipage}[t]{0.65\textwidth}
\vspace{0.4em}\includegraphics[width=1.0\textwidth]{../img/state-diagram}
\vspace{-0.4em}
\end{minipage}

{\vspace*{1em}\fontsize{5}{5}\fontfamily{qtm}\itshape\selectfont From: S. Lauesen ''Software Requirements'' \textcopyright~Addison-Wesley 2002}

> file = interaction-diagrams
# Interaction Diagrams

* Time progresses downwards 
* One timeline for each user, product, other systems
* Events/messages are drawn as arrows between timelines
* Example UML Sequence diagram:
\hfill\begin{minipage}[t]{0.8\textwidth}
\vspace{0.4em}\includegraphics[width=1.0\textwidth]{../img/uml-sequence-diagram}
{\vspace*{1em}\fontsize{5}{5}\fontfamily{qtm}\itshape\selectfont From: S. Lauesen ''Software Requirements'' \textcopyright~Addison-Wesley 2002}
\end{minipage}


> file = data-flow-diagrams
# Data-flow diagram example
\begin{minipage}[t]{0.6\textwidth}
\vspace{0.4em}\includegraphics[width=1.0\textwidth]{../img/data-flow-diagram}
\vspace{-1.4em}
\end{minipage}%
\hfill\begin{minipage}[t]{0.3\textwidth}
\vspace{-0.1em}\includegraphics[width=0.8\textwidth]{../img/data-flow-diagram-symbols}
\end{minipage}%

{\vspace*{1em}\fontsize{5}{5}\fontfamily{qtm}\itshape\selectfont From: S. Lauesen ''Software Requirements'' \textcopyright~Addison-Wesley 2002}

> file = intro-proto
\LectureOnly{\section{Prototyping}}
# What is prototyping?
  * Prototyping is a creative practice within product design.
  * A prototype can range from 
    * a simple paper **sketch**, through 
    * a computer-generated **mock-up**, to an 
    * incomplete version of the production software
  * Aspects of a prototype:
    * Purpose 
    * Scope 
    * Media 
    * Usage 

> file = proto-purpose
# Why prototype?
  * Exploration and learning
  * Communication: sales, alignment
  * Incremental development
  * Quality improvement
  * Validation and testing
    * investigate problem-solution / product-market fit
    * investigate technical feasibility
    * usability testing


> file = proto-scoping
# Prototype Scoping

* Breadth of functionality
* Functional refinement:
  * Visual appearance
  * Interactive and haptic behavior
  * Data realism

> file = proto-media
# Prototyp Media
* Sketches and mockups
  * paper drawing
  * computer drawing
  * presentation tool
  * GUI-builder
* Video
  * enacted usage
  * interview
* Executable software
  * demonstrate single feature 
  * MVP (minimum viable product)

> file = proto-use
# Prototype Usage
  * Reviewers 
    * internal
    * with families, friends and foes
    * external
  * Prototype interaction 
    * yes 
    * no (demo)
  * Review approach
    * scenario-based
    * free
  * Usage environment
    * *in vitro*: lab setting, different from final product usage 
    * *in vivo*: real world setting, similar to final product usage

> file = proto-explore
# Exploration Strategy
* How to traverse the solution space?
  * Number of iterations:
    * single iteration
    * multiple iterations
    * parallell explorations
  * Iteration focus: 
    * business
    * product
    * feature
    * optimisation
  * Iteration size: 
    * effort
    * lead-time

> file = intro-delegated
\LectureOnly{\section{Delegation}}
# Delegated Requirements
* Refer to an **existing artifact** that acts as a **proxy** for requirements.
* Examples:
  * Standards as requirements
    * require a standard query language, SQL
    * require a standard communication protocol, e.g. HTTPS
  * Regulatory requirements
    * General Data Protection Regulation
    * Artificial Intelligence Act
    * Cyber Resilience Act 
  * Test cases as requirements
  * Development process requirements
    * require usability testing to instead of explicit usability requirements
    * require regression testing to instead of explicit reliability requirements

> file = delegated-pro-con
# Delegated Requirements: Pros and cons
* Advantages:
  * less work
  * aligned with accepted domain practice
  * mature proxies have high quality

* Disadvantages:
  * gives a false sense of security
  * hidden interpretation risks
  * imposes premature design


