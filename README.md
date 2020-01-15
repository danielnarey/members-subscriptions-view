# danielnarey/members-subscriptions-view

*Demo app using Elm with @metamodern/static*

The application sorts and renders a subscriber list and allows the user to select any one of the members to display more detailed information.


## Static Version

- Used to develop and test UI
- Pre-bundles sample data from `src/data/members.json`
- Deploys from `master` branch to https://members-subscriptions-view.netlify.com/

## Local Development Version

- Used to test server-client setup
- Fetches data from a server running on `localhost:3000`
- Builds from `local-dev` branch
- Server code at https://github.com/danielnarey/code-test-express

### Setup instructions

```bash
# Server setup
git clone https://github.com/danielnarey/code-test-express
cd code-test-express
npm i
npm run migrate && npm run seed
npm start

# Test that you are getting JSON output at http://localhost:3000/members
# Keep process running and open a new CLI window

# Client setup
git clone https://github.com/danielnarey/members-subscriptions-view
cd members-subscriptions-view
npm i
npm run build
cd dist && npx ws

# Test that the app is loading with data from the server at http://localhost:8000/

```
