package report;

import db.DbUtil;

import java.sql.*;
import java.util.ArrayList;

public class ReportDAO {
    public Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public int insertWorkOut(ReportVO reportVO) throws SQLException {
        try {
            con = DbUtil.getCon();
            String sql = "INSERT INTO Report(uId, wSub, wSet, wRm, wWeights, wUnit, wDate) values (?,?,?,?,?,?,curdate())";
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setLong(1,reportVO.getuId());
            ps.setString(2, reportVO.getWSub());
            ps.setInt(3, reportVO.getWSet());
            ps.setInt(4, reportVO.getWRm());
            ps.setInt(5, reportVO.getwWeights());
            ps.setString(6, reportVO.getWUnit());
            return ps.executeUpdate();

        } finally {
            close();
        }
    }
    public ArrayList<ReportVO> findList(Long uId, Long wId) throws SQLException{
        try{
            con = DbUtil.getCon();
            String sql = "SELECT * FROM REPORT WHERE Uid=?";
            ps = con.prepareStatement(sql);
            ps.setLong(1, uId);
            rs = ps.executeQuery();
            if(rs!=null){
                return makeList(rs);
            }else{
                return new ArrayList<>();
            }
        }finally {
            close();
        }
    }

    private ArrayList<ReportVO> makeList(ResultSet rs) throws SQLException{
        ArrayList<ReportVO> all = new ArrayList<>();

        while(rs.next()){
            Long wId = rs.getLong("wId");
            Long uId = rs.getLong("uId");
            String wSub = rs.getString("wSub");
            int wRm = rs.getInt("wRm");
            int wSet = rs.getInt("wSet");
            int wWeights = rs.getInt("wWeights");
            String wUnit = rs.getString("wUnit");
            Date wDate = rs.getDate("wDate");

            ReportVO record = new ReportVO(wId, uId, wSub, wSet, wRm, wWeights, wUnit, wDate);
            all.add(record);
        }
        return all;
    }

    public int deleteR(Long wId) throws SQLException {
        try {
            con = DbUtil.getCon();
            String sql = "DELETE FROM REPORT WHERE wid=?";
            ps = con.prepareStatement(sql);
            ps.setLong(1, wId);
            int n =  ps.executeUpdate();
            return n;
        } finally {
            close();
        }
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
