# Project Name

## Overview
Use Ruby on Rails to build a project conversation history. A user should be able to:
- leave a comment
- change the status of the project
The project conversation history should list comments and changes in status.

## Requirements
- **Ruby:** `3.3.6`
- **Rails:** `~> 8.0.1`
- **Node.js:** `18`
- **Database:** PostgreSQL

## Installation

1. **Clone the repository:**
   ```sh
   git clone git@github.com:vik007/interview-project-flow.git
   cd interview-project
   ```

2. **Install dependencies:**
   ```sh
   bundle install
   ```

3. **Install JavaScript dependencies:**
   ```sh
   yarn install
   ```

4. **Set up the database:**
   ```sh
   rails db:create db:migrate db:seed
   ```

## Running the Application
To start the Rails server, run:
```sh
bin/dev
```

Then visit `http://localhost:3000` in your browser.

## Testing
To run the test suite:
```sh
rspec
```
