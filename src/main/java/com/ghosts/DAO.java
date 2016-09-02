package com.ghosts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

public class DAO {

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost:3306/?user=root&autoReconnect=true&useSSL=false";
	static final String USER = "root";
	static final String PASSWORD = "sesame";

	static Connection CONN = null;
	static Statement STMT = null;
	static PreparedStatement PREP_STMT = null;
	static ResultSet RES_SET = null;

	public static final ArrayList<Locations> hauntedPlaces = new ArrayList<>();

	public static void connToDB() {

		try {

			Class.forName(JDBC_DRIVER);

			System.out.println("Trying to connect to the DB...");
			CONN = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			System.out.println("Connected to DB.");

		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("Connection failed");
			e.printStackTrace();
		}

	}

	public static void readFromDB() {

		connToDB();

		try {

			STMT = CONN.createStatement();
			RES_SET = STMT.executeQuery("SELECT * FROM haunteddestinations.locations;");

			while (RES_SET.next()) {

				Locations locationsInDB = new Locations();

				locationsInDB.setLocationID(RES_SET.getInt("id"));
				locationsInDB.setNameOfLocation(RES_SET.getString("name_of_location"));
				locationsInDB.setYearVisited(RES_SET.getInt("year_visited"));
				locationsInDB.setCityName(RES_SET.getString("city"));
				locationsInDB.setStateCountry(RES_SET.getString("state_or_country"));
				locationsInDB.setBriefDesExp(RES_SET.getString("description_of_experience"));

				hauntedPlaces.add(locationsInDB);

			}

			for (Locations locations : hauntedPlaces) {
				System.out.println(locations);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	} // read

	public static void writeToDatabase(Locations locations) {

		try {

			connToDB();

			PREP_STMT = CONN.prepareStatement(insertIntoTable);

			PREP_STMT.setString(1, locations.getNameOfLocation());
			PREP_STMT.setInt(2, locations.getYearVisited());
			PREP_STMT.setString(3, locations.getCityName());
			PREP_STMT.setString(4, locations.getStateCountry());
			PREP_STMT.setString(5, locations.getBriefDesExp());

			System.out.println(PREP_STMT);

			PREP_STMT.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} // write

	public static void deleteFromDB() {

		Scanner sc = new Scanner(System.in);

		readFromDB();

		System.out.println("\nWhich location would you like to delete?" + "\nPlease enter an ID");
		int id = sc.nextInt();

		try {
			PREP_STMT = CONN.prepareStatement(delFromTable(id));

			PREP_STMT.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} // delete

	private static String insertIntoTable = "INSERT INTO `haunteddestinations`.`locations`"
			+ "(name_of_location, year_visited, city, state_or_country, description_of_experience)"
			+ " VALUES " + "(?, ?, ?, ?, ?)";

	private static String delFromTable(int id) {
		return "DELETE FROM `haunteddestinations`.`locations` WHERE ID = " + id + ";";
	}

	private static Locations aboutTheLocation() {

		Scanner sc = new Scanner(System.in);

		Locations locationToAdd = new Locations();

		System.out.println("What is name/location you has the supernatural experience?");
		locationToAdd.setNameOfLocation(sc.nextLine());

		System.out.println("In what year did you have this experience?");
		String yearOfExp = sc.nextLine();
		locationToAdd.setYearVisited(Integer.parseInt(yearOfExp));

		System.out.println("In what city did you have this experience?");
		locationToAdd.setCityName(sc.nextLine());

		System.out.println("In what state did this happen, enter in country if it occurred outside the USA?");
		locationToAdd.setStateCountry(sc.nextLine());

		System.out.println("Please briefly describe your encounter?");
		locationToAdd.setBriefDesExp(sc.nextLine());

		sc.close();
		return locationToAdd;
	}



} // class
