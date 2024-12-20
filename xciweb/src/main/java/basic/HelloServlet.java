package basic;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/hello")  // 서블릿 동작 2. 어노테이션 붙이는 방법
public class HelloServlet extends HttpServlet { 
	public HelloServlet() {
		System.out.println("HelloServlet Constructor 수행");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); // HTML 랜더링 클라이언트 에 전달...
		PrintWriter out  =resp.getWriter();// 화면 출력하는데 랜더링하는...
		out.println("<html>");
		out.println("<body><h1>Hello Servlet 왜 서블릿이 뜰까?</h1></body></html>");
		out.close();
		
		
	}
}
