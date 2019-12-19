import { check } from "k6";
import http from "k6/http";
import { parseHTML } from "k6/html";

export default function() {
    let res = http.get("http://localhost/auth/realms/internal/protocol/openid-connect/auth?response_type=code&client_id=security-admin-console&redirect_uri=http%3A%2F%2Flocalhost%2Fauth%2Fadmin%2Finternal%2Fconsole&login=true&scope=openid");
    check(res, { "is status 200": (r) => r.status === 200 });
    const startPageBody = parseHTML(res.body);
    const samlProviderUrl = startPageBody.find('#zocial-saml').attr("href")
    res = http.get("http://localhost" + samlProviderUrl);
    check(res, { "is status 200": (r) => r.status === 200 });
    const samlAuthPageBody = parseHTML(res.body);
    let authState = samlAuthPageBody.find('input[name="AuthState"]').attr("value")
    res = res.submitForm({
        formSelector: 'form[method="post"]',
        fields: {
          username: "user1",
          password: "user1pass",
          AuthState: authState
        },
        submitSelector: "#submit_button",
    });
    check(res, { "is status 200": (r) => r.status === 200 });
    res = res.submitForm({
        formSelector: 'form[method="post"]'
    });
    check(res, { "is status 200": (r) => r.status === 200 });



};
