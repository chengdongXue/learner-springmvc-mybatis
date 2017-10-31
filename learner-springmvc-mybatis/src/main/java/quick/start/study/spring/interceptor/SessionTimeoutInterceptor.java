package quick.start.study.spring.interceptor;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SessionTimeoutInterceptor implements HandlerInterceptor {

    private int openingTime; // openingTime 属性指定上班时间  
    private int closingTime; // closingTime属性指定下班时间  
    private String outsideOfficeHoursPage;// outsideOfficeHoursPage属性指定错误提示页面的URL  
    private List<String> excludedUrls;// allow url

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception {
        System.out.println("intercepter coming...");
        Calendar cal = Calendar.getInstance();  
        int hour = cal.get(Calendar.HOUR_OF_DAY); // 获取当前时间  
        if (openingTime < hour && closingTime < hour) { // 判断当前是否处于工作时间段内   openingTime <= hour && hour < closingTime
            
            //不过滤的url处理
            String uri = request.getRequestURI();
            for (String url : excludedUrls) {
                if (uri.endsWith(url)) {
                    return true;
                }
            }
            
            HttpSession session = request.getSession();
            if (session.getAttribute("menuList") == null) {
                response.sendRedirect("/learner-springmvc-mybatis/init");
                return false;
            }else {
                return true;
            }
        }else{
            response.sendRedirect(outsideOfficeHoursPage); //返回提示页面
            return false;
        }
    }
    
    public void afterCompletion(HttpServletRequest arg0,HttpServletResponse arg1,
            Object arg2, Exception arg3)throws Exception {
        System.out.println("intercepter afterCompletion");  
    }

    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
            Object arg2, ModelAndView arg3) throws Exception {
        System.out.println("intercepter postHandle");  
    }

    /**
     * @return the openingTime
     */
    public int getOpeningTime() {
        return openingTime;
    }

    /**
     * @param openingTime the openingTime to set
     */
    public void setOpeningTime(int openingTime) {
        this.openingTime = openingTime;
    }

    /**
     * @return the closingTime
     */
    public int getClosingTime() {
        return closingTime;
    }

    /**
     * @param closingTime the closingTime to set
     */
    public void setClosingTime(int closingTime) {
        this.closingTime = closingTime;
    }

    /**
     * @return the outsideOfficeHoursPage
     */
    public String getOutsideOfficeHoursPage() {
        return outsideOfficeHoursPage;
    }

    /**
     * @param outsideOfficeHoursPage the outsideOfficeHoursPage to set
     */
    public void setOutsideOfficeHoursPage(String outsideOfficeHoursPage) {
        this.outsideOfficeHoursPage = outsideOfficeHoursPage;
    }
    
    public void setExcludedUrls(List<String> excludedUrls) {
        this.excludedUrls = excludedUrls;
    }
}
