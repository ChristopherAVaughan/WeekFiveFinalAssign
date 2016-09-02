package com.ghostlyservlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ghosts.DAO;
import com.ghosts.Locations;

/**
 * Servlet implementation class addToDB
 */
@WebServlet("/addToDB")
public class addToDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToDB() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Locations locationToadd = new Locations();

		locationToadd.setNameOfLocation(request.getParameter("name_of_location"));
		locationToadd.setYearVisited(Integer.parseInt(request.getParameter("year_visited")));
		locationToadd.setCityName(request.getParameter("city"));
		locationToadd.setStateCountry(request.getParameter("state_or_country"));
		locationToadd.setBriefDesExp(request.getParameter("description_of_experience"));
		
		DAO.writeToDatabase(locationToadd);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
;