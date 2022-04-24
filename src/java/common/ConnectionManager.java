/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package common;


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
            String url = "jdbc:mysql://localhost:3306/mpr_dcmsme?useSSL=false";
            String driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String password = "220047";
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            conn.setAutoCommit(false);
        }
        catch(Exception ex)
        {
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
            String url = "jdbc:oracle:thin:@" + serverName + ":" + portNumber + ":" + sid;
            String username = "senet";
            String password = "senet";
            System.out.println(" url = " + url);
            connection = DriverManager.getConnection(url, username, password);
        }
        catch(ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch(SQLException e)
        {
            System.out.println(e.getErrorCode() + " = " + e.getMessage());
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

    public static void main(String args1[])
    {
    }

    private boolean closedHere;
     public static String instituteName(String Inst_Id)
     {
         String inst_name="";
         try
         {
             Connection con = getConnectionDirectForMySQL();
             Statement stmt = (Statement)con.createStatement();
             String strsql1="select * from tbl_di_institute where inst_id='"+Inst_Id+"'" ;
             ResultSet rs_instName=stmt.executeQuery(strsql1);
             if(rs_instName.next())
       {
   inst_name = rs_instName.getString("INST_NAME");
         }
         }
         catch(Exception e)
         {
            System.out.println("follwing error while fetching the institute name fom the database : "+e);
         }

         return  inst_name;
     }

      public static String cityName(String di)
     {
         String city1="";
         try
         {
             Connection con = getConnectionDirectForMySQL();
             Statement stmt = (Statement)con.createStatement();
             String strsql1="select * from checkDropdown where DI='"+di+"'" ;
             ResultSet rs=stmt.executeQuery(strsql1);
             if(rs.next())
       {
   city1 = rs.getString("city");
         }
         }
         catch(Exception e)
         {
            System.out.println("follwing error while fetching the institute name fom the database : "+e);
         }

         return  city1;
     }

     public static String instituteCity(String Inst_Id)
     {
         String inst_name="";
         try
         {
             Connection con = getConnectionDirectForMySQL();
             Statement stmt = (Statement)con.createStatement();
             String strsql1="select * from tbl_di_institute where inst_id='"+Inst_Id+"'" ;
             ResultSet rs_instName=stmt.executeQuery(strsql1);
             if(rs_instName.next())
       {
   inst_name = rs_instName.getString("INST_CITY");
         }
         }
         catch(Exception e)
         {
            System.out.println("follwing error while fetching the institute name fom the database : "+e);
         }

         return  inst_name;
     }
}
