package jEdboPerson;
 
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
 
@WebListener
public class SessionListener implements HttpSessionListener {
 
    @Override
    public void sessionCreated(HttpSessionEvent sessionEvent) {
        String sess = sessionEvent.getSession().getId();
        PersonServlet.jGuids.put(sess,"");
        System.out.println("Session Created:: ID="+sess
                +" (now count of connections = "+PersonServlet.jGuids.size()+")");
    }
 
    @Override
    public void sessionDestroyed(HttpSessionEvent sessionEvent) {
        String sess = sessionEvent.getSession().getId();
        String jE = PersonServlet.jGuids.get(sess);
        PersonServlet.jGuids.remove(sess);
        System.out.println("Session Destoyed:: ID="+sess
                +" (now count of connections = "+PersonServlet.jGuids.size()+")");
        
    }
     
}