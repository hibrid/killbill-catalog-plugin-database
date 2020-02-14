###################################################################################
#                                                                                 #
#                   Copyright 2010-2014 Ning, Inc.                                #
#                                                                                 #
#      Ning licenses this file to you under the Apache License, version 2.0       #
#      (the "License"); you may not use this file except in compliance with the   #
#      License.  You may obtain a copy of the License at:                         #
#                                                                                 #
#          http://www.apache.org/licenses/LICENSE-2.0                             #
#                                                                                 #
#      Unless required by applicable law or agreed to in writing, software        #
#      distributed under the License is distributed on an "AS IS" BASIS, WITHOUT  #
#      WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the  #
#      License for the specific language governing permissions and limitations    #
#      under the License.                                                         #
#                                                                                 #
###################################################################################
# Prepare a release:
#   * Commit all pending changes
#   * Do the release
set -e

# Make sure we're up-to-date
git pull

NEXT_VERSION=`grep -E '<version>([0-9]+\.[0-9]+(\.[0-9]+)?)-SNAPSHOT</version>' pom.xml | sed 's/[\t \n]*<version>\(.*\)<\/version>[\t \n]*/\1/'`

# Make sure we can push before the release
git push

# Do the release
echo "Running: mvn release:clean" && \
mvn release:clean && \
echo "Running: mvn release:prepare" && \
mvn release:prepare && \
echo "Running: mvn release:perform" && \
mvn release:perform
