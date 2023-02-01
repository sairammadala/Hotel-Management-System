import java.sql.*;
import java.util.*;
import java.time.LocalDate;

public class HOTEL{

    static final String Database = "hotel_reservationdb";
    static final String URL = String.format("jdbc:mysql://localhost/%s?useSSL=false",Database);
    static final String USER = "root";
    static final String PASS = "toor";

    static Connection conn = null;
    static Statement stmt = null;
    static Scanner input = new Scanner(System.in);
    static ArrayList<Integer> pending_reservations = new ArrayList<Integer>();

    public static void main(String[] args)
    {
    
        try{
            conn = DriverManager.getConnection(URL, USER, PASS);
            stmt = conn.createStatement();
            System.out.println("Connection established");
        }
        catch(Exception e){
            e.printStackTrace();
        }
        System.out.println("\n\t\t\t\t\t\tWELCOME TO HOTEL RESERVATION SYSTEM DATABASE!\n");
        boolean running = true;
        while(running){
            user_dashboard();
            System.out.print("Choose an option:");
            int n = input.nextInt();
            switch(n)
            {
                case 0:
                    System.out.println("\nYou have chosen to exit the program.\n");
                    running = false;
                    break;
                case 1:
                    customer(input);
                    break;
                case 2:
                    receptionist(input);
                    break;
            }
        }
    }

    public static void user_dashboard()
    {
        System.out.println("User Dashboard:\n");
        System.out.println("Please choose which user you are:");
        System.out.println("1-Customer");
        System.out.println("2-Receptionist");
        System.out.println("0-Exit");
    }

    public static void customer(Scanner input)
    {
        boolean running = true;
        while(running)
        {
            System.out.println("Hello Customer!\n");
            System.out.println("Choose an option to perform:");
            System.out.println("1-Book a room");
            System.out.println("2-Cancel the reservation");
            System.out.println("0-Logout");
            System.out.print("Choose an option:");
            int inp = input.nextInt();
            int id;
            String name,phone_number;
            switch(inp)
            {
                case 0:
                    System.out.println("You have succesfully Logged out!!");
                    running = false;
                    break;
                case 1:
                    System.out.println("You have selected to book a room!");
                    System.out.print("Please Enter your name:");
                    name = input.next();
                    System.out.print("Please Enter your phone number:");
                    phone_number = input.next();
                    id = add_reservation(name,phone_number);
                    if(id!=-1)
                    {
                        System.out.println("Your reservation has been succesfully created!! You will be assigned a room soon.");
                        System.out.print("Your reservation id is ");
                        System.out.println(id);
                    }
                    break;
                case 2:

                    System.out.println("You have selected to cancel the reservation:");
                    System.out.print("Enter the id to be deleted:");
                    id = input.nextInt();
                    delete_reservation(id);
                    System.out.println("Your reservation is deleted");
                    break;
            }
        }
    }
    public static int add_reservation(String name, String phone_number)
    {
        String sql;
        try
        {
            sql = String.format("insert into customer(name, phone_number) values('%s', '%s')",name, phone_number);
            int i=stmt.executeUpdate(sql);
        }
        catch(Exception e){
            System.out.println("Not inserted");
            System.out.println(e);
            return 1;
        }
        try
        {
            sql = String.format("select id from customer where phone_number = %s", phone_number);
            ResultSet rs2;
            rs2 = stmt.executeQuery(sql);
            int id = -1;
            if(rs2.next())
            {
                id = rs2.getInt("id");
            }
            return id;
        }
        catch(Exception e){
            System.out.println("Not fetched");
            System.out.println(e);
            return 1;
        }
    }

    public static int delete_reservation(int id)
    {
        String sql;
        try
        {
            sql = String.format("delete from customer where id = %d;",id);   
            stmt.executeUpdate(sql);
            return 0;
        }
        catch(Exception e)
        {
            System.out.println(e);
            return 1;
        }
    } 

