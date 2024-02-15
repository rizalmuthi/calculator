# Term deposit calculator

This calculator is written in Ruby.

## Setup
- `brew install ruby`
- `gem install bundler`
- `bundle`

## Running Tests

To run the whole test

```
bundle exec rspec
```

To run specific test

```
bundle exec rspec spec/calculator_spec.rb
```

## Running the program

To run the program

```
ruby calculator_cli.rb
```


## Considerations

Given the time constraints (2 hours):

- The implementation of the CLI is really basic and lacks unit tests. It would be beneficial to allocate more time to adding unit tests and improving error handling in the CLI to provide proper messages to the user.
- I have opted to solely write unit tests for this calculator. However, it would be advantageous to incorporate integration tests that validate inputs from the CLI and the calculator, which will help to detect any bugs when we modify any part of the codebase.
- Concern on money handling, I've chosen to utilize BigDecimal and round it to align with the output of the Bendigo Bank Calculator. To provide more precision, I would prefer to use the Money gem to do so.
- Investment term, currenly it only accepts Year, it would be good to handle different type like Months (6 Months) or Year with Months (1 Year 8 Months)
