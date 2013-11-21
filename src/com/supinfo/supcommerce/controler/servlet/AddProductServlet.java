package com.supinfo.supcommerce.controler.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.supinfo.sun.supcommerce.bo.SupProduct;
import com.supinfo.sun.supcommerce.doa.SupProductDao;

/**
 * Servlet implementation class AddProductServlet
 * 
 * @author Elka
 * @version 3.1
 * @since SupCommerce 3.1
 */
@WebServlet(description = "Servlet To Add A Specific Product", urlPatterns = { "/addProduct" })
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String PARAM_NAME_POST = "product-name";
	private static final String PARAM_CONTENT_POST = "product-content";
	private static final String PARAM_PRICE_POST = "product-price";
	private static final String PARAM_ID_GET = "id";
	
	private static final String ATTRIBUTE_NAME_REQ = "name";
	private static final String ATTRIBUTE_CONTENT_REQ = "content";
	private static final String ATTRIBUTE_PRICE_REQ = "price";
	private static final String ATTRIBUTE_ERROR_NAME_REQ = "error-name";
	private static final String ATTRIBUTE_ERROR_CONTENT_REQ = "error-content";
	private static final String ATTRIBUTE_ERROR_PRICE_REQ = "error-price";
	
	private static final String SHOW_PRODUCT_SERVLET = "/showProduct";
	private static final String ADD_PRODUCT_VIEW = "/addProduct.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
    }

    /**
	 * Handles <code>POST</code> HTTP method
	 * 
	 * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nameError = "";
		String contentError = "";
		String priceError = "";
		
		// Retrieve POST parameters
		final Object name = request.getParameter(PARAM_NAME_POST);
		final Object content = request.getParameter(PARAM_CONTENT_POST);
		final Object price = request.getParameter(PARAM_PRICE_POST);
		
		// New empty product
		// final keyword is to protect the reference of new product (best practice)
		final SupProduct product = new SupProduct();
		
		// Check data integrity	(Never Trust User Input)
		/// - product name
		if(name != null && name instanceof String)
			if(name != "")		// cast potentiel à faire ???		
				product.setName((String) name);
			else
				nameError = "Empty flied !";
		else
			nameError = "Invalid name !";
		
		/// - product content
		if(content != null && content instanceof String)
			if(content != "")		// cast potentiel à faire ???
				product.setContent((String) content);
			else
				contentError = "Empty flied !";
		else
			contentError = "Invalid description !";
		
		/// - product price
		if(price != null && price instanceof String) {
			if(price != "") {		// cast potentiel à faire ???
				try {
					product.setPrice(Float.parseFloat((String) price)); 
				}
				catch (NullPointerException|NumberFormatException e) {
					priceError = "Invalid price !";
				}
			}
			else {
				priceError = "Empty flied !";
			}
		}
		else
			priceError = "Invalid price !";
		
		
		// Error
		if(nameError != "" || contentError != "" || priceError != "") {
			
			// First visit, forward to addProduct.jsp
			if(name == null && content == null && price == null) {
				request.getRequestDispatcher(ADD_PRODUCT_VIEW).forward(request, response);
			}			
			// Invalid form completion - Set request attributes and forward to addProduct.jsp
			else {
				// Save correct parameters and set errors
				if(nameError != "")
					request.setAttribute(ATTRIBUTE_ERROR_NAME_REQ, nameError);
				else
					request.setAttribute(ATTRIBUTE_NAME_REQ, name);
				
				if(contentError != "")
					request.setAttribute(ATTRIBUTE_ERROR_CONTENT_REQ, contentError);
				else
					request.setAttribute(ATTRIBUTE_CONTENT_REQ, content);
				
				if(priceError != "")
					request.setAttribute(ATTRIBUTE_ERROR_PRICE_REQ, priceError);
				else
					request.setAttribute(ATTRIBUTE_PRICE_REQ, price);
				
				// Forward
				request.getRequestDispatcher(ADD_PRODUCT_VIEW).forward(request, response);
			}
		}
		// Everithing is ok
		else {
			
			// Generate ID and add product in memory
			SupProductDao.addProduct(product);
			
			// Redirection to /showProduct?id=X
			response.sendRedirect(request.getServletContext().getContextPath() 
					+ SHOW_PRODUCT_SERVLET + "?" + PARAM_ID_GET + "=" + product.getId());
		}
		
	}

}