    public static void receptionist(Scanner input)
    {
        boolean running = true;
        while(running)
        {
            System.out.println("Hello Receptionist!\n");
            System.out.println("Choose an option to perform:");
            System.out.println("1-Assign Rooms to pending customers");
            System.out.println("2-Update Checkout Date of leaving Customers");
            System.out.println("3-Show the Customer database");
            System.out.println("4-Show the Customer details with id");
            System.out.println("5-Show the Customer details with phone number");
            System.out.println("6-Show the list of Unassigned rooms");
            System.out.println("7-Show the details of a room");
            System.out.println("0-Logout");
            System.out.print("Choose an option:");
            int inp = input.nextInt();
            int id,op,rno;
            String phno;
            switch(inp)
            {
                case 0:

                    System.out.println("You have succesfully Logged out!!");
                    running = false;
                    break;
                case 1:

                    System.out.println("You have selected to Assign Rooms.");
                    assign_rooms(input);
                    break;
                case 2:

                    System.out.print("Enter the id of the customer checking out:");
                    id = input.nextInt();
                    op = update_checkout(id);
                    if(op == 0)
                    {
                        System.out.println("Checkout_date updated successfully!");
                    }
                    else if(op == -1)
                    {
                        System.out.println("Update Checkout failed!! The customer hasn't checked in yet!!");
                    }
                    break;
                case 3:

                    System.out.println("The Customers list is as follows.");
                    show_customers();
                    break;
                case 4:

                    System.out.print("Please enter the id:");
                    id = input.nextInt();
                    get_cust_by_id(id);
                    break;
                case 5:

                    System.out.print("Please enter the phone_number:");
                    phno = input.next();
                    get_cust_by_phno(phno);
                    break;
                case 6:

                    System.out.println("You have selected to show list of unassigned rooms");
                    unassigned_rooms();
                    break;
                case 7:

                    System.out.print("Enter the room number : ");
                    rno = input.nextInt();
                    get_room_details(rno);
                    break;
            }
        }
    }

