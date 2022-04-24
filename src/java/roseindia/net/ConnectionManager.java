package roseindia.net;

import java.io.PrintStream;
import java.io.Serializable;
import java.sql.*;

public class ConnectionManager
    implements Serializable
{

    public ConnectionManager()
    {
        closedHere = false;
    }

    public Connection getConnection(Connection connection)
        throws Exception
    {
        if(connection == null || connection.isClosed())
        {
            connection = getConnectionDirect();
            closedHere = true;
        }
        return connection;
    }

    public void releaseConnection(Connection connection)
    {
        if(closedHere)
        {
            close(connection);
            closedHere = false;
        }
    }

    public static Connection getConnectionDirectForMySQL()
        throws Exception
    {
        Connection conn = null;
        try
        {
//            String url = "jdbc:mysql://10.25.140.121:3306/mpr_dcmsme?noAccessToProcedureBodies=true";
//            String driver = "com.mysql.jdbc.Driver";
//            String user = "mpr_dcmsme";
//            String password = "Q5#Y8rL^4J";
            String url = "jdbc:mysql://localhost:3306/mpr_dcmsme";
            String driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String password = "220047";
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            conn.setAutoCommit(false);
        }
        catch(Exception ex) { 
		System.out.println("Error in creating the connection with database"+ex);
		}
        return conn;
    }

    public static Connection getConnectionDirect()
    {
        Connection connection = null;
        try
        {
            String driverName = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driverName);
            String serverName = "10.2.0.17";
            String portNumber = "1521";
            String sid = "rcat";
            String url = (new StringBuilder()).append("jdbc:oracle:thin:@").append(serverName).append(":").append(portNumber).append(":").append(sid).toString();
            String username = "senet";
            String password = "senet";
            System.out.println((new StringBuilder()).append(" url = ").append(url).toString());
            connection = DriverManager.getConnection(url, username, password);
        }
        catch(ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch(SQLException e)
        {
            System.out.println((new StringBuilder()).append(e.getErrorCode()).append(" = ").append(e.getMessage()).toString());
            e.printStackTrace();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return connection;
    }

    public static void rollback(Connection conn)
        throws Exception
    {
        if(conn != null)
            conn.rollback();
    }

    public static void commit(Connection conn)
        throws Exception
    {
        if(conn != null)
            conn.commit();
    }

    public static void close(Connection conn)
    {
        try
        {
            if(conn != null && !conn.isClosed())
            {
                conn.close();
                conn = null;
            }
        }
        catch(SQLException sqlexception) { }
    }

    public static void close(PreparedStatement preparedStatement)
    {
        try
        {
            if(preparedStatement != null)
                preparedStatement.close();
        }
        catch(SQLException sqlexception) { }
    }

    public static void main(String args[])
    {
    }

    private boolean closedHere;
}