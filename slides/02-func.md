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

# Different modeling aspects 


* Functional aspect:
  * Data aspects:
    * What is stored and processed by the system?
    * What is the format of input and output data?

  * Business Logic aspects: 
    * How should the system behave in different usage contexts?
    * What output should be produced, given input and state?  

* Quality aspects
  * How good are the functions from the view of stakeholders?

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

> file = intro-data-mod
\LectureOnly{\section{Data}}
# Data Modeling 
* Functional modeling techniques with focus on **data**:
  * **Data dictionaries**: 
    * a list of data types with textual description of each field and relations to other data types
  * **Data windows**: 
    * examples of instances of data types shown in a usage context
    * often shown as a screen mockup
    * often *not* intended for interface design; instead the focus is on specification and validation of stored and processed data 
  * **Data diagrams**: 
    * boxes and arrows with data types, their fields and relations  
    * Entity-Relationship-diagrams
    * Class diagrams

> file = data-dictionaries
# Data dictionaries
* \TODO example

> file = data-windows
# Data windows
* \TODO example

> file = data-diagrams
# Data diagrams
* \TODO example


> file = intro-logi
\LectureOnly{\section{Logic}}
# Business Logic Modeling
* Functional modeling techniques with focus on **logic**:
  * sadfadsf

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

* User stories
  * what is it?

* Tasks: 
  * what is it?
* Use cases
  * what is it?
* Personas
  * what is it?
* Narratives
  * what is it?

> file = user-stories
# User Stories
* \TODO example

> file = use-cases
# Use Cases and Tasks
* \TODO example


> file = narratives
# Narratives and Personas
* \TODO example

> file = system-behavior
\LectureOnly{\section{Behavior}}
# System behavior modeling

* State Machines

* Sequence Diagrams

* Data Flow Diagrams


> file = state-machines
# State Machines
* ...

> file = sequence-diagrams
# Sequence Diagrams
* ...

> file = data-flow-diagrams
# Data Flow Diagrams
* ...


> file = intro-proto
\LectureOnly{\section{Prototyping}}
# Why Prototype?
* What?
  * ...
* Why?
  * ...

> file = proto-scoping
# Prototyp Scoping
* TODO
  * ...

> file = proto-media
# Prototyp Media
* TODO
  * ...


> file = proto-use
# Prototype Usage
* TODO
  * ...

> file = proto-explore
# Exploration Strategy
* TODO
  * ...

> file = intro-delegated
\LectureOnly{\section{Delegation}}
# Delegated Requirements
* What?
  * ...
* Why?
  * ...

> file = std-req
# Standards as requirements
* What?
  * ...
* Why?
  * ...


> file = regulatory-req
# Regulatory requirements
* What?
  * ...
* Why?
  * ...

> file = tests-as-req
# Test cases as requirements
* What?
  * ...
* Why?
  * ...

> file = process-reqs
# Development process requirements
* What?
  * ...
* Why?
  * ...

