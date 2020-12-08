<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!DOCTYPE html>
<html lang="ko">
<style>
html {
  color: #343434;
}

html.dark {
  background: #121212;
  color: #bbb;
}

html.dark a {
  color: #3ea6ff;
}

</style>
<head>
</head>

<body>
   <h1 align="center">Hello World!</h1>
<button id="toggleTheme">테마 토글</button>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae justo eu neque maximus pellentesque. Aliquam congue vestibulum orci, vel placerat nisi accumsan a. Donec commodo ante sed mi congue vehicula. Ut sed ante tempus massa tempus interdum. Quisque vitae placerat quam. Pellentesque arcu risus, cursus sed justo ac, lobortis iaculis lectus. Suspendisse non dolor et enim tempus tincidunt. Pellentesque mattis purus fringilla, vehicula ante ut, mattis ante. Nulla id purus id dui facilisis scelerisque nec non est.</p>
<a href="#">Link</a>
</body>
<script>
if (window.matchMedia("(prefers-color-scheme: dark)").matches) {
    document.documentElement.classList.add("dark")
}

document.getElementById("toggleTheme").addEventListener("click",() => {
  document.documentElement.classList.toggle("dark")
})

</script>
</html>