    public static int get_room_details(int rno)
    {
        String sql;
        try
        {
            sql = String.format("select * from room where room_number = %d", rno);
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                System.out.println("Room Number : " + rs.getInt("room_number"));
                System.out.println("Room Type : " + rs.getInt("type"));
                System.out.println("Assigned to customer with id : " + rs.getInt("assigned"));
                System.out.println("Room Assigned Status : " + rs.getBoolean("room_assigned_status"));
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
            }
            return 0;
        }
        catch(Exception e){
            System.out.println(e);
            return 1;
        }
    }

    public static int get_cust_by_id(int id)
    {
        String sql;
        try
        {
            sql = String.format("select * from customer where id = %d", id);
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                System.out.println("id : " + rs.getInt("id"));
                System.out.println("Name : " + rs.getString("name"));
                System.out.println("Phone Number : " + rs.getString("phone_number"));
                System.out.println("checkin_date : " + rs.getString("checkin_date"));
                System.out.println("checkout_date : " + rs.getString("checkout_date"));
                System.out.println("Room Number : " + rs.getInt("room_number"));
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
            }
            return 0;
        }
        catch(Exception e){
            System.out.println(e);
            return 1;
        }   
    }

    public static int get_cust_by_phno(String phno)
    {
        String sql;
        try
        {
            sql = String.format("select * from customer where phone_number = '%s'", phno);
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                System.out.println("id : " + rs.getInt("id"));
                System.out.println("Name : " + rs.getString("name"));
                System.out.println("Phone Number : " + rs.getString("phone_number"));
                System.out.println("checkin_date : " + rs.getString("checkin_date"));
                System.out.println("checkout_date : " + rs.getString("checkout_date"));
                System.out.println("Room Number : " + rs.getInt("room_number"));
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
            }
            return 0;
        }
        catch(Exception e){
            System.out.println(e);
            return 1;
        }   
    }

    public static int unassigned_rooms()
    {
        String sql;
        try
        {
            sql = "select room_number from room where room_assigned_status=0;";
            ResultSet rs = stmt.executeQuery(sql);
            System.out.println("");
            System.out.println("The room numbers which are vacant are");
            while(rs.next())
            {
                System.out.println(rs.getInt("room_number"));
            }
            System.out.println("No more results to fetch!");
            rs.close();
            return 0;
        }
        catch(Exception e)
        {
            System.out.println(e);
            return 1;
        }
    }

    public static int show_customers()
    {
        String sql;
        try
        {
            sql = "select * from customer;";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                System.out.println("id : " + rs.getInt("id"));
                System.out.println("Name : " + rs.getString("name"));
                System.out.println("Phone Number : " + rs.getString("phone_number"));
                System.out.println("checkin_date : " + rs.getString("checkin_date"));
                System.out.println("checkout_date : " + rs.getString("checkout_date"));
                System.out.println("Room Number : " + rs.getInt("room_number"));
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
            }
            return 1;
        }
        catch(Exception e){
            System.out.println(e);
            return 1;
        } 
    }

    

    public static int assign_rooms(Scanner input)
    {
        ArrayList<Integer> rooms = new ArrayList<Integer>();
        String sql;
        int room_no;
        try
        {
            sql = "select room_number from room where room_assigned_status=0;";
            ResultSet rs = stmt.executeQuery(sql);
            System.out.println("");
            System.out.println("The room numbers which are vacant are");
            while(rs.next())
            {
                room_no = rs.getInt("room_number");
                System.out.println(room_no);
                rooms.add(room_no);
            }
            System.out.println("No more results to fetch!");
            rs.close();
        }
        catch(Exception e)
        {
            System.out.println(e);
            return 1;
        }
        try
        {
            int id;
            sql = "select id from customer where room_number is NULL;";
            ResultSet rs = stmt.executeQuery(sql);
            System.out.println("");
            System.out.println("The customer ids for whom rooms are to be assigned are");
            while(rs.next())
            {
                id = rs.getInt("id");
                System.out.println(id);
                pending_reservations.add(id);
            }
            System.out.println("No more results to fetch!");
            rs.close();
            int r;

            for(int i=0;i<pending_reservations.size();i++)
            {
                int pid = pending_reservations.get(i);
                System.out.print("Assign a room for " + pid + " : ");
                r = input.nextInt();
                if(rooms.contains(r))
                {
                    try
                    {
                        LocalDate checkin_date = LocalDate.now();
                        sql = String.format("UPDATE customer SET room_number = %d, checkin_date = '%s' WHERE id = %d",r,checkin_date,pid);
                        stmt.executeUpdate(sql);
                    }
                    catch(Exception e)
                    {
                        System.out.println(e);
                        return 1;
                    }
                    try
                    {
                        sql = String.format("UPDATE room SET room_assigned_status = 1, assigned = %d WHERE room_number = %d",pid,r);
                        stmt.executeUpdate(sql);
                        int l = pending_reservations.lastIndexOf(pid);
                        pending_reservations.set(l,-1);
                        int lr = rooms.lastIndexOf(r);
                        rooms.remove(lr);
                        System.out.println("");
                    }
                    catch(Exception e)
                    {
                        System.out.println(e);
                        return 1;
                    }
                }
                else
                {
                    System.out.println("Assignment failed!!! Room already Assigned or doesn't exist");
                }
                
            }
            for(int i=0;i<pending_reservations.size();i++)
            {
                if(pending_reservations.get(i) == -1)
                {
                    pending_reservations.remove(i);
                }
            }
            for(int i=0;i<rooms.size();i++)
            {
                rooms.remove(i);
            }
            return 1;
        }
        catch(Exception e)
        {
            System.out.println(e);
            return 1;
        }
    }

    public static int update_checkout(int id)
    {
        String sql;
        int rn;
        try
        {
            sql = String.format("select room_number from customer where id = %d",id);
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                rn = rs.getInt("room_number");
                // System.out.println(rn);
                if(rn == 0)
                {
                    // System.out.println(rn);
                    return -1;
                }
            }
            
        }
        catch(Exception e)
        {
            System.out.println(e);
            return 1;
        }
        LocalDate checkout_date = LocalDate.now();
        try
        {
            sql = String.format("update customer set checkout_date='%s' where id = %d;", checkout_date, id);   
            stmt.executeUpdate(sql);
        }
        catch(Exception e)
        {
            System.out.println(e);
            return 1;
        }
        try
        {
            sql = String.format("update room set room_assigned_status = 0, assigned =  NULL where room_number = (select room_number from customer where id = %d);",id);
            stmt.executeUpdate(sql);
        }
        catch(Exception e)
        {
            System.out.println(e);
            return 1;
        }
        try
        {
            sql = String.format("select * from customer where id = %d",id);
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                System.out.println("id : " + rs.getInt("id"));
                System.out.println("Name : " + rs.getString("name"));
                System.out.println("Phone Number : " + rs.getString("phone_number"));
                System.out.println("checkin_date : " + rs.getString("checkin_date"));
                System.out.println("checkout_date : " + rs.getString("checkout_date"));
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            }
            return 0;
        }
        catch(Exception e)
        {
            System.out.println(e);
            return 1;
        }
    }
    
}

