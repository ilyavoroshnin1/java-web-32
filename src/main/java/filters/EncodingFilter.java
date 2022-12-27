package filters;

import javax.servlet.*;
import java.io.IOException;

public class EncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException { // вкл-ся при запуске TOMCATа. Это метод, который отрабатывает единожды в момент запуска приложения.
        // сюда прописываем код, которы должен отработать при запуске приложения!!!

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // установим здесь загрузку русского языка и чтобы он отраб. перед каждым SERVLETом!
        servletRequest.setCharacterEncoding("UTF-8"); // делаем кодировку двум объектам
        servletResponse.setCharacterEncoding("UTF-8");
        filterChain.doFilter(servletRequest,servletResponse); // метод у объекта для передачи управления либо на дальнейший фильтр, либо сервлет

        // кол можно писать над "filterChain" и под.
        // если НАД - этот код отрабатывает, когда servletRequest и servletResponse идут ОТ ПОЛЬЗОВАТЕЛЯ К СЕРВЛЕТУ
        // если ПОД - когда от СЕРВЛЕТА К ПОЛЬЗОВАТЕЛЮ

        // тобы подключить этот фильтр, устан его в WEB.XML
    }

    @Override
    public void destroy() { // отрабатывает при выключении TOMCATа. Прописываем код, который нужен при выключении приложения!

    }
}
