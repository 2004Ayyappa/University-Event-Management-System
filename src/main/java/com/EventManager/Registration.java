package com.EventManager;

public class Registration {
    private String eventName;
    private String attendance;

    // Getters and Setters
    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getAttendance() {
        return attendance;
    }

    public void setAttendance(String attendance) {
        this.attendance = attendance;
    }

    @Override
    public String toString() {
        return "Registration{" +
                "eventName='" + eventName + '\'' +
                ", attendance='" + attendance + '\'' +
                '}';
    }
}
