import com.alibaba.fastjson.JSON;
import com.company.project.model.User;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Created by bzhou on 2017/12/18.
 */
public class genJsonString {

    public static void main(String[] args) throws ParseException {
        
        // 生成调试时需要的Json String
        
        User user = new User();
        user.setNickName("Nem");
        user.setPassword("aaaa");
        DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        user.setRegisterDate(dateFormat2.parse("2017-06-23 14:24:23"));
        user.setSex(1);
        String a = JSON.toJSONString(user, true);
        System.out.print(a);


    }
}
