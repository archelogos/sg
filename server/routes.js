/**
 * Main application routes
 */

'use strict';

var errors = require('./components/errors');
var path = require('path');

module.exports = function(app) {

  // Insert routes below
  app.use('/api/things', require('./api/thing'));

  // All undefined asset or api routes should return a 404
  app.route('/:url(api|auth|components|app|bower_components|assets)/*')
   .get(errors[404]);

   // Futurial
   app.route('/template-futurial')
     .get(function(req, res) {
       res.sendFile(path.resolve(app.get('appPath') + '/templates/futurial/index.html'));
     });

   // Foody
   app.route('/template-foody')
     .get(function(req, res) {
       res.sendFile(path.resolve(app.get('appPath') + '/templates/foody/index.html'));
     });

   // Converter
   app.route('/template-converter')
     .get(function(req, res) {
       res.sendFile(path.resolve(app.get('appPath') + '/templates/converter/index.html'));
     });

  // All other routes should redirect to the index.html
  app.route('/*')
    .get(function(req, res) {
      res.sendFile(path.resolve(app.get('appPath') + '/index.html'));
    });
};
