# HonestBudget

A Rails app (built as a Flatiron Portfolio Project) designed to help users create a customized budget, keep track of their everyday expenses and know exactly where there money is going! Users can filter their purchases by category and have an accurate count of remaining money available. 

## Getting Started

These instructions will get HonestBudget up and running on your computer.

### Prerequisites

Other than the gems listed in this app's Gemfile, you will need to have (Ruby)[https://www.ruby-lang.org/en/downloads/] and [Rails](https://guides.rubyonrails.org/v5.0/getting_started.html) installed on your local machine as well as the ability to install Ruby gems.

### Installing

To run this app locally, fork and clone the [GitHub repo](https://github.com/nicmlu/honest-budget) to your local machine. 

Change directories into the repo directory. Run bundle install to install dependencies, and rails db:migrate and rails db:seed to create and seed the database. 
```
$cd honest-budget 
$bundle install
$rails db:migrate
$rails db:seed
```

Run $rails s to start a web server and access the app in a web browser. 
```
$rails s
```

Use your favorite browser to visit the route displayed in the terminal. (E.g. http://localhost:3000)

## Built With

* Rails
* Ruby 
* Materialize CSS

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicmlu/honest-budget. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant [code of conduct](https://github.com/nicmlu/honest-budget/code_of_conduct.md).


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
