package com.temportal.model.dto;

import com.temportal.model.entity.EmployeeEntity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.sql.Date;
import java.util.Collection;

import lombok.Getter;

@Getter
public class LoginUserDto extends User {

    /** ID */
    private final Long id;

    /** 社員番号 */
    private final String number;

    /** 性 */
    private final String lastName;

    /** 名 */
    private final String firstName;

    /** 性カナ */
    private final String lastNameKana;

    /** 名カナ */
    private final String firstNameKana;

    /** パスワードリセットフラグ */
    private final boolean passwordResetFlg;

    /** 役職 */
    private final String position;

    /** 部署ID */
    private final Long departmentId;

    /** 権限ID */
    private final Long roleId;

    /** 生年月日 */
    private final Date birthday;

    /** 性別 */
    private final Integer sex;

    /** 血液型 */
    private final Integer blood;

    /** 出身地 */
    private final String birthplace;

    /** 自己紹介 */
    private final String biography;

    /** 退職フラグ */
    private final boolean retirementFlg;

    public LoginUserDto(EmployeeEntity employeeEntity, Collection<? extends GrantedAuthority> authorities) {
        super(employeeEntity.getLoginId(), employeeEntity.getPassword(), authorities);
        this.id = employeeEntity.getId();
        this.number = employeeEntity.getNumber();
        this.lastName = employeeEntity.getLastName();
        this.firstName = employeeEntity.getFirstName();
        this.lastNameKana = employeeEntity.getLastNameKana();
        this.firstNameKana = employeeEntity.getFirstNameKana();
        this.passwordResetFlg = employeeEntity.isPasswordResetFlg();
        this.position = employeeEntity.getPosition();
        this.departmentId = employeeEntity.getDepartmentId();
        this.roleId = employeeEntity.getRoleId();
        this.birthday = employeeEntity.getBirthday();
        this.sex = employeeEntity.getSex();
        this.blood = employeeEntity.getBlood();
        this.birthplace = employeeEntity.getBirthplace();
        this.biography = employeeEntity.getBiography();
        this.retirementFlg = employeeEntity.isRetirementFlg();
    }
}
