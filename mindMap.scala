def mindMap: String = """
  requirements engineering (RE):
    activities: 
      elicitation: learning:
        interviews
        brain-storming and creativity
        focus-groups
        existing and similar systems studies
        empirical research methods:
          case studies
          A/B-testing
        analytical investigations, mathematical modeling
      specification: modeling (of requirements to represent ideas and decisions about the future system):
        specification aspects: 
          product functionality (functional requirements, FR):
            data (static)
            logic (dynamic)
          product quality (quality requirements, QR):
            accuracy
            capacity
            performance
            usability/UX/DX
            verifiability
            security
            safety
        specification levels:
          levels of abstraction (goal-design-scale): 
            goal level
            domain level
            product level
            design level
          levels of detail:
            from concise but ambiguous to complete but convoluted
          levels of aggregation:
            from simple (single entity, atomic) to compound (multiple entities, releasable feature) 
          levels of formality:
            formal/mathematical
            semi-formal
            informal
        specification media:
          text
          sound
          pictures
          video
          prototypes:
            proof-of-concept solutions
            UI mockups
            simulations
        representations:
          context diagram
          dictionary
          E/R-diagram
          grammar, regular expressions
          state machine
          event list
          feature description
          scenario-based models:
            goal-level user stories
            domain-level tasks
            product-level use cases
            rich narratives
            recorded demonstrations
            tests as requirements:
              verification at different levels:
                acceptance tests (goal level requirements)
                system tests (domain and product level requirements)
                integration and unit tests (design level requirements)
              input combinations
              pre-conditions (initial state)
              success/failure criteria (positive or negative tests)
      validation: checking (that requirements are of sufficient quality):
        quality of requirements:
          completeness
          ambiguity
          verifiability
          redundancy
          traceability
          consistency
      selection: deciding (what system to build based on good knowledge)
        decision quality:
          alfa requirements: should be selected under perfect knowledge
          beta requirements: should not be selected given perfect knowledge of the future
        selection criteria:
          business value
          development cost
          risk (probability * damage)
          volatility
          uncertainty
        estimation scales:
          categorical
          ordinal
          nominal
        decision ladder:
    context:
      stakeholders:
        users and customers
        suppliers and sub-contractors
        developers and managers
        authorities and regulators
      our product (system-under-development):
        complexity:
          external/interface complexity
          internal complexity
        software intensity:
          from pure software to fixed hardware
        specificity:
          from generic to customer-specific
        differentiation:
          from commodity to unique
        integration:
          integrated end-user product
          modular component for integrators
          api/platform/framework
      external systems:
        interfaces and protocols
        standards
      business context:
        buying or selling
        to consumers or to other businesses
        for-profit or not-for-profit
        monetization model
        community contributions
        licensing model:
          open or closed source
          permissive or restrictive
        delivery to customer/users:
          delivery strategy:
            from one-by-one to continuous
            long-term product goal
          roadmap
          resources
          constraints
          release plan
  """.trim