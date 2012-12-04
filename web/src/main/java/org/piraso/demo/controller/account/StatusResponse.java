package org.piraso.demo.controller.account;

public enum StatusResponse {

    SUCCESS, FAILED;

    public String getStatus() {
        return name();
    }
}
