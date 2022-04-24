/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package roseindia.net;

import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IsoInsert {

    public static int insert(String institute, String program1, String program2, String program3, String program4, int months, String years, int g2, int g3, int g4, int g5, int g6, int g7, int bal1, int s2, int s3, int s4, int s5, int s6, int s7, int bal2, int t2, int t3, int t4, int t5, int t6, int t7, int bal3, int w2, int w3, int w4, int w5, int w6, int w7, int bal4) {
        int r = 0;
        try {

            java.sql.Connection con = ConnectionManager.getConnectionDirectForMySQL();
            ResultSet resultSanction = null;

            int gensanction = 0;
            int scspsanction = 0;
            int tspsanction = 0;
            int womensanction = 0;


            Statement stmt1 = (Statement) con.createStatement();
            String sanctioned = "select general,scsp,tsp from ISO_TARGET where years='" + years + "' and institute='" + institute + "';";
            resultSanction = stmt1.executeQuery(sanctioned);

            if (resultSanction.next()) {

                resultSanction.beforeFirst();
                while (resultSanction.next()) {

                    gensanction = Integer.parseInt(resultSanction.getString("general"));
                    scspsanction = Integer.parseInt(resultSanction.getString("scsp"));
                    tspsanction = Integer.parseInt(resultSanction.getString("tsp"));

                }
            }

            Statement stmt = (Statement) con.createStatement();
            System.out.println("connection" + con);
            try {
                String query1 = "INSERT INTO ISO_DATA1(institute_name,name_program,years,months,c2,c3,c4,c5,c6,c7,bal,sanctioned)VALUES('" + institute + "','" + program1 + "','" + years + "'," + months + "," + g2 + "," + g3 + "," + g4 + "," + g5 + "," + g6 + "," + g7 + "," + bal1 + "," + gensanction + ")";
                stmt.addBatch(query1);

                String query2 = "INSERT INTO ISO_DATA1(institute_name,name_program,years,months,c2,c3,c4,c5,c6,c7,bal,sanctioned)VALUES('" + institute + "','" + program2 + "','" + years + "'," + months + "," + s2 + "," + s3 + "," + s4 + "," + s5 + "," + s6 + "," + s7 + "," + bal2 + "," + scspsanction + ")";

                stmt.addBatch(query2);

                String query3 = "INSERT INTO ISO_DATA1(institute_name,name_program,years,months,c2,c3,c4,c5,c6,c7,bal,sanctioned)VALUES('" + institute + "','" + program3 + "','" + years + "'," + months + "," + t2 + "," + t3 + "," + t4 + "," + t5 + "," + t6 + "," + t7 + "," + bal3 + "," + tspsanction + ")";

                stmt.addBatch(query3);

                String query4 = "INSERT INTO ISO_DATA1(institute_name,name_program,years,months,c2,c3,c4,c5,c6,c7,bal,sanctioned)VALUES('" + institute + "','" + program4 + "','" + years + "'," + months + "," + w2 + "," + w3 + "," + w4 + "," + w5 + "," + w6 + "," + w7 + "," + bal4 + "," + womensanction + ")";

                stmt.addBatch(query4);

                int re[] = stmt.executeBatch();
                System.out.println("Inserting Data Successfully!");
                con.commit();
                con.close();
                if (re[0] > 0) {
                    r = 2;
                    System.out.println("Result Set have record");

                } else {
                    System.out.println(" Result Set have not record");

                }

            } catch (SQLException s) {
                System.out.println("SQL statement is not executed!" + s);

            }
        } catch (Exception e) {
            System.out.println("following error durring the connection to database" + e);
        }
        return r;
    }

    public static int update(String institute, String program1, String program2, String program3, String program4, int months, String years, int g2, int g3, int g4, int g5, int g6, int g7, int bal1, int s2, int s3, int s4, int s5, int s6, int s7, int bal2, int t2, int t3, int t4, int t5, int t6, int t7, int bal3, int w2, int w3, int w4, int w5, int w6, int w7) {
        int r = 0;

        try {

            java.sql.Connection con = ConnectionManager.getConnectionDirectForMySQL();

            try {
                Statement stmt1 = (Statement) con.createStatement();
                String query1 = "UPDATE ISO_DATA1 set c2=" + g2 + ",c3=" + g3 + ",c4=" + g4 + ",c5=" + g5 + ",c6=" + g6 + ",c7=" + g7 + ",bal=" + bal1 + " where institute_name='" + institute + "'and name_program='" + program1 + "' and months=" + months + " and years='" + years + "' ";
                stmt1.addBatch(query1);
                String query2 = "UPDATE ISO_DATA1 set c2=" + s2 + ",c3=" + s3 + ",c4=" + s4 + ",c5=" + s5 + ",c6=" + s6 + ",c7=" + s7 + ",bal=" + bal2 + " where institute_name='" + institute + "'and name_program='" + program2 + "' and months=" + months + " and years='" + years + "' ";
                stmt1.addBatch(query2);
                String query3 = "UPDATE ISO_DATA1 set c2=" + t2 + ",c3=" + t3 + ",c4=" + t4 + ",c5=" + t5 + ",c6=" + t6 + ",c7=" + t7 + ",bal=" + bal3 + " where institute_name='" + institute + "'and name_program='" + program3 + "' and months=" + months + " and years='" + years + "' ";
                stmt1.addBatch(query3);
                String query4 = "UPDATE ISO_DATA1 set c2=" + w2 + ",c3=" + w3 + ",c4=" + w4 + ",c5=" + w5 + ",c6=" + w6 + ",c7=" + w7 + " where institute_name='" + institute + "'and name_program='" + program4 + "' and months=" + months + " and years='" + years + "' ";
                stmt1.addBatch(query4);
                int re[] = stmt1.executeBatch();
                System.out.println("Inserting Data Successfully!");
                con.commit();
                con.close();
                if (re[0] > 0) {
                    r = 3;
                    System.out.println("Result Set have record");
                    con.commit();
                    con.close();
                } else {
                    System.out.println(" Result Set have not record");

                }

            } catch (SQLException s) {
                System.out.println("SQL statement is not executed! : " + s);

            }
        } catch (Exception e) {
            System.out.println("Follwing error occurs durring connection creation");

        }
        return r;
    }
}
