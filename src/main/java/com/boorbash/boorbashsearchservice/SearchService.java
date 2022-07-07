package com.boorbash.boorbashsearchservice;

import com.boorbash.interfaces.RestaurantData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import javax.sql.DataSource;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;


@RestController
public class SearchService {
    private static final Logger LOGGER = LoggerFactory.getLogger(SearchService.class);

    @Autowired
    private DataSource dataSource;

    private static final List<RestaurantData> SAMPLE_RESULTS = Arrays.asList(
//            RestaurantData.of(
//                    "https://images.unsplash.com/photo-1572695157366-5e585ab2b69f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMDUzMDJ8MHwxfHNlYXJjaHwzfHxicnVzY2hldHRhfGVufDF8fHx8MTY1NDg5OTI2MA&ixlib=rb-1.2.1&q=80&w=200",
//                    "Little Italy",
//                    "Restaurant description for some italian restaurant",
//                    new BigDecimal("4.7")
//            ),
//            RestaurantData.of(
//                    "https://images.unsplash.com/photo-1565299507177-b0ac66763828?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMDUzMDJ8MHwxfHNlYXJjaHwzM3x8Zm9vZHxlbnwxfHx8fDE2NTQ4MjE1ODU&ixlib=rb-1.2.1&q=80&w=200",
//                    "Danny's Burgers",
//                    "Best burgers in town!",
//                    new BigDecimal("5.0")
//            )
    );

    @GetMapping("restaurantSearch")
    public List<RestaurantData> restaurantSearch(@RequestParam("searchString") String searchString) throws SQLException {
        LOGGER.debug("Entering restaurant search " + searchString);
        Connection con = this.dataSource.getConnection();
        String searchParam = "%" + searchString.toLowerCase() + "%";
        PreparedStatement stmt = con.prepareStatement(
                "select name, description, pic_url, rating, restaurant_id from restaurant_info" +
                        " where lower(name) like ?");
        stmt.setString(1, searchParam);
        ResultSet rs = stmt.executeQuery();

        List<RestaurantData> rslt = new ArrayList<>();

        while (rs.next()){
            String name = rs.getString(1);
            String desc = rs.getString(2);
            String pic = rs.getString(3);
            BigDecimal rating = rs.getBigDecimal(4);
            int restaurantId = rs.getInt(5);

            rslt.add(RestaurantData.of(restaurantId, pic, name, desc, rating));
        }

        rs.close();
        stmt.close();
        con.close();

//        return SAMPLE_RESULTS;

        return rslt;
    }

}
