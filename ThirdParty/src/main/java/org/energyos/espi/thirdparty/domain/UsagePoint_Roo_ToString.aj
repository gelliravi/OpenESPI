// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.thirdparty.domain;

import java.lang.String;

privileged aspect UsagePoint_Roo_ToString {
    
    public String UsagePoint.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Address: ").append(getAddress()).append(", ");
        sb.append("City: ").append(getCity()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("RetailCustomer: ").append(getRetailCustomer()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}