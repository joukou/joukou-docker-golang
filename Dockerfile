# Copyright 2014 Joukou Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FROM quay.io/joukou/base
MAINTAINER Isaac Johnston <isaac.johnston@joukou.com>

ENV GOROOT /go/root
ENV GOPATH /go/path
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

# Install Go from source
RUN mkdir -p ${GOROOT} ${GOPATH} && \
    curl -s https://storage.googleapis.com/golang/go1.3.src.tar.gz | tar -vxz \
      --strip-components=1 -C ${GOROOT} && \
    cd ${GOROOT}/src && \
    ./make.bash --no-clean 2>&1 && \
    go get github.com/tools/godep