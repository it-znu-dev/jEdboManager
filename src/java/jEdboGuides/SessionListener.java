package jEdboGuides;
 
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
 
@WebListener
public class SessionListener implements HttpSessionListener {
 
    @Override
    public void sessionCreated(HttpSessionEvent sessionEvent) {
        String sess = sessionEvent.getSession().getId();
        System.out.println("Session Created:: ID="+sess);
    }
 
    @Override
    public void sessionDestroyed(HttpSessionEvent sessionEvent) {
        String sess = sessionEvent.getSession().getId();
        System.out.println("Session Destoyed:: ID="+sess);
        
    }
     
}