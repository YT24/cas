<%--

    Licensed to Apereo under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Apereo licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

<div class="services-table-container" ng-controller="ServicesTableController as serviceTableCtrl">
    <div class="row">
        <div class="col-sm-12">
            <div class="form-group has-feedback search-form">
                <input type="text" class="form-control input-lg" ng-model="serviceTableCtrl.serviceTableQuery" placeholder="<spring:message code="management.services.table.label.search" /> " autofocus/>
                <a class="fa fa-2x fa-times-circle-o form-control-feedback search-clear" ng-click="serviceTableCtrl.clearFilter()"></a>
            </div>
        </div>
    </div> <!-- end .row div -->
    <div class="row">
        <div class="col-sm-12">
            <table class="table table-hover table-striped services-table" ng-model="serviceTableCtrl.dataTable">
                <thead>
                    <tr>
                        <th class="col-sm-3"><spring:message code="management.services.table.header.serviceName" /></th>
                        <th class="col-sm-2"><spring:message code="management.services.table.header.serviceId" /></th>
                        <th class="col-sm-3"><spring:message code="management.services.table.header.serviceDesc" /></th>
                        <th class="col-sm-2"><spring:message code="management.services.table.header.evaluationOrder" /></th>
                        <th class="col-sm-1"></th>
                        <th class="col-sm-1"></th>
                    </tr>
                </thead>
                <tbody ui-sortable="serviceTableCtrl.sortableOptions" ng-model="serviceTableCtrl.dataTable">
                    <tr id="assignedId_{{ item.assignedId }}" ng-repeat="item in serviceTableCtrl.dataTable | filter: serviceTableCtrl.serviceTableQuery">
                        <td colspan="6">

                <table>
                    <tr class="main-row">
                        <td class="col-sm-3">
                            <div class="grabber-icon"><i class="fa fa-lg fa-ellipsis-v"></i></div>
                            {{ item.name }}
                            <a href="javascript://" class="more" ng-click="serviceTableCtrl.toggleDetail(item.evalOrder)">
<%-- Needs accessibility text for screen readers, something like "a11y OffScreen" (Google) --%>
                                <i class="fa fa-chevron-{{ serviceTableCtrl.activePosition === item.evalOrder ? 'up' : 'down' }}"></i>
                            </a>
                        </td>
                        <td class="col-sm-2">{{ item.assignedId }}</td>
                        <td class="col-sm-3">{{ item.description }}</td>
                        <td class="col-sm-2">{{ item.evalOrder }}</td>
                        <td class="col-sm-1">
                            <button class="btn btn-success" ng-click="action.selectAction('add')">
                                <i class="fa fa-lg fa-pencil"></i> <spring:message code="management.services.table.button.edit" />
                            </button>
                        </td>
                        <td class="col-sm-1">
                            <button class="btn btn-danger" onclick="javascript:;">
                                <i class="fa fa-lg fa-trash"></i> <spring:message code="management.services.table.button.delete" />
                            </button>
                        </td>
                    </tr>
                    <tr class="detail-row" ng-show="serviceTableCtrl.activePosition == item.evalOrder">
                        <td colspan="6">Quick-view details about service.</td>
                    </tr>
                </table>

                        </td>
                    </tr>
                </tbody>
            </table>  <!-- end .services-table table -->
        </div> <!-- end .col-sm-12 div -->
    </div> <!-- end .row div -->
</div> <!-- end .services-table-container div -->