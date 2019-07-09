# W07D2

## Outline

* Primary Goals for Week 7
  * What it's like to inherit an existing codebase
  * Having to work with a new language and paradigm (Class-based OOP)
  * What it means to learn a new framework while applying it
  * Finding and applying previous debugging tactics
* Intro to Bundler
  * Dependency management at the project level
  * gems at the project level
* Intro to ActiveRecord & Knex
  * How does AR compare with Knex?
  * Demo

## 0. Primary Goal for Week 7

* What it's like to inherit an existing codebase
* Having to work with a new language and paradigm (Class-based OOP)
* What it means to learn a new framework while applying it
* Finding and applying previous debugging tactics
* Process of learning what it means to be a polyglot developer (working with at least 2 major programming languages)

## 1. Bundler (15m)

RubyGem command `gem` is for global / system wide gems by default and this was a problem in the Ruby community because there was no project-specific dependency management. 

Working on different projects each referencing a different version of Rails (1.x, 2.x, 3.x, etc), for example, lead to conflicts or confusion between developers.

Bundler is a gem that was created to help us manage the gems (heh) for any Ruby project. It's not a replacement for `gem` but rather adds that additional feature that `npm` already has, which is to provide project-specific dependency locking. It does this via a .lock file, similar to what npm 5 implemented.

Commands: 

- `bundle init`
- `bundle install`
- `bundle show`
- `bundle show [gemname]`

We talked about the `Gemfile` and `Gemfile.lock` and their responsibilities and we track/commit both but only edit `Gemfile`. The lock file is managed by bundler (do not edit). This is similar to how npm works, except that there is no subdirectory created with all the downloaded code. Instead, it is downloaded into a central area.

## 2. ActiveRecord (AR)

**Live Code Example:** 

<https://gist.github.com/kvirani/e3d0ebe0ea6db2a159542f38e044e3b2>

1. First we looked at what an ORM implementation would potentially look like, using pseudo-ruby code (see user.rb)
2. Then we implemented the Student <> Cohort models (see app.rb)

### AR is an ORM. What is an ORM?

An Object Relational Mapping. What does that mean and what's it for?

- A library and paradigm that helps you manage (CRUD) your relational (SQL) data
- Goal is to make it easier to deal with transactional SQL statements
- Tries to abstract away the SQL language

#### The "mapping"

1. Table -> Class / Model (eg: User)
2.  - Row -> Instance of Class (eg: user = User.new)
3.  - Col -> Attribute on Instance (eg: user.email)

#### What does AR give us?

1. OOP paradigm to deal with our data
 * Class methods and instance methods
2. Query builder
3. Returns to us instances of our Domain model (Cohort)
4. Work with rows as though they are instances with attributes
5. CRUD methods to do SELECT / DELETE / etc against our tables.
6. Associations between models (`belongs_to` and `has_many`). 
  * DO NOT get caught up with `has_and_belongs_to_many`.
7. Data Validations (we briefly touched on this; more later)


**Heads up:**

- AR is going to seem like a bunch of magic
- You will want to read the guide / documentation and it will take time to recall the API.
- Basically there's a lot of meta-programming to help us write VERY LITTLE code.

**Important Rule for Rails & ActiveRecord**:

"Convention over Configuration" therefore if you follow the general rules, it can make accurate assumptions. The Naming conventions are only important if you want to use the defaults / conventions (and write less code)

Thanks KV for the notes !