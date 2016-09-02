package com.ghosts;

public class Locations {

	private int locationID = 0;
	private String nameOfLocation = null;
	private int yearVisited = 0;
	private String cityName = null;
	private String stateCountry = null;
	private String briefDesExp = null;
	
	public Locations(int locationID, String nameOfLocation, int yearVisited, String cityName, String stateCountry,
			String briefDesExp) {
		super();
		this.locationID = locationID;
		this.nameOfLocation = nameOfLocation;
		this.yearVisited = yearVisited;
		this.cityName = cityName;
		this.stateCountry = stateCountry;
		this.briefDesExp = briefDesExp;
	}

	public Locations() {
		// TODO Auto-generated constructor stub
	}

	public int getLocationID() {
		return locationID;
	}

	public void setLocationID(int locationID) {
		this.locationID = locationID;
	}

	public String getNameOfLocation() {
		return nameOfLocation;
	}

	public void setNameOfLocation(String nameOfLocation) {
		this.nameOfLocation = nameOfLocation;
	}

	public int getYearVisited() {
		return yearVisited;
	}

	public void setYearVisited(int yearVisited) {
		this.yearVisited = yearVisited;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getStateCountry() {
		return stateCountry;
	}

	public void setStateCountry(String stateCountry) {
		this.stateCountry = stateCountry;
	}

	public String getBriefDesExp() {
		return briefDesExp;
	}

	public void setBriefDesExp(String briefDesExp) {
		this.briefDesExp = briefDesExp;
	}

	@Override
	public String toString() {
		return "Locations [locationID=" + locationID + ", nameOfLocation=" + nameOfLocation + ", yearVisited="
				+ yearVisited + ", cityName=" + cityName + ", stateCountry=" + stateCountry + ", briefDesExp="
				+ briefDesExp + "]";
	}
	
	
	
}
 