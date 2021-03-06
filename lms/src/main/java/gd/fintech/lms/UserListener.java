package gd.fintech.lms;

import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import gd.fintech.lms.service.ConnectorService;
import gd.fintech.lms.vo.Account;


@WebListener
public class UserListener extends SpringBootServletInitializer implements HttpSessionAttributeListener {
	@Autowired ConnectorService connectorService;

	// aws에 배포를 위한 코드
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(UserListener.class); 
	}
	
	public ServletContext context;
	HashMap<String, Account> map = new HashMap<>();
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 세션에 값이 추가될때
    public void attributeAdded(HttpSessionBindingEvent se)  { 
         context = se.getSession().getServletContext(); // 톰캣 전역 변수

         if(se.getName() == "loginId") {
	         String sessionName = (String)se.getName();		// 추가된 세션의 이름
	         String sessionValue = (String)se.getValue();	// 추가된 세션의 값
	         
	         // 해당 계정이 로그인 되어있는 개수
	         int sessionCount = 0;	        
	         if(context.getAttribute(sessionValue) != null) {
	        	 sessionCount = (int)context.getAttribute(sessionValue);
	         }
	         // map = (HashMap<String, Account>)context.getAttribute("connector");
	         
	         // 세션에서 가져온 loginId 값으로 해당 계정의 이름과 이미지 uuid를 가져옴
	         Account a = connectorService.selectAccountNameAndImage(sessionValue);	

        	 // 관리자의 아이디는 0으로 받아옴
	         // 관리자는 접속자 현황에 표시 안되게 함
        	 if(a.getAccountId().equals("0")) {
        		 return;
        	 }
        	 
	         // 사용자의 정보를 map에 추가
	         map.put(sessionValue, a);
	         
	    	 // 전역 변수에 map을 넣어줌
	         context.setAttribute("connector", map);
	         // 로그인 횟수를 추가함
	         context.setAttribute(sessionValue, sessionCount + 1);
	
	    	 logger.trace("Session Added : " + sessionName + " : " + sessionValue + "-" + context.getAttribute(sessionValue));
         }
         
    }
    
    // 세션 삭제시
    public void attributeRemoved(HttpSessionBindingEvent se)  {  
        if(se.getName() == "loginId" ) {    
        	String sessionValue = (String)se.getValue();	// 삭제된 세션의 값
	        // 해당 계정의 로그인되어있는 개수
	        int sessionCount = 0;	     
	        if(context.getAttribute(sessionValue) != null) {
	        	sessionCount = (int)context.getAttribute(sessionValue);
	        }
	        // 로그인 횟수를 차감함
	        context.setAttribute(sessionValue, sessionCount - 1);
	        
	        // 해당 계정이 모두 로그아웃 되면 - 로그아웃 처리
			if((int)context.getAttribute(sessionValue) < 1) {
				map.remove(sessionValue);		// 맵에서 해당 사용자를 삭제함
			}
			logger.trace("Session Removed : " + sessionValue + " 로그아웃 : " + context.getAttribute(sessionValue));
        }
    }

    public void attributeReplaced(HttpSessionBindingEvent se)  { 
    }
	
}
