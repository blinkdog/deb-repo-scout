# serverTest.coffee
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

MODULE_UNDER_TEST = "../lib/server"

request = require "supertest"
should = require "should"

describe "server", ->
  mut = require MODULE_UNDER_TEST
  app = mut.create()

  describe "GET /", ->
    it "should return an empty JSON body", ->
      request app
      .get "/"
      .set "Accept", "application/json"
      .expect 200
      .expect "Content-Type", /json/
      .expect "{}"

  describe "GET /scout", ->
    it "should return an HTML page", ->
      request app
      .get "/scout"
      .set "Accept", "text/html"
      .expect 200
      .expect "Content-Type", /html/

  describe "GET /css/scout.css", ->
    it "should return a css file", ->
      request app
      .get "/css/scout.css"
      .set "Accept", "text/css"
      .expect 200
      .expect "Content-Type", /css/

#----------------------------------------------------------------------
# end of serverTest.coffee
