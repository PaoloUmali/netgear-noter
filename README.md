## pNoter2116

- Case noter for Netgear
- Homepage: https://github.com/PaoloUmali/netgear-noter
- Demo: http://netgear-noter.paolo.ph

### Updates

- kesh: Enabled spellcheck
- lester: Cache expiration for all notes(localStorage) max 11hrs, current note(tracks every 20sec) to cookie
- ram, rejith: Added copy to clipboard buttons for Full Notes and Spark reports
- ram: Dropdown for some device models, auto launch product support page
- domz: Summary for Spark long call updates
- Made Notes list copy pasteable for reports
- User's may import their own scripts
- Improved Quick TS, may import their own
- Navigate input fields using accesskeys, Alt+{Letter}

### Bower Assets

Note: .bowerrc: directory: bower_components

- "angular": "~1.3.x",
- "angular-mocks": "~1.3.x",
- "angular-route": "~1.3.x",
- "angular-cookies": "~1.3.x",
- "angular-local-storage": "~0.2.x",
- "jquery": "~1.11.x",
- "bootstrap": "~3.3.x",
- "html5shiv": "~3.7.x",
- "respond": "~1.4.x",
- "zeroclipboard": "~2.2.x",
- "ng-clip": "~0.2.x"

### NodeJS Instructions

- To install node packages for hosting, run: npm install. This will install bower components too
- To run server, run: npm start. It will host it on localhost:8000
- To run unit tests, run: npm test. It will watch your code
- To run e2e tests, run: npm run protractor.