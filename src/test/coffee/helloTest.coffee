# helloTest.coffee
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

MODULE_UNDER_TEST = "../lib/hello"

should = require "should"

describe "hello", ->
  mut = require MODULE_UNDER_TEST

  it "should offer a generic greeting", ->
    mut.getMessage().should.equal "Hello, world!"

  it "should offer a personalized greeting", ->
    mut.getMessage("Alice").should.equal "Hello, Alice!"

#----------------------------------------------------------------------
# end of helloTest.coffee
