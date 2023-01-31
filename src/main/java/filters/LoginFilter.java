package filters;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // прописываем здесь все ситуации
        // 1 - пользователь не залогинен и идет на /login
        // 2 - пользователь не залогинен и идет по любой другой ссылке
        // 3 - проверка картинок и файлов css для отображения страницы, которые подгружаются также через фильтр
        // 4 - пользователь залогинен и он переходит по любой ссылке, кроме /login
        // 5 - пользователь залогинен и он переходит на /login

        HttpServletRequest req = (HttpServletRequest) servletRequest; // преобраз. из большего в меньший класс вручную
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        // 3
        String url = req.getRequestURI(); // пользователь по данному урл что-то вытягивает: либо /login, /adasd.jpeg (картинка)
        if (url.endsWith(".css") || url.endsWith(".js")) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        // 5
        Object isLogin = req.getSession().getAttribute("isLogin"); // у "req" появился метод "getSession().getAttribute", но метод ".getAttribute" отдает "Object", если в метод провалиться, потому создаем "Object isLogin"
        if (isLogin != null && url.endsWith("/login")) { // проверяем атрибут на "null"- пользователь не залогинен || или  на  не"null"- пользователь залогинен, при этом "url.endsWith("/login")"-пользователь переходит на /login
            resp.sendRedirect("/");
            return;
        }

        // 4
        if (isLogin != null && !url.endsWith("/login")) { // "!url.endsWith("/login")"- когда польз. переходит на любую другую траницу, кроме "/login"
            filterChain.doFilter(servletRequest, servletResponse); // пропускаем пользователя
            return;
        }

        if (url.endsWith("/login")) { // 1
            filterChain.doFilter(servletRequest, servletResponse); // пропускаем пользователя
            return;
        } else { // 2
            resp.sendRedirect("/login");
            return;
        }
    }


    @Override
    public void destroy() {

    }
}
