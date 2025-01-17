#!/bin/bash
#
# Copyright © 2016-2021 The Thingsboard Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

source compose-utils.sh

ADDITIONAL_COMPOSE_QUEUE_ARGS=$(additionalComposeQueueArgs) || exit $?
echo $ADDITIONAL_COMPOSE_QUEUE_ARGS

ADDITIONAL_COMPOSE_ARGS=$(additionalComposeArgs) || exit $?
echo $ADDITIONAL_COMPOSE_ARGS

ADDITIONAL_COMPOSE_MONITORING_ARGS=$(additionalComposeMonitoringArgs) || exit $?
echo $ADDITIONAL_COMPOSE_MONITORING_ARGS

echo docker-compose -f docker-compose.yml $ADDITIONAL_COMPOSE_ARGS $ADDITIONAL_COMPOSE_QUEUE_ARGS $ADDITIONAL_COMPOSE_MONITORING_ARGS up -d
docker-compose -f docker-compose.yml $ADDITIONAL_COMPOSE_ARGS $ADDITIONAL_COMPOSE_QUEUE_ARGS $ADDITIONAL_COMPOSE_MONITORING_ARGS up -d
