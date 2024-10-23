package basic;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(value="/greeting" , loadOnStartup =30)
public class Greeting extends HttpServlet {
    
	//생성자에서 내부적으로 무조건 init 호출
    public Greeting() {
    	System.out.println("Greeting Constructor 수행");
    }

    @Override
    public void init() throws ServletException {
    	System.out.println("Greeting.init() 수행");

    }
    
    // service 는 요청 분석 하여 GET,POST 요청에대한 메서드 호출
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("Greeting.service() 수행");
		response.setContentType("text/html;charset=UTF-8"); // HTML 랜더링 클라이언트 에 전달...
		PrintWriter out  =response.getWriter();// 화면 출력하는데 랜더링하는...
		out.println("<html>");
		out.println("<body><h1>Greeting.service() 수행?</h1></body></html>");
		out.close();
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Greeting.doGet() 수행");
		response.setContentType("text/html;charset=UTF-8"); // HTML 랜더링 클라이언트 에 전달...
		PrintWriter out  =response.getWriter();// 화면 출력하는데 랜더링하는...
		out.println("<html>");
		out.println("<body><h1>Greeting.doGet() 수행?</h1></body></html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Greeting.doPost() 수행");
		response.setContentType("text/html;charset=UTF-8"); // HTML 랜더링 클라이언트 에 전달...
		PrintWriter out  =response.getWriter();// 화면 출력하는데 랜더링하는...
		out.println("<html>");
		out.println("<body><h1>Greeting.doPost() 수행?</h1></body></html>");
		out.close();
	}

}
