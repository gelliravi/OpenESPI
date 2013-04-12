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

package org.energyos.espi.datacustodian.common;

import java.util.List;
import org.energyos.espi.datacustodian.common._AccessToken;
import org.energyos.espi.datacustodian.common._AccessTokenDataOnDemand;
import org.energyos.espi.datacustodian.common._AccessTokenIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect _AccessTokenIntegrationTest_Roo_IntegrationTest {
    
    declare @type: _AccessTokenIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: _AccessTokenIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: _AccessTokenIntegrationTest: @Transactional;
    
    @Autowired
    _AccessTokenDataOnDemand _AccessTokenIntegrationTest.dod;
    
    @Test
    public void _AccessTokenIntegrationTest.testCount_AccessTokens() {
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to initialize correctly", dod.getRandom_AccessToken());
        long count = _AccessToken.count_AccessTokens();
        Assert.assertTrue("Counter for '_AccessToken' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void _AccessTokenIntegrationTest.testFind_AccessToken() {
        _AccessToken obj = dod.getRandom_AccessToken();
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to provide an identifier", id);
        obj = _AccessToken.find_AccessToken(id);
        Assert.assertNotNull("Find method for '_AccessToken' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for '_AccessToken' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void _AccessTokenIntegrationTest.testFindAll_AccessTokens() {
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to initialize correctly", dod.getRandom_AccessToken());
        long count = _AccessToken.count_AccessTokens();
        Assert.assertTrue("Too expensive to perform a find all test for '_AccessToken', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<_AccessToken> result = _AccessToken.findAll_AccessTokens();
        Assert.assertNotNull("Find all method for '_AccessToken' illegally returned null", result);
        Assert.assertTrue("Find all method for '_AccessToken' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void _AccessTokenIntegrationTest.testFind_AccessTokenEntries() {
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to initialize correctly", dod.getRandom_AccessToken());
        long count = _AccessToken.count_AccessTokens();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<_AccessToken> result = _AccessToken.find_AccessTokenEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for '_AccessToken' illegally returned null", result);
        Assert.assertEquals("Find entries method for '_AccessToken' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void _AccessTokenIntegrationTest.testFlush() {
        _AccessToken obj = dod.getRandom_AccessToken();
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to provide an identifier", id);
        obj = _AccessToken.find_AccessToken(id);
        Assert.assertNotNull("Find method for '_AccessToken' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modify_AccessToken(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for '_AccessToken' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void _AccessTokenIntegrationTest.testMergeUpdate() {
        _AccessToken obj = dod.getRandom_AccessToken();
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to provide an identifier", id);
        obj = _AccessToken.find_AccessToken(id);
        boolean modified =  dod.modify_AccessToken(obj);
        Integer currentVersion = obj.getVersion();
        _AccessToken merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for '_AccessToken' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void _AccessTokenIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to initialize correctly", dod.getRandom_AccessToken());
        _AccessToken obj = dod.getNewTransient_AccessToken(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected '_AccessToken' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected '_AccessToken' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void _AccessTokenIntegrationTest.testRemove() {
        _AccessToken obj = dod.getRandom_AccessToken();
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for '_AccessToken' failed to provide an identifier", id);
        obj = _AccessToken.find_AccessToken(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove '_AccessToken' with identifier '" + id + "'", _AccessToken.find_AccessToken(id));
    }
    
}
