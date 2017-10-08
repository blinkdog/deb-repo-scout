# sources.coffee
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

SOURCES_RE = /^(deb|deb-src)\s+(\[([^\]]+)\]\s+)*(\S+)\s+(\S+)\s+(.+)$/

exports.parse = (line) ->
  # take the sources.list line we were given and parse with the regexp
  chop = SOURCES_RE.exec line
  return null if not chop?
  # if there were some [ attributes=values ], then parse those
  attrObj = null
  if chop[3]?
    attrObj = {}
    attributes = chop[3].trim().split " "
    for attribute in attributes
      keyvalues = attribute.split "="
      attrObj[keyvalues[0]] = keyvalues[1].split ","
  # parse the main contrib non-free component sections
  components = chop[6].split " "
  # build up the fully parsed object
  retVal =
    type: chop[1]
    url: chop[4]
    suite: chop[5]
    components: components
  # annotate it with an attributes sub-object (if necessary)
  if attrObj?
    retVal.attributes = attrObj
  # return the parsed object to the caller
  return retVal

#----------------------------------------------------------------------
# end of sources.coffee
