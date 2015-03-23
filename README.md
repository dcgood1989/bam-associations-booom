## BAM Round 4, Associations with Validations

Fork and clone this repository, `rake db:create`, etc.

When you are finished, open a pull request to submit your work.

### Steps

In this application imagine that you are modeling flights from a single airport. Each flight consists of a plane and a destination, as well as a departure time. For simplicity, destinations are city/state combos, and airplanes have a manufacturer, airline, and unique serial number.

In this benchmark, there are 3 model specs and 2 feature specs. One of the feature specs should pass by default, and should still pass after your implementation of the second feature spec. You may find it beneficial to get the model tests passing before the feature spec. Going in alphabetical order for the model specs is most likely the best order to go in.

#### Do not modify _any_ spec files.

#### Hints

In order to pass the model specs, you'll need to set up a new table as well as associations in each of your model files.

Gems `pry` and `launchy` are included by default for debugging.

The feature spec file (`flight_management_spec`), expects an un-nested flights index, which allows an authenticated user to both see a list of existing flights and create new flights by selecting an airplane, destination, and departure date.

The feature spec files expect an unnested appointments index, which only shows appointments for the logged in user.
