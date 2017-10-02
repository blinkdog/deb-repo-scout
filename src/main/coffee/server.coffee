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

express = require "express"
stylus = require "stylus"

exports.create = ->
  app = express()

  app.locals.pretty = true

  app.set "view engine", "pug"
  app.set "views", "views/pug"

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

  return app

#----------------------------------------------------------------------
# end of server.coffee
