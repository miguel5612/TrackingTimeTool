using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;


/// <summary>
/// Summary description for funktions
/// </summary>
public class funktions
{
    public funktions()
    {
        //
        // TODO: Add constructor logic here
        //

    }
    public static object fetchScalar(string query)
    {
        SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TTTConectionString"].ConnectionString);
        SqlCommand myCmd = new SqlCommand(query, myConn);
        myConn.Open();
        object scalar = myCmd.ExecuteScalar();
        myConn.Close();
        return scalar;
    }
    public static SqlDataReader fetchReader(string query)
    {
        SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TTTConectionString"].ConnectionString);
        SqlCommand myCmd = new SqlCommand(query, myConn);
        myConn.Open();
        return myCmd.ExecuteReader(CommandBehavior.CloseConnection);
    }

    public static DataSet fetchData(string query)
    {
        SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TTTConectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter(query, myConn);
        DataSet myData = new DataSet();
        myAdapter.Fill(myData);
        return myData;
    }

    public static object fetchScalar(string query, int timeToWait)
    {
        SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TTTConectionString"].ConnectionString);
        SqlCommand myCmd = new SqlCommand(query, myConn);
        myConn.Open();
        myCmd.CommandTimeout = timeToWait;
        object scalar = myCmd.ExecuteScalar();
        myConn.Close();
        return scalar;
    }

}