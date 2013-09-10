# Manual #

Suggested hierarchy for the documentation manual. Each section of the manual is represented by a node (each indent).
Nodes can be nested indefinately. Each node can have documentation attached to it (represented by a dash).

```
Framework
  Getting Started
    - Requirements
    - PHP 5.3 or 5.4
  Packages
    Cache
      Cache
        - Caching data
        - Retrieving data
        - Clearing data
      Storage
        - Adding engines
        - Retrieving engines
        - Removing engines
    Common
      Base
        - Default inheritance
      Common
        - Setting data
        - Getting data
        - Removing data
        - Convenience methods
      Registry
        - Dynamic class loading through a factory
        - Setting objects
        - Getting objects
        - Removing objects
      Container
        - Factory-less
      Augments
        - Parameter mapping
        - Configuration mapping
        - Class reflection
      Traits
        - Lazy-loading related classes through attachments
        - Caching data in the class layer
        - Singleton or multiton instancing
        - Convert a class to a mutable data store
    Controller
      Controller
        - Creating a controller
        - Handling HTTP requests and responses
        - Dispatching actions
        - Rendering a view template
        - Pre and post callbacks
        - Module integration
      Action
        - Creating an action
        - Re-using an action
    Debug
      Debugger
        - Toggling errors
        - Error handling
        - Exception handling
        - Debugging variables
        - Custom handling
      Logger
        - Log levels and types
        - Creating a logger
        - Logging messages
      Benchmark
        - Writing benchmarks
    Env
      Environment
        - Adding hosts
        - Setting fallbacks
        - Initializing environment
        - Current detection
      Host
        - Mapping hosts
        - Bootstrapping
    Event
      Event
        - Stopping propagation
        - Debugging the callstack
        - Persisting data
      Emitter
        - Adding subscribers
        - Retrieving subscribers
        - Removing subscribers
        - Notifying subscribers about events
      Listener
        - Registering subscribers
    G11n
      G11n
        - Adding locales
        - Setting fallbacks
        - Initializing environment
        - Current detection
        - Convenience methods
        - Creating locale bundles
        - Creating message bundles
      Locale
        - Mapping resources
        - Extracting data from bundles
      Translator
        - Translating messages
        - Resource lookup paths
        - Message key naming convention
      Utility
        - Localized string formatting
        - Localized number formatting
        - Localized inflection rules
        - Localized validation rules
    HTTP
      Http
        - Status codes
        - Method types
        - Header types
      Request
        - Handling POST and GET
        - Handling FILES
        - Storing internal request data
        - Reading request headers
        - Conditional methods
      Response
        - Setting the body
        - Setting response headers
        - Setting cookies
        - Caching and ETags
      Session
        - Writing data
        - Reading data
        - Removing data
        - Validating data
        - Using handlers
      Cookie
        - Writing data
        - Reading data
        - Removing data
      Mime
        - Reading mime types
    IO
      Folder
        - Creating folders
        - Deleting folders
        - Copying folders
        - Renaming folders
        - Moving folders
        - Finding files
        - Reading meta information
        - Changing permissions
      File
        - Inheriting from Folder
        - Writing data
        - Reading data
        - File locking
      Reader
        - Reading data
        - Types of readers
      Writer
        - Writing data
        - Types of writers
      Bundle
        - Creating a resource bundle
        - Defining lookup paths
        - Loading resources
    Model
      Connection
        - Loading drivers
      Model 
        - Creating models
        - Adding behaviors
        - Mapping relationships
        - Defining a table schema
        - Using entities
        - Querying the database
        - Creating records
        - Reading records
        - Updating records
        - Deleting records
        - Upserting records
        - Pre and post callbacks
        - Convenience methods
      Entity
        - Retrieving data
        - Serialization
      Query
        - Building queries
        - Manipulating fields
        - Setting tables
        - Where conditions
        - Ordering results
        - Having conditions
        - Grouping results
        - Limiting results
        - Joining relationships
        - Joining records
        - Predicates
        - Expressions
        - Functions
        - Sub-queries
        - Caching
      Driver
        - Querying the database
        - Escaping or quoting data
        - Using transactions
        - Logging queries
        - Caching queries
        - Using schemas
        - Supported data types
        - Supported drivers
          - MySQL
          - PostgreSQL
          - SQLite
          - MongoDB
      Relation
        - Relating models together
        - One-to-one
        - One-to-many
        - Many-to-one
        - Many-to-many
      Behavior
        - Pre and post callbacks
        Timestampable
          - Defining auto-timestamp fields
        Countable
          - Defining countable fields
        Hierarchical
          - Defining the hierarchy
          - Fetching the tree
          - Moving nodes
    MVC
      Application
        - Adding modules
        - Setting the dispatcher
        - Symlinking modules
        - Error handling
        - Running the application
      Dispatcher
        - Dispatching the request
      Module
        - Bundling the module
        - Bootstrapping
        - Defining controllers
    Route
      Router
        - Mapping custom routes
        - Supported route patterns
        - Building routes
        - Parsing routes
        - Retrieving data
      Route
        - Getting the current route
        - Conditional detection
        - Retrieving params
    Type
      String
        - Methods
      Enum
        - Methods
      Map
        - Methods
      Object
        - Methods
    Utility
      Converter
        - Methods
      Crypt
        - Methods
      Format
        - Methods
      Hash
        - Methods
      Inflector
        - Methods
      Number
        - Methods
      Path
        - Methods
      Sanitize
        - Methods
      String
        - Methods
      Time 
        - Methods
      Uuid
        - Methods
      Validate
        - Methods
      Validator
        - Creating rules
        - Validating data
    View
      View
        - Adding lookup paths
        - Adding helpers
        - Setting the engine
        - Building template paths
        - Locating templates
        - Rendering templates
        - Passing data
        - Pre and post callbacks
      Engine
        - Using layouts
        - Using wrappers
        - Nested templates
      Helper
        - Creating helpers
        - Pre and post callbacks
        Html
          - Setting the doctype
          - Creating links
          - Creating images
          - Adding meta tags
          - Creating other tags
        Asset
          - Adding CSS and JS assets
          - Including the assets
        Breadcrumb
          - Adding breadcrumbs
          - Rendering the navigation
        Form
          - Building forms
          - Text inputs and textareas
          - Radios and checkboxes
          - Selects
          - Misc inputs
  
Toolkit
  Getting Started
    - Requirements
    - HTML5 & CSS3
    - Mobile first 
    - Fluid & responsive based
  CSS
    - Normalize integration
    - Global states
    - Sizing and shapes
    - Reserved classes
    Layout
      Base
        - Box sizing
        - Utility classes
      Typography
        - Headings
        - Lists
        - Paragraphs
        - Blockquotes
        - Text
      Grid
        - 12 column system
        - Persistent columns
        - Browser aware columns
        - Offsetting columns
        - Nesting grids
      Responsive
        - Media scaling
        - Browser visibility
        - State detection
      Code 
        - Inline
        - Block
      Form
        - Input fields
        - Vertical layout
        - Horizontal layout
        - Inline layout
        - States
      InputGroup
        - Addon usage
        - Checkbox and radios
        - Button and button groups
      Table
        - Basic usage
        - Modifiers
    UI
      Alert
        - Usage
      Breadcrumbs
        - Usage
      Button
        - Usage
      ButtonGroup
        - Usage
        - Modifiers
      Dropdown
        - Usage
        - Modifiers
      Icon
        - Usage
      Label & Badge
        - Usage
        - Modifiers
      Pagination
        - Usage
        - Modifiers
      Progress
        - Usage
  Javascript
    - Reserved namespace
    - Component system
    - Custom templates
    Base
      Titon
        - Custom options
        - Triggering transitions
        - Localization
      Component
        - Creating components
        - Element targeting
        - Template handling
        - Events and delegation
    Modules
      Accordion
        - Usage
        - Options
        - Events
        - Methods
      Blackout
        - Usage
        - Options
        - Events
        - Methods
      Carousel
        - Usage
        - Options
        - Events
        - Methods
      Flyout
        - Usage
        - Options
        - Events
        - Methods
      Modal
        - Usage
        - Options
        - Events
        - Methods
      Popover
        - Usage
        - Options
        - Events
        - Methods
      Showcase
        - Usage
        - Options
        - Events
        - Methods
      Tabs
        - Usage
        - Options
        - Events
        - Methods
      Tooltip
        - Usage
        - Options
        - Events
        - Methods
      TypeAhead
        - Usage
        - Options
        - Events
        - Methods
    Utilities
      LazyLoad
        - Usage
        - Options
        - Events
        - Methods
      Pin
        - Usage
        - Options
        - Events
        - Methods
      Toggle
        - Usage
        - Options
        - Events
        - Methods
    Extensions
      Cache
        - Usage
        - Options
        - Events
        - Methods
      Timers
        - Usage
        - Options
        - Events
        - Methods
  Build
```
