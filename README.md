# danielnarey/members-subscriptions-view

*Demo app using Elm with @metamodern/static*

The application sorts and renders a subscriber list and allows the user to select any one of the members to display more detailed information.


## Static Version

- Used to develop and test UI
- Pre-bundles sample data from `src/data/members.json`
- Deploys from `master` branch to https://danielnarey-members-subscriptions-view.netlify.com/

## Local Development Version

- Used to test server-client setup
- Fetches data from a server running on `localhost:3000`
- Builds from `local-dev` branch
- Server setup at https://github.com/danielnarey/code-test-express
