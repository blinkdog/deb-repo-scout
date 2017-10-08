# sourcesTest.coffee
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

MODULE_UNDER_TEST = "../lib/sources"

should = require "should"

STRETCH_DEB="deb http://deb.debian.org/debian stretch main contrib non-free"
STRETCH_DEBSRC="deb-src http://deb.debian.org/debian stretch main contrib non-free"
STRETCH_UPDATE_DEB="deb http://deb.debian.org/debian stretch-updates main contrib non-free"
STRETCH_UPDATE_DEBSRC="deb-src http://deb.debian.org/debian stretch-updates main contrib non-free"
STRETCH_SECURITY_DEB="deb http://security.debian.org/ stretch/updates main contrib non-free"
STRETCH_SECURITY_DEBSRC="deb-src http://security.debian.org/ stretch/updates main contrib non-free"

XENIAL_DEB="deb http://us.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse"
XENIAL_DEBSRC="deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse"
XENIAL_UPDATE_DEB="deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse"
XENIAL_UPDATE_DEBSRC="deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse"
XENIAL_SECURITY_DEB="deb http://us.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse"
XENIAL_SECURITY_DEBSRC="deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse"

STEAM_DEB="deb [arch=amd64,i386] http://repo.steampowered.com/steam/ precise steam"
STEAM_DEBSRC="deb-src [arch=amd64,i386] http://repo.steampowered.com/steam/ precise steam"

MAN_EXAMPLE_1 = "deb [ arch=amd64,armel ] http://httpredir.debian.org/debian jessie main"

describe "sources", ->
  {parse} = require MODULE_UNDER_TEST

  it "should be able to parse STRETCH_DEB", ->
    parse(STRETCH_DEB).should.eql
      type: "deb"
      url: "http://deb.debian.org/debian"
      suite: "stretch"
      components: ["main", "contrib", "non-free"]

  it "should be able to parse STRETCH_DEBSRC", ->
    parse(STRETCH_DEBSRC).should.eql
      type: "deb-src"
      url: "http://deb.debian.org/debian"
      suite: "stretch"
      components: ["main", "contrib", "non-free"]

  it "should be able to parse STRETCH_UPDATE_DEB", ->
    parse(STRETCH_UPDATE_DEB).should.eql
      type: "deb"
      url: "http://deb.debian.org/debian"
      suite: "stretch-updates"
      components: ["main", "contrib", "non-free"]

  it "should be able to parse STRETCH_UPDATE_DEBSRC", ->
    parse(STRETCH_UPDATE_DEBSRC).should.eql
      type: "deb-src"
      url: "http://deb.debian.org/debian"
      suite: "stretch-updates"
      components: ["main", "contrib", "non-free"]

  it "should be able to parse STRETCH_SECURITY_DEB", ->
    parse(STRETCH_SECURITY_DEB).should.eql
      type: "deb"
      url: "http://security.debian.org/"
      suite: "stretch/updates"
      components: ["main", "contrib", "non-free"]

  it "should be able to parse STRETCH_SECURITY_DEBSRC", ->
    parse(STRETCH_SECURITY_DEBSRC).should.eql
      type: "deb-src"
      url: "http://security.debian.org/"
      suite: "stretch/updates"
      components: ["main", "contrib", "non-free"]

  it "should be able to parse XENIAL_DEB", ->
    parse(XENIAL_DEB).should.eql
      type: "deb"
      url: "http://us.archive.ubuntu.com/ubuntu/"
      suite: "xenial"
      components: ["main", "restricted", "universe", "multiverse"]

  it "should be able to parse XENIAL_DEBSRC", ->
    parse(XENIAL_DEBSRC).should.eql
      type: "deb-src"
      url: "http://us.archive.ubuntu.com/ubuntu/"
      suite: "xenial"
      components: ["main", "restricted", "universe", "multiverse"]

  it "should be able to parse XENIAL_UPDATE_DEB", ->
    parse(XENIAL_UPDATE_DEB).should.eql
      type: "deb"
      url: "http://us.archive.ubuntu.com/ubuntu/"
      suite: "xenial-updates"
      components: ["main", "restricted", "universe", "multiverse"]

  it "should be able to parse XENIAL_UPDATE_DEBSRC", ->
    parse(XENIAL_UPDATE_DEBSRC).should.eql
      type: "deb-src"
      url: "http://us.archive.ubuntu.com/ubuntu/"
      suite: "xenial-updates"
      components: ["main", "restricted", "universe", "multiverse"]

  it "should be able to parse XENIAL_SECURITY_DEB", ->
    parse(XENIAL_SECURITY_DEB).should.eql
      type: "deb"
      url: "http://us.archive.ubuntu.com/ubuntu/"
      suite: "xenial-security"
      components: ["main", "restricted", "universe", "multiverse"]

  it "should be able to parse XENIAL_SECURITY_DEBSRC", ->
    parse(XENIAL_SECURITY_DEBSRC).should.eql
      type: "deb-src"
      url: "http://us.archive.ubuntu.com/ubuntu/"
      suite: "xenial-security"
      components: ["main", "restricted", "universe", "multiverse"]

  it "should be able to parse STEAM_DEB", ->
    parse(STEAM_DEB).should.eql
      type: "deb"
      url: "http://repo.steampowered.com/steam/"
      suite: "precise"
      components: ["steam"]
      attributes:
        arch: ["amd64", "i386"]

  it "should be able to parse STEAM_DEBSRC", ->
    parse(STEAM_DEBSRC).should.eql
      type: "deb-src"
      url: "http://repo.steampowered.com/steam/"
      suite: "precise"
      components: ["steam"]
      attributes:
        arch: ["amd64", "i386"]

  it "should be able to parse MAN_EXAMPLE_1", ->
    parse(MAN_EXAMPLE_1).should.eql
      type: "deb"
      url: "http://httpredir.debian.org/debian"
      suite: "jessie"
      components: ["main"]
      attributes:
        arch: ["amd64", "armel"]

  it "should return null when parsing null", ->
    should(parse null).equal null

  it "should return null when parsing empty", ->
    should(parse "").equal null

  it "should return null when parsing total nonsense", ->
    should(parse "the quick brown fox jumps over the lazy dog").equal null

  it "should return null when parsing partial nonsense", ->
    should(parse "deb [arch=amd64,i386] http://repo.steampowered.com/steam/").equal null

  it "should return null when parsing an incomplete line", ->
    should(parse "deb-src http://deb.debian.org/debian stretch").equal null

#----------------------------------------------------------------------
# end of sourcesTest.coffee
