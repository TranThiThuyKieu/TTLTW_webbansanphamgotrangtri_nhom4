package controller;

import dao.ContactSettingsDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ContactSettings;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet(name = "ShippingServlet", value = "/ShippingServlet")
public class ShippingServlet extends HttpServlet {

    private static final String TOKEN = "ce465184-2605-11f1-b015-2eae3cf2dbdd";
    private static final int SHOP_ID = 6340764;

    private static final int TIMEOUT = 5000;

    private final ContactSettingsDao settingsDao = new ContactSettingsDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        response.setContentType("application/json;charset=UTF-8");

        try {
            String districtStr = request.getParameter("district_id");
            String wardCode = request.getParameter("ward_code");

            if (districtStr == null || wardCode == null) {
                response.getWriter().print("{\"code\":400,\"message\":\"Missing params\"}");
                return;
            }

            int toDistrictId = Integer.parseInt(districtStr);
            ContactSettings settings = settingsDao.getSettings();

            int fromDistrictId = settings.getDistrict_id();
            String fromWardCode = settings.getWard_code();

            if (fromDistrictId == 0 || fromWardCode == null) {
                response.getWriter().print("{\"code\":500,\"message\":\"Shop address not configured\"}");
                return;
            }

            System.out.println("Calculate shipping: " + toDistrictId + " - " + wardCode);

            int serviceId = getServiceId(fromDistrictId, toDistrictId);

            if (serviceId == -1) {
                response.getWriter().print("{\"code\":400,\"message\":\"No service available\"}");
                return;
            }

            String feeResponse = callApi(
                    "https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee",
                    "{"
                            + "\"from_district_id\":" + fromDistrictId + ","
                            + "\"from_ward_code\":\"" + fromWardCode + "\","
                            + "\"to_district_id\":" + toDistrictId + ","
                            + "\"to_ward_code\":\"" + wardCode + "\","
                            + "\"service_id\":" + serviceId + ","
                            + "\"service_type_id\":2,"
                            + "\"weight\":1000"
                            + "}"
            );

            System.out.println("Fee response: " + feeResponse);

            response.getWriter().print(feeResponse);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("{\"code\":500,\"error\":\"" + e.getMessage() + "\"}");
        }
    }

    private int getServiceId(int fromDistrict, int toDistrict) {

        try {
            String response = callApi(
                    "https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/available-services",
                    "{"
                            + "\"shop_id\":" + SHOP_ID + ","
                            + "\"from_district\":" + fromDistrict + ","
                            + "\"to_district\":" + toDistrict
                            + "}"
            );

            System.out.println("Service response: " + response);

            int index = response.indexOf("\"service_id\":");

            if (index != -1) {
                int start = index + 13;
                int end = response.indexOf(",", start);
                return Integer.parseInt(response.substring(start, end));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }

    private String callApi(String urlStr, String jsonBody) throws IOException {

        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Token", TOKEN);
        conn.setRequestProperty("ShopId", String.valueOf(SHOP_ID));

        conn.setConnectTimeout(TIMEOUT);
        conn.setReadTimeout(TIMEOUT);

        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonBody.getBytes());
        }

        int status = conn.getResponseCode();

        BufferedReader reader;

        if (status >= 200 && status < 300) {
            reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            reader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder result = new StringBuilder();
        String line;

        while ((line = reader.readLine()) != null) {
            result.append(line);
        }

        System.out.println("API (" + urlStr + ") status: " + status);

        return result.toString();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
    }
}