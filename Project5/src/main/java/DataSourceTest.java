import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

@ContextConfiguration(locations = "classpath:dispatcher-servlet.xml")
public class DataSourceTest {
    @Autowired
    private DataSource ds;

//    @Test
    public void testConnection(){
        try{
            Connection con = ds.getConnection();
            System.out.println("DB연결");
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
