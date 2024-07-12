package com.EventManager;
public class Certificate {
    private int certificateId;
    private int userId;
    private int eventId;
    private String certificateType;
    private String certificatePath;
	private String eventName;

    // Constructor
    public Certificate() {}

    // Getters and Setters
    public int getCertificateId() {
        return certificateId;
    }

    public void setCertificateId(int certificateId) {
        this.certificateId = certificateId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getCertificateType() {
        return certificateType;
    }

    public void setCertificateType(String certificateType) {
        this.certificateType = certificateType;
    }

    public String getCertificatePath() {
        return certificatePath;
    }

    public void setCertificatePath(String certificatePath) {
        this.certificatePath = certificatePath;
    }

	public void setEventName(String eventName) {
		this.eventName=eventName;
		// TODO Auto-generated method stub
		
	}
}

