package jEdboGuides;
 
import jEdboGuides.GuidesServlet;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
 
@WebListener
public class SessionListener implements HttpSessionListener {
 
    @Override
    public void sessionCreated(HttpSessionEvent sessionEvent) {
        String sess = sessionEvent.getSession().getId();
        GuidesServlet.jGuids.put(sess,"");
        System.out.println("Session Created:: ID="+sess
                +" (now count of connections = "+GuidesServlet.jGuids.size()+")");
    }
 
    @Override
    public void sessionDestroyed(HttpSessionEvent sessionEvent) {
        String sess = sessionEvent.getSession().getId();
        String jE = GuidesServlet.jGuids.get(sess);
        GuidesServlet.jGuids.remove(sess);
        System.out.println("Session Destoyed:: ID="+sess
                +" (now count of connections = "+GuidesServlet.jGuids.size()+")");
        
    }
     
}