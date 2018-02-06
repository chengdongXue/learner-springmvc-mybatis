package quick.start.study.spring.interceptor;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CorsFilter implements Filter{
	
    public void init(FilterConfig filterConfig) throws ServletException {}

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
    	this.getAsHttpRequest(servletRequest);
        HttpServletResponse httpResponse=this.getAsHttpResponse(servletResponse);
        httpResponse.setHeader("Access-Control-Allow-Origin", "*");
        httpResponse.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE");
        httpResponse.setHeader("Access-Control-Max-Age", "3600");
        httpResponse.setHeader("Access-Control-Allow-Headers", "Content-Type, x-requested-with, authorization, ACCESS_TOKEN, TIME_OF_CALL");
        filterChain.doFilter(servletRequest, servletResponse);
    }
    
    private HttpServletResponse getAsHttpResponse(ServletResponse response)
    {
        if (!(response instanceof HttpServletResponse)) {
            throw new RuntimeException("Expecting an HTTP request");
        }
        return (HttpServletResponse) response;
    }

    private HttpServletRequest getAsHttpRequest(ServletRequest request)
    {
        if (!(request instanceof HttpServletRequest)) {
            throw new RuntimeException("Expecting an HTTP request");
        }
        return (HttpServletRequest) request;
    }

    public void destroy() {}
}
