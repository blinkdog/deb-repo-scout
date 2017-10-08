# server.coffee
# Copyright 2017 Patrick Meade.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#----------------------------------------------------------------------

bodyParser = require "body-parser"
express = require "express"
stylus = require "stylus"

sources = require "./sources"

exports.create = ->
  app = express()

  app.locals.pretty = true

  app.set "view engine", "pug"
  app.set "views", "views/pug"

  app.use express.urlencoded
    extended: true

  app.use "/css", stylus.middleware
    src: "views/stylus"
    dest: "public/css"
    compile: (str, path) ->
      stylus(str)
      .set "filename", path
      #.set "warn", true
      #.set "compress", true

  app.use express.static "public"

  app.get "/", (req, res, next) ->
    res.status(200).json {}

  app.get "/scout", (req, res, next) ->
    res.render "scout"

  app.post "/scout", (req, res, next) ->
    # if we didn't get a sources line in the POST body
    if not req.body.sources?
      return res.render "scout",
        error: "Please provide a valid sources line."
    # parse the provided sources line
    sourcesObj = sources.parse req.body.sources
    # if we got a nonsense sources line
    if not sourcesObj?
      return res.render "scout",
        error: "Please provide a valid sources line."
    # render the report
    res.render "report",
      sources: JSON.stringify sourcesObj, null, 2

  return app

#----------------------------------------------------------------------
# end of server.coffee
