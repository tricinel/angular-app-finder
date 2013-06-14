A simple Angular app to search the App Store by app id and retrieve specific app information.

** Built with Yeoman, AngularJS, AngularUI, Coffeescript, SASS and the iTunes Search API **

# Installation

If you haven't already:

```shell
npm install -g yo grunt-cli bower
```

If you want to enhance the app, you'll need the yeoman angular generator:

```shell
npm install generator-angular
```

You will need node and npm to do this.

# Running the app

```shell
git clone git://github.com/tricinel/angular-app-finder.git
cd angular-app-finder
npm install
bower install
grunt server
```

# Features

Enter an app ID and the form will return a nice layout with the following information

- application icon
- application name
- application price
- application screenshots
- application iPad screenshots, if any
- applicaiton App Store web link
- application version number
- application company name
- application company link
- application category
- application average user rating

# Resources

- [The iTunes Search API](http://www.apple.com/itunes/affiliates/resources/blog/introduction---search-api.html)
- [iTunes Search API Examples](http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html#searchexamples)

# TODO

- more polished design
- responsive design