# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [ ] Include signup (how e.g. Devise)
- [ ] Include login (how e.g. Devise)
- [ ] Include logout (how e.g. Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate

To Do: 
- On Transaction Index Page: (1) code the iteration to order transactions by most recent by default, (2) add search bar to filter results
- 

Help Needed: 
- Nested routes not working for transactions, wont allow me to edit because route is not available for class if I route it. 
- If I use collection_select, where do the category names populate from? (transaction category names are budget categories) How can I get the transaction categories to populate from budget categories? Do I have to add them as budget attributes and then build/shovel into categories? 
- create budget helper methods? to determine when a user has overspent on their budget and/or a particular category. 
- research how to use number_to_currency helper method to properly display values. (can't use with a float type input)
- should calculation methods such as total_spent in transaction controller be moved to the transaction helper file?
- How do I use the  {:selected => current_book.authors} collection_select feature to have the budget auto populated?


Google Button Code: 
in head : <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">

<br>
<div id="my-signin2" class="center"></div>
  <script>
    function onSuccess(googleUser) {
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
    }
    function onFailure(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 200,
        'height': 50,
        'longtitle': true,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure,
        'align': 'center',
      });
    }
  </script>
  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>