#Doctor's Office Database

---

## Synopsis

Doctor's Office Database is a simple Ruby application built by [Courtney Phillips](https://github.com/courtneymaepdx) with the ability to organize fictional medical professionals and their corresponding patients into a database for later recall. Crafted as part of the Spring 2015 Ruby course curriculum at [Epicodus](https://www.epicodus.com/).

## Motivation

Doctor's Office Database was created as an educational exercise in one-to-many database relationships using SQL and Ruby. While geared toward a fictional medical office, the basic logic and functionality could easily translate to other circumstances and projects requiring basic database relationships and retrieval.

## Database Setup

```
# psql
username=# CREATE DATABASE doctor_office;
username=# \c doctor_office;
hair_salon=# CREATE TABLE patients (id serial PRIMARY KEY, name varchar, birthdate varchar, doctor_id int);
hair_salon=# CREATE TABLE doctors (id serial PRIMARY KEY, name varchar, specialty varchar);
hair_salon=# CREATE DATABASE doctor_office_test WITH TEMPLATE doctor_office;
```

## Contribute

  - Issue Tracker: https://github.com/courtneyphillips/doctors-office-database/issues
  - Source Code: https://github.com/courtneyphillips/doctors-office-database
  - Pull Requests: https://github.com/courtneyphillips/doctors-office-database/pulls

## Installation

Doctor Office Database uses the following gems:

  - Capybara
  - Sinatra
  - Sinatra-Contrib
  - RSpec
  - Pry
  - PG

To install, run `gem install bundle` in the command line.

## Tests

Both method and integration tests for the Doctor Office Database utilize the RSpec. Simply run `gem install rspec`, if it's not already installed, simply issue the command `rspec`, while located in the project's file.

## Links

  - GitHub: https://github.com/courtneyphillips/doctors-office-database

## Contact

Questions, concerns, fan-mail, or other grievances can be directed to Courtney at <courtney.mae.phillips@gmail.com>.

## License

The MIT License (MIT)

Copyright (c) 2015 Courtney Phillips

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

---
