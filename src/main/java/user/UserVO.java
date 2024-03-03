package user;
//TODO: 유저 객체 생성

import java.sql.Date;
/**
 *  유저 객체 생성
 *  작성자: 오현암
 *  작성일: 2024/02/23
 */
public class UserVO {
    private Long uId;
    private String userEmail; //유저 이메일
    private String userPassword1;//유저 비밀번호
    private String userPassword2;
    private String userName;
    private int userAge;
    private Date regDate;

    public UserVO(){
        super();
    }

    public UserVO(Long uId,
                  String userEmail,
                  String userPassword1,
                  String userPassword2,
                  String userName,
                  int userAge,
                  Date regDate){
        this.uId = uId;
        this.userEmail = userEmail;
        this.userPassword1 = userPassword1;
        this.userPassword2 = userPassword2;
        this.userName = userName;
        this.userAge = userAge;
        this.regDate = regDate;
    }

    public Long getuId() {
        return uId;
    }

    public void setuId(Long uId) {
        this.uId = uId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword1() {
        return userPassword1;
    }

    public void setUserPassword1(String userPassword1) {
        this.userPassword1 = userPassword1;
    }

    public String getUserPassword2() {
        return userPassword2;
    }

    public void setUserPassword2(String userPassword2) {
        this.userPassword2 = userPassword2;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserAge() {
        return userAge;
    }

    public void setUserAge(int userAge) {
        this.userAge = userAge;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    @Override
    public String toString() {
        return "UserVO{" +
                "uId=" + uId +
                ", userEmail='" + userEmail + '\'' +
                ", userPassword1='" + userPassword1 + '\'' +
                ", userPassword2='" + userPassword2 + '\'' +
                ", userName='" + userName + '\'' +
                ", userAge=" + userAge +
                ", regDate=" + regDate +
                '}';
    }
}
