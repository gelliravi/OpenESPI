/*******************************************************************************
 * Copyright (c) 2011, 2012 EnergyOS.Org
 *
 * Licensed by EnergyOS.Org under one or more contributor license agreements.
 * See the NOTICE file distributed with this work for additional information
 * regarding copyright ownership.  The EnergyOS.org licenses this file
 * to you under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You may obtain a copy
 * of the License at:
 *  
 *   http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 *  
 ******************************************************************************
*/


// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.datacustodian.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.energyos.espi.datacustodian.domain.DataCustodianDataOnDemand;
import org.energyos.espi.datacustodian.domain.RetailCustomer;
import org.energyos.espi.datacustodian.domain.RetailCustomerDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect RetailCustomerDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RetailCustomerDataOnDemand: @Component;
    
    private Random RetailCustomerDataOnDemand.rnd = new SecureRandom();
    
    private List<RetailCustomer> RetailCustomerDataOnDemand.data;
    
    @Autowired
    DataCustodianDataOnDemand RetailCustomerDataOnDemand.dataCustodianDataOnDemand;
    
    public RetailCustomer RetailCustomerDataOnDemand.getNewTransientRetailCustomer(int index) {
        RetailCustomer obj = new RetailCustomer();
        setCustomerSince(obj, index);
        setEmail(obj, index);
        setFirstName(obj, index);
        setLastName(obj, index);
        return obj;
    }
    
    public void RetailCustomerDataOnDemand.setCustomerSince(RetailCustomer obj, int index) {
        Date customerSince = new Date(new Date().getTime() - 10000000L);
        obj.setCustomerSince(customerSince);
    }
    
    public void RetailCustomerDataOnDemand.setEmail(RetailCustomer obj, int index) {
        String email = "foo" + index + "@bar.com";
        if (email.length() > 30) {
            email = email.substring(0, 30);
        }
        obj.setEmail(email);
    }
    
    public void RetailCustomerDataOnDemand.setFirstName(RetailCustomer obj, int index) {
        String firstName = "firstName_" + index;
        if (firstName.length() > 30) {
            firstName = firstName.substring(0, 30);
        }
        obj.setFirstName(firstName);
    }
    
    public void RetailCustomerDataOnDemand.setLastName(RetailCustomer obj, int index) {
        String lastName = "lastName_" + index;
        if (lastName.length() > 30) {
            lastName = lastName.substring(0, 30);
        }
        obj.setLastName(lastName);
    }
    
    public RetailCustomer RetailCustomerDataOnDemand.getSpecificRetailCustomer(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        RetailCustomer obj = data.get(index);
        Long id = obj.getId();
        return RetailCustomer.findRetailCustomer(id);
    }
    
    public RetailCustomer RetailCustomerDataOnDemand.getRandomRetailCustomer() {
        init();
        RetailCustomer obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return RetailCustomer.findRetailCustomer(id);
    }
    
    public boolean RetailCustomerDataOnDemand.modifyRetailCustomer(RetailCustomer obj) {
        return false;
    }
    
    public void RetailCustomerDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = RetailCustomer.findRetailCustomerEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'RetailCustomer' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<RetailCustomer>();
        for (int i = 0; i < 10; i++) {
            RetailCustomer obj = getNewTransientRetailCustomer(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
