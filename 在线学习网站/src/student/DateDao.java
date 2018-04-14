package student;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  
  
public class DateDao  
{  
  
      
    public Connection con = null;//��������  
    public Statement st = null;//����statement  
    public ResultSet result = null;//��������   
    public static String driver;//��������     
    public static String url;//����URL     
    public static String user;//�����û���     
    public static String password;//��������       
    
    //���������ݿ����ӵĺ���    
        public Connection getConn(){    
            try {   
                  
                driver="com.mysql.jdbc.Driver";  
                url="jdbc:mysql://localhost:3306/DB";
                user="root";  
                password="19970303";
                  
                    Class.forName(driver);  
                     
                con = DriverManager.getConnection(url,user,password);//��ȡ���ݿ�����  
                System.out.println("-------���ӳɹ�------");  
                }    
            catch (SQLException e)   
            {  
                e.printStackTrace();  
            }   
            catch (ClassNotFoundException e)   
            {     
                e.printStackTrace();  
            }   
            return this.con;     
        }     
          
          
    public DateDao()  
    {  
  
        this.con=this.getConn();  
        //���캯����Ĭ�ϼӲ������ļ�Ϊjdbc.driver  
    }  
      
      
   
     // ִ�����ݿ��ѯ�����ز�ѯ���  
     public  ResultSet query(String sql)  
     {  
         this.con=this.getConn();  
         try    {  
                st = con.createStatement();//��ȡStatement  
                result = st.executeQuery(sql);//ִ�в�ѯ�����ؽ����                
                 } catch (Exception e)  
                     {  
                e.printStackTrace();  
                     }  
        return result;  
     }  
       
       
     //ִ�����ݿ����    
        public void update(String sql)  
        {    
            this.con=this.getConn();  
         try    {     
                st = con.createStatement();//��ȡStatement  
                st.executeUpdate(sql);//ִ�в�ѯ�����ؽ����                
                 } catch (Exception e)  
                     {  
                e.printStackTrace();  
                     }  
        }    
       
  
          
      //�ر����ݿ�����    
        public void close(){    
            try{    
                if (result != null)result.close();    
                if (st != null)st.close();     
                if (con != null)con.close();    
                System.out.println("-------���ӶϿ�------");
            }catch(Exception ex){    
                ex.printStackTrace();    
            }           
        }   
      
      
}  