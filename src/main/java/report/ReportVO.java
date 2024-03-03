package report;

import java.sql.Date;

public class ReportVO {
    private long wId;
    private long uId;
    private String wSub;
    private int wSet;
    private int wRm;
    private int wWeights;
    private String wUnit;
    private Date wDate;

    public ReportVO(){
        super();
    }
    public ReportVO(Long wId,
                    Long uId,
                    String wSub,
                    int wSet,
                    int wRm,
                    int wWeights,
                    String wUnit,
                    Date wDate){
        super();
        this.wId = wId;
        this.uId = uId;
        this.wSub =wSub;
        this.wSet =wSet;
        this.wRm = wRm;
        this.wWeights = wWeights;
        this.wUnit = wUnit;
        this.wDate = wDate;
    }



    public Long getWId() {
        return wId;
    }

    public void setWId(Long wId) {
        this.wId = wId;
    }

    public Long getuId() {
        return uId;
    }

    public void setuId(Long uId) {
        this.uId = uId;
    }

    public String getWSub() {
        return wSub;
    }

    public void setWSub(String wSub) {
        this.wSub = wSub;
    }

    public int getWSet() {
        return wSet;
    }

    public void setWSet(int wSet) {
        this.wSet = wSet;
    }

    public int getWRm() {
        return wRm;
    }

    public void setWRm(int wRm) {
        this.wRm = wRm;
    }

    public int getwWeights() {
        return wWeights;
    }

    public void setwWeights(int wWeights) {
        this.wWeights = wWeights;
    }

    public String getWUnit() {
        return wUnit;
    }

    public void setWUnit(String wUnit) {
        this.wUnit = wUnit;
    }

    public Date getwDate() {
        return wDate;
    }

    public void setwDate(Date wDate) {
        this.wDate = wDate;
    }

    @Override
    public String toString() {
        return "ReportVO{" +
                "wId=" + wId +
                ", uId=" + uId +
                ", wSub='" + wSub + '\'' +
                ", wSet=" + wSet +
                ", wRm=" + wRm +
                ", wWeights=" + wWeights +
                ", wUnit='" + wUnit + '\'' +
                ", wDate=" + wDate +
                '}';
    }
}