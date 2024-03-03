package user;

import java.sql.*;
import java.util.ArrayList;

import db.DbUtil;

public class UserDAO {
    public Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    UserVO user;
    public int insertUser(UserVO user) throws SQLException{
        try {
            con = DbUtil.getCon();
            String sql = "INSERT INTO USER (userEmail, userPassword1, userPassword2, userName, userAge, regDate) values(?,?,?,?,?,NOW())";
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getUserEmail());
            ps.setString(2, user.getUserPassword1());
            ps.setString(3, user.getUserPassword2());
            ps.setString(4, user.getUserName());
            ps.setInt(5, user.getUserAge());
            return ps.executeUpdate();
        } finally {
            close();
        }
    }

    public boolean emailCheck(String userEmail){
        try {
            con = DbUtil.getCon();
            String sql = "SELECT * FROM USER WHERE userEmail = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, userEmail);
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        }catch (SQLException e){
            e.printStackTrace();
        } finally {
            close();
        }
        return false;
    }

    public UserVO findById(Long uId) throws SQLException{
        try{
            con = DbUtil.getCon();
            String sql = "SELECT * FROM USER WHERE uId = ?";
            ps = con.prepareStatement(sql);
            ps.setLong(1, uId);
            rs = ps.executeQuery();
            if(rs.next()){
                user = new UserVO();
                user.setuId(rs.getLong("uId"));
                user.setUserEmail(rs.getString("userEmail"));
                user.setUserPassword1(rs.getString("userPassword1"));
                user.setUserPassword2(rs.getString("userPassword2"));
                user.setUserName(rs.getString("userName"));
                user.setUserAge(rs.getInt("userAge"));
            }
        }finally {
            close();
        }
        return user;
    }
    public ArrayList<UserVO> findAll() throws SQLException{
        try{
            con = DbUtil.getCon();
            String sql = "SELECT * FROM user ORDER BY regDate desc ";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            return makeList(rs);
        }finally {
            close();
        }
    }

    public int login(String userEmail, String userPassword1) throws SQLException {
        try {
            con = DbUtil.getCon();
            String sql = "SELECT userPassword1 FROM user WHERE userEmail = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, userEmail);
            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(userPassword1)) {
                    return 0;
                } else {
                    if(!userPassword1.isEmpty()) return 1;
                }
            }
            if(!userEmail.isEmpty())return -1;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close();
        }
        return -2;
    }
    public long getUIdByEmailAndPassword(String userEmail, String userPassword1) throws SQLException {
        try {
            String sql = "SELECT uId,userPassword1 FROM USER WHERE userEmail = ?";
            con = DbUtil.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userEmail);
            rs = ps.executeQuery();
            if(rs.next()) {
                String storedPassword = rs.getString("userPassword1");
                if (storedPassword.equals(userPassword1)) {
                    return rs.getLong("uId");
                } else {
                   return -2;
                }
            }else{
                return -1;
            }
        } finally {
            close();
        }

    }


    public int updateMember(UserVO user) throws SQLException {
        try {
            con=DbUtil.getCon();
            String sql="UPDATE USER SET userEmail = ?, userPassword1=?, userPassword2=?, userName=?, userAge =? WHERE uId=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getUserEmail());
            ps.setString(2, user.getUserPassword1());
            ps.setString(3, user.getUserPassword2());
            ps.setString(4, user.getUserName());
            ps.setInt(5, user.getUserAge());
            ps.setLong(6, user.getuId());
            return ps.executeUpdate();
        }finally {
            close();
        }
    }//---------------------------------

    private ArrayList<UserVO> makeList(ResultSet rs) throws SQLException {
        ArrayList<UserVO> all = new ArrayList<>();

        while(rs.next()){
            Long uId = rs.getLong(1);
            String userEmail = rs.getString("userEmail");
            String userPassword1 = rs.getString("userPassword1");
            String userPassword2 = rs.getString("userPassword2");
            String userName = rs.getString("userName");
            int userAge = rs.getInt("userAge");
            Date regDate =rs.getDate("regDate");

            UserVO record = new UserVO(uId,userEmail, userPassword1, userPassword2, userName, userAge, regDate);
            all.add(record);
        }
        return all;
    }

    public void close(){
        try{
            if (rs!=null) rs.close();
            if (ps!=null) ps.close();
            if (con!=null) con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
