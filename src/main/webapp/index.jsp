<%@ page import="java.util.List" %>
<%@ page import="lk.ac.kln.model.PetFood" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <%--    <link rel="stylesheet" href="./dist/output.css" />--%>
    <script src="https://cdn.tailwindcss.com"></script>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
    />

    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
            integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    ></script>
</head>

<body>
<nav
        class="container mx-auto flex justify-between items-center px-10 py-5 sticky top-0 left-0 right-0 z-50 bg-white"
>
    <div>
        <img
                src="https://peppermintcafe.lk/wp-content/themes/peppermint/images/peppermint-logo.gif"
                alt="logo"
        />
    </div>

    <ul
            class="flex flex-1 items-center justify-around px-12 cursor-pointer text-xl"
    >
        <li class="hover:underline">Home</li>
        <li class="hover:underline">Our Menu</li>
        <li class="hover:underline">About Us</li>
        <li class="hover:underline">Promotions</li>
        <li class="hover:underline">Contact Us</li>
    </ul>

    <div class="flex flex-col">
        <div class="flex pb-5">
            <i class="bi bi-telephone pr-2"></i>
            <p>+94 756 320 420</p>
        </div>

        <p class="flex flex-col">
            #76, Wijerama Mawatha,<span></span> Colombo 07, Sri Lanka
        </p>

        <div class="flex pt-5 text-xl cursor-pointer">
            <i class="bi bi-facebook pr-3"></i>
            <i class="bi bi-instagram pr-3"></i>
            <i class="bi bi-geo-alt-fill"></i>
        </div>
    </div>
</nav>

<div class="relative">
    <h1
            class="text-4xl bg-black text-white px-8 py-4 absolute bottom-10 left-10"
    >
        PET MENU
    </h1>
    <img
            src="https://peppermintcafe.lk/wp-content/uploads/2018/10/pet-menu-banner.jpg"
            alt=""
    />
</div>

<div class="grid grid-cols-4 pt-20 px-20 gap-6 pb-10">
    <%
        List<PetFood> petFoods= (List<PetFood>) request.getAttribute("food");
        for (PetFood p: petFoods) { %>
    <div>
        <img
                src="<% out.println(p.getImageUrl()); %>"
                alt="product image"
        />
        <h1 class="text-lg font-bold pt-5"><% out.println(p.getName()); %></h1>
        <p>Price: <span><% out.println(p.getPrice()); %></span></p>
    </div>

    <% } %>

</div>

<div
        class="w-screen h-screen fixed z-50 top-0 left-0 right-0 bottom-0 bg-gray-900/80"
>
    <div
            class="w-full h-full transform scale-[80%] bg-gray-50 grid grid-cols-3"
    >
        <div class="px-5 py-5">
            <img
                    src="https://peppermintcafe.lk/wp-content/uploads/2018/09/Chicken-and-Liver-Flavour-1.jpg"
                    alt=""
                    class="h-full"
            />
        </div>
        <div
                class="col-span-2 pt-20 px-10 flex flex-col justify-start items-center relative"
        >
            <h1 class="text-5xl font-bold">Chicken and Liver Flavour</h1>
            <p class="text-xl pt-20 text-justify">
                Product Information Pedigree Chicken & Milk 3Kg - Puppy PEDIGREE
                Chicken & Milk for Puppy is a wholesome meal, packed with essential
                nutrients vital to the healthy growth of your pet. The natural
                goodness of cereals, chicken, meat, soybean, carrots,... Product
                Information Pedigree Chicken & Milk 3Kg - Puppy PEDIGREE Chicken &
                Milk for Puppy is a wholesome meal, packed with essential nutrients
                vital to the healthy growth of your pet. The natural goodness of
                cereals, chicken, meat, soybean, carrots,... Product Information
                Pedigree Chicken & Milk 3Kg - Puppy PEDIGREE Chicken & Milk for
                Puppy is a wholesome meal, packed with essential nutrients vital to
                the healthy growth of your pet. The natural goodness of cereals,
                chicken, meat, soybean, carrots,... Product Information Pedigree
                Chicken & Milk 3Kg - Puppy PEDIGREE Chicken & Milk for Puppy is a
                wholesome meal, packed with essential nutrients vital to the healthy
                growth of your pet. The natural goodness of cereals, chicken, meat,
                soybean, carrots,...
            </p>
            <p
                    class="text-4xl font-bold absolute bottom-8 right-8 hover:bg-gray-900 hover:text-gray-50 transition-all duration-200 px-4 py-3 border-2 rounded-full border-gray-900"
            >
                LKR 510
            </p>
        </div>

        <button
                type="button"
                id="closeBtn"
                class="absolute top-5 right-5 text-6xl"
        >
            <i class="bi bi-x-circle-fill"></i>
        </button>
    </div>
</div>

<footer class="bg-gray-900 text-gray-300 w-full pb-14 relative mt-36">
    <img
            src="https://peppermintcafe.lk/wp-content/themes/peppermint/images/peppermint-footer-logo.png"
            alt=""
            class="absolute left-1/2 -top-24 transform -translate-x-1/2"
    />

    <div class="container msx-auto flex pt-60 justify-between px-28">
        <ul class="flex text-xl cursor-pointer">
            <li class="hover:underline pr-12">Home</li>
            <li class="hover:underline pr-12">Our Menu</li>
            <li class="hover:underline pr-12">About Us</li>
            <li class="hover:underline pr-12">Promotions</li>
            <li class="hover:underline pr-12">Contact Us</li>
        </ul>
        <div class="text-2xl cursor-pointer">
            <i class="bi bi-facebook pr-3"></i>
            <i class="bi bi-instagram pr-3"></i>
        </div>
    </div>

    <div class="w-full bg-gray-500 mt-10" style="height: 0.1rem"></div>

    <p class="w-full text-center pt-5">
        Copyright © 2022 - Peppermint Cafe All Rights Reserved | Web Design By:
        Theruni
    </p>
</footer>
</body>
</html>
