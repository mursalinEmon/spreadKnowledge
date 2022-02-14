-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2022 at 08:03 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_year_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_profiles`
--

CREATE TABLE `admin_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `replied_by` bigint(20) UNSIGNED NOT NULL,
  `answer_for_question` bigint(20) UNSIGNED NOT NULL,
  `answer_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `replied_by`, `answer_for_question`, `answer_body`, `tags`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '<p>fgsfhzhh</p>', NULL, '2021-01-02 11:59:10', '2021-01-02 11:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_status` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `career_paths`
--

CREATE TABLE `career_paths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`course_list`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Language', 'dadawd', '2020-12-16 13:55:29', '2020-12-16 13:55:29'),
(3, 'framework', 'afdafaef', '2020-12-17 06:37:38', '2020-12-17 06:37:38'),
(4, 'Technology', 'asfafa', '2020-12-17 06:44:15', '2020-12-17 06:44:15'),
(7, 'web', 'sfasfa', '2020-12-18 16:33:40', '2020-12-18 16:33:40'),
(8, 'library', 'vgdsvgs', '2020-12-07 15:48:44', '2020-12-07 15:48:44'),
(9, 'dbms', 'affafa', '2020-12-09 16:15:48', '2020-12-09 16:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `contributor_profiles`
--

CREATE TABLE `contributor_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contributor_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` double(8,2) NOT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`tags`)),
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `student_count` bigint(20) NOT NULL DEFAULT 0,
  `course_level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `amount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_title`, `contributor_id`, `image`, `rating`, `tags`, `category_id`, `sub_category_id`, `student_count`, `course_level`, `created_at`, `updated_at`, `type`, `amount`) VALUES
(1, 'C++ Programming Language', 1, 'image/mursalin/download.png', 1.00, '[\"c\",\"c++\",\"language\"]', 1, 13, 48, 'beginner', '2020-12-18 10:48:33', '2021-02-28 01:57:45', 'free', 0),
(2, 'Python Programming Language', 1, 'image/mursalin/d1326ca6cca8038cd115a061b4e2b3bc-840x430.png', 1.00, '[\"Python\"]', 1, 2, 53, 'beginner', '2020-12-18 10:51:56', '2021-12-17 10:29:40', 'paid', 10000),
(3, 'JavaScript Tutorials', 1, 'image/mursalin/download (1).png', 1.00, '[\"js\",\"javascript\"]', 1, 3, 69, 'beginner', '2020-12-18 11:17:03', '2021-02-28 02:00:20', 'free', 0),
(4, 'PHP Tutorials', 1, 'image/mursalin/download (2).png', 1.00, '[\"php\"]', 1, 1, 42, 'beginner', '2020-12-18 11:50:03', '2021-12-17 10:24:29', 'free', 0),
(5, 'Laravel Tutorial', 1, 'image/mursalin/download (3).png', 1.00, '[\"laravel\"]', 3, 4, 38, 'beginner', '2020-12-18 12:00:00', '2021-02-28 02:00:26', 'free', 0),
(6, 'Django Tutorial', 1, 'image/mursalin/python-django.png', 1.00, '[\"django\"]', 3, 5, 40, 'beginner', '2020-12-18 12:02:57', '2021-12-17 10:09:23', 'free', 0),
(7, 'VueJS Tutorial', 1, 'image/mursalin/download (4).png', 1.00, '[\"vue\",\"js\"]', 3, 6, 55, 'beginner', '2020-12-18 12:05:53', '2021-02-28 02:00:33', 'free', 0),
(8, 'jQuery Tutorials', 1, 'image/mursalin/1_NeKYs9ypQ7jkalNxEX3t9Q.png', 1.00, '[\"jQuery\"]', 8, 14, 8, 'intermediate', '2021-01-06 10:42:04', '2021-02-25 11:44:26', 'free', 0),
(9, 'HTML Tutorials', 1, 'image/mursalin/download (5).png', 1.00, '[\"html\"]', 7, 10, 58, 'beginner', '2021-01-06 12:13:25', '2021-02-28 02:00:36', 'free', 0),
(10, 'SQL Tutorial', 1, 'image/mursalin/sql-illustration.png', 1.00, '[\"sql\"]', 1, 15, 5, 'beginner', '2021-01-06 12:18:50', '2021-02-24 02:34:48', 'free', 0),
(11, 'CSS Tutorial', 1, 'image/mursalin/css-tutorial-img1-01.o.png', 1.00, '[\"css\"]', 7, 11, 59, 'beginner', '2021-01-07 07:32:47', '2021-02-28 02:00:41', 'free', 0),
(12, 'ASP.NET Tutorial', 1, 'image/mursalin/asp.net_.jpg', 1.00, '[\"asp.net\",\"c#\"]', 3, 16, 43, 'intermediate', '2021-01-07 07:44:23', '2021-02-28 01:57:56', 'free', 0),
(13, 'C# Tutorial', 1, 'image/mursalin/am-good-at-csharp-wpf-xamarin-angular-2.jpg', 1.00, '[\"c#\"]', 1, 17, 45, 'beginner', '2021-01-07 07:47:52', '2021-02-28 01:57:52', 'free', 0),
(14, 'MySQL Tutorial', 1, 'image/mursalin/OIP.jpg', 1.00, '[\"dbms\",\"mysql\"]', 9, 18, 45, 'beginner', '2021-01-07 08:05:21', '2021-02-28 01:52:19', 'free', 0),
(15, 'MERN stack: A complete tutorial', 1, 'image/mursalin/epv55hgtsfi8csprpj9u.jpg', 1.00, '[\"mern\",\"react\",\"nodjs\",\"mongodb\"]', 7, 19, 0, 'Advance', '2021-10-30 11:18:19', '2021-10-30 11:18:19', 'paid', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `course_exams`
--

CREATE TABLE `course_exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lession_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `marks` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_exams`
--

INSERT INTO `course_exams` (`id`, `user_id`, `course_id`, `lession_id`, `question_id`, `marks`, `created_at`, `updated_at`) VALUES
(7, 2, 1, 2, 1, 1, '2021-02-26 12:21:54', '2021-02-26 12:22:26'),
(8, 2, 1, 2, 6, 1, '2021-02-26 12:21:55', '2021-02-26 12:43:51');

-- --------------------------------------------------------

--
-- Table structure for table `course_lessons`
--

CREATE TABLE `course_lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_lessons`
--

INSERT INTO `course_lessons` (`id`, `course_id`, `lesson_title`, `lesson_body`, `created_at`, `updated_at`) VALUES
(1, 1, 'C++ Programming Basics', '<p><span style=\"color: rgba(0, 0, 0, 0.84);\">C++ is a general-purpose programming language and widely used nowadays for competitive programming. It has imperative, object-oriented and generic programming features. C++ runs on lots of platform like Windows, Linux, Unix, Mac, etc.</span></p><p><br></p><p><span class=\"ql-cursor\">﻿</span>Therefore, below are the basics of C++ in the format in which it will help you the most to get the headstart:</p><ol><li class=\"ql-align-justify\"><a href=\"https://www.geeksforgeeks.org/writing-first-c-program-hello-world-example/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\"><strong>Basic Syntax and First Program in C++:</strong></a>&nbsp;Learning C++ programming can be simplified into writing your program in a text editor and saving it with correct extension(.CPP, .C, .CP) and compiling your program using a compiler or online IDE. The “Hello World” program is the first step towards learning any programming language and also one of the simplest programs you will learn.</li><li class=\"ql-align-justify\"><a href=\"https://www.geeksforgeeks.org/basic-input-output-c/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\"><strong>Basic I/O in C++:</strong></a>C++ comes with libraries which provides us with many ways for performing input and output. In C++ input and output is performed in the form of a sequence of bytes or more commonly known as streams. The two keywords cout and cin are used very often for taking inputs and printing outputs. These two are the most basic methods of taking input and output in C++.</li><li class=\"ql-align-justify\"><a href=\"https://www.geeksforgeeks.org/comments-in-c-c/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\"><strong>Comments in C++:</strong></a>&nbsp;A well-documented program is a good practice as a programmer. It makes a program more readable and error finding become easier. One important part of good documentation is Comments. In computer programming, a comment is a programmer-readable explanation or annotation in the source code of a computer program. These are statements that are not executed by the compiler and interpreter.</li><li class=\"ql-align-justify\"><a href=\"https://www.geeksforgeeks.org/c-data-types/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\"><strong>Data Types and Modifiers in C++:</strong></a>&nbsp;All variables use data-type during declaration to restrict the type of data to be stored. Therefore, we can say that data types are used to tell the variables the type of data it can store. Whenever a variable is defined in C++, the compiler allocates some memory for that variable based on the data-type with which it is declared. Every data type requires a different amount of memory.</li><li class=\"ql-align-justify\"><a href=\"https://www.geeksforgeeks.org/uninitialized-primitive-data-types-in-c-c/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\"><strong>Uninitialized variable in C++:&nbsp;</strong></a>“One of the things that has kept C++ viable is the zero-overhead rule: What you don’t use, you don’t pay for.” -Stroustrup. The overhead of initializing a stack variable is costly as it hampers the speed of execution, therefore these variables can contain indeterminate values. It is considered a best practice to initialize a primitive data type variable before using it in code.</li><li class=\"ql-align-justify\"><a href=\"https://www.geeksforgeeks.org/undefined-behavior-c-cpp/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\"><strong>Undefined Behaviour in C++:</strong>&nbsp;</a>If a user starts learning in C/C++ environment and is unclear with the concept of undefined behaviour then that can bring plenty of problems in the future like while debugging someone else code might be actually difficult in tracing the root to the undefined error.</li><li class=\"ql-align-justify\"><a href=\"https://www.geeksforgeeks.org/variables-in-c/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\"><strong>Variables and Types in C++:</strong></a>&nbsp;A variable is a name given to a memory location. It is the basic unit of storage in a program. The value stored in a variable can be changed during program execution. A variable is only a name given to a memory location, all the operations done on the variable effects that memory location. In C++, all the variables must be declared before use.</li><li class=\"ql-align-justify\"><a href=\"https://www.geeksforgeeks.org/scope-of-variables-in-c/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\"><strong>Variable Scope in C++:</strong></a>&nbsp;In general, scope is defined as the extent up to which something can be worked with. In programming also the scope of a variable is defined as the extent of the program code within which the variable can we accessed or declared or worked with. There are mainly two types of variable scopes, Local and Global Variables.</li><li class=\"ql-align-justify\"><a href=\"https://www.geeksforgeeks.org/constants-in-c/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\"><strong>Constants and Literals in C++:</strong></a>&nbsp;As the name suggests the name constants is given to such variables or values in C++ programming language which cannot be modified once they are defined. They are fixed values in a program. There can be any types of constants like integer, float, octal, hexadecimal, character constants, etc. Every constant has some range. The integers that are too big to fit into an int will be taken as long. Now there are various ranges that differ from unsigned to signed bits. Under the signed bit, the range of an int varies from -128 to +127 and under the unsigned bit, int varies from 0 to 255. Literals are kind of constants and both the terms are used interchangeably in C++.</li><li class=\"ql-align-justify\"><a href=\"https://www.geeksforgeeks.org/types-of-literals-in-c-c-with-examples/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\"><strong>Types of Literals in C++:</strong></a>&nbsp;In this article we will analyse the various kind of literals that C++ provides. The values assigned to each constant variables are referred to as the literals. Generally, both terms, constants and literals are used interchangeably. For eg, “const int = 5;“, is a constant expression and the value 5 is referred to as constant integer literal.</li></ol><p><br></p>', '2020-12-18 10:49:20', '2020-12-18 10:49:20'),
(2, 1, 'C++ Data Types', '<p><span style=\"color: rgba(0, 0, 0, 0.84);\">All&nbsp;</span><a href=\"https://www.geeksforgeeks.org/variables-and-keywords-in-c/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32); background-color: rgb(255, 255, 255);\">variables</a><span style=\"color: rgba(0, 0, 0, 0.84);\">&nbsp;use data-type during declaration to restrict the type of data to be stored. Therefore, we can say that data types are used to tell the variables the type of data it can store. Whenever a variable is defined in C++, the compiler allocates some memory for that variable based on the data-type with which it is declared. Every data type requires a different amount of memory.</span></p>', '2020-12-18 10:49:51', '2020-12-18 10:49:51'),
(3, 2, 'Python 3 basics', '<p><a href=\"https://www.geeksforgeeks.org/python-tutorial-learn-python-3-with-examples/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255); color: rgb(236, 78, 32);\">Python</a><span style=\"color: rgba(0, 0, 0, 0.84);\">&nbsp;was developed by Guido van Rossum in the early 1990s and its latest version is 3.7.1, we can simply call it as Python3. Python 3.0 was released in 2008. and is interpreted language i.e it’s not compiled and the interpreter will check the code line by line. This article can used to learn very basics of&nbsp;</span><a href=\"https://www.geeksforgeeks.org/python-programming-language/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32); background-color: rgb(255, 255, 255);\">Python programming language</a><span style=\"color: rgba(0, 0, 0, 0.84);\">.</span></p>', '2020-12-18 10:52:21', '2020-12-18 10:52:21'),
(4, 2, 'Python | Set 3 (Strings, Lists, Tuples, Iterations)', '<p><strong style=\"color: rgba(0, 0, 0, 0.84);\">Strings in Python</strong><span style=\"color: rgba(0, 0, 0, 0.84);\">&nbsp;</span></p><p><span style=\"color: rgba(0, 0, 0, 0.84);\">A string is a sequence of characters. It can be declared in python by using double-quotes. Strings are immutable, i.e., they cannot be changed.</span></p><p><br></p><p><strong style=\"color: rgba(0, 0, 0, 0.84);\"><span class=\"ql-cursor\">﻿</span>Tuples in Python</strong><span style=\"color: rgba(0, 0, 0, 0.84);\">&nbsp;</span></p><p><span style=\"color: rgba(0, 0, 0, 0.84);\">A tuple is a sequence of immutable Python objects. Tuples are just like lists with the exception that tuples cannot be changed once declared. Tuples are usually faster than lists.</span></p>', '2020-12-18 10:53:34', '2020-12-18 10:53:34'),
(5, 3, 'Variables and Datatypes in JavaScript', '<p><span style=\"color: rgba(0, 0, 0, 0.84);\">There are majorly two types of languages. First, one is&nbsp;</span><strong style=\"color: rgba(0, 0, 0, 0.84);\">Statically typed language&nbsp;</strong><span style=\"color: rgba(0, 0, 0, 0.84);\">where each variable and expression type is already known at compile time. Once a variable is declared to be of a certain data type, it cannot hold values of other data types.Example: C, C++, Java.</span></p>', '2020-12-18 11:17:50', '2020-12-18 11:17:50'),
(6, 3, 'JavaScript Operators', '<p>An operator is capable of manipulating a certain value or operand. Operators are used to perform specific mathematical and logical computations on operands. In other words, we can say that an operator operates the operands. In JavaScript operators are used for compare values, perform arithmetic operations etc. There are various operators supported by JavaScript:</p><ul><li><strong style=\"color: rgba(0, 0, 0, 0.84);\">Arithmetic Operators</strong></li><li><strong style=\"color: rgba(0, 0, 0, 0.84);\">Comparison Operators</strong></li><li><strong style=\"color: rgba(0, 0, 0, 0.84);\">Logical Operators</strong></li><li><strong style=\"color: rgba(0, 0, 0, 0.84);\">Assignment Operators</strong></li><li><strong style=\"color: rgba(0, 0, 0, 0.84);\">Ternary Operators</strong></li><li><strong style=\"color: rgba(0, 0, 0, 0.84);\">typeof Operator</strong></li></ul><p><br></p>', '2020-12-18 11:19:35', '2020-12-18 11:19:35'),
(7, 4, 'PHP | Introduction', '<p>The term PHP is an acronym for&nbsp;<em>PHP: Hypertext Preprocessor</em>. PHP is a server-side scripting language designed specifically for web development.</p><ul><li class=\"ql-align-justify\">Websites like www.facebook.com, www.yahoo.com are also built on PHP.</li><li class=\"ql-align-justify\">One of the main reason behind this is that PHP can be easily embedded in HTML files and HTML codes can also be written in a PHP file.</li><li class=\"ql-align-justify\">The thing that differentiates PHP with client-side language like HTML is, PHP codes are executed on server whereas HTML codes are directly rendered on the browser. PHP codes are first executed on the server and then the result is returned to the browser.</li><li class=\"ql-align-justify\">The only information that the client or browser knows is the result returned after executing the PHP script on the server and not the actual PHP codes present in the PHP file. Also, PHP files can support other client-side scripting languages like CSS and JavaScript.</li></ul><p><br></p>', '2020-12-18 11:50:46', '2020-12-18 11:50:46'),
(8, 4, 'PHP | Basic Syntax', '<p>PHP or Hypertext Preprocessor is a widely used open-source general purpose scripting language and can be embedded with HTML. PHP files are saved with “.php” extension. PHP scripts can be written anywhere in the document within PHP tags along with normal HTML.</p><p class=\"ql-align-center\"><strong>PHP Tags or Escaping To PHP</strong></p><p>The mechanism of separating a normal HTML from PHP code is called the mechanism of Escaping To PHP. There are various ways in which this can be done. Few methods are already set by default but in order to use few others like Short-open or ASP-style tags we need to change the configuration of php.ini file. These tags are also used for embedding PHP within HTML. There are 4 such tags available for this purpose:-</p>', '2020-12-18 11:51:13', '2020-12-18 11:51:13'),
(9, 5, 'Laravel - Routing', '<h2>Basic Routing</h2><p class=\"ql-align-justify\">All the application routes are registered within the&nbsp;app/routes.php&nbsp;file. This file tells Laravel for the URIs it should respond to and the associated controller will give it a particular call. The sample route for the welcome page can be seen as shown in the screenshot given below&nbsp;</p><p><br></p>', '2020-12-18 12:00:36', '2020-12-18 12:00:36'),
(10, 5, 'Laravel - Middleware', '<p class=\"ql-align-justify\">Middleware acts as a bridge between a request and a response. It is a type of filtering mechanism. This chapter explains you the middleware mechanism in Laravel.</p><p class=\"ql-align-justify\">Laravel includes a middleware that verifies whether the user of the application is authenticated or not. If the user is authenticated, it redirects to the home page otherwise, if not, it redirects to the login page.</p><p><br></p>', '2020-12-18 12:00:59', '2020-12-18 12:00:59'),
(11, 6, 'Django - Basics', '<p class=\"ql-align-justify\">Django is a high-level Python web framework that encourages rapid development and clean, pragmatic design. Django makes it easier to build better web apps quickly and with less code.</p><p class=\"ql-align-justify\">Note&nbsp;− Django is a registered trademark of the Django Software Foundation, and is licensed under BSD License.</p><h2>History of Django</h2><ul><li class=\"ql-align-justify\">2003&nbsp;− Started by Adrian Holovaty and Simon Willison as an internal project at the Lawrence Journal-World newspaper.</li><li class=\"ql-align-justify\">2005&nbsp;− Released July 2005 and named it Django, after the jazz guitarist Django Reinhardt.</li><li class=\"ql-align-justify\">2005&nbsp;− Mature enough to handle several high-traffic sites.</li><li class=\"ql-align-justify\">Current&nbsp;− Django is now an open source project with contributors across the world.</li></ul><h2>Django – Design Philosophies</h2><p class=\"ql-align-justify\">Django comes with the following design philosophies −</p><ul><li class=\"ql-align-justify\">Loosely Coupled&nbsp;− Django aims to make each element of its stack independent of the others.</li><li class=\"ql-align-justify\">Less Coding&nbsp;− Less code so in turn a quick development.</li><li class=\"ql-align-justify\">Don\'t Repeat Yourself (DRY)&nbsp;− Everything should be developed only in exactly one place instead of repeating it again and again.</li><li class=\"ql-align-justify\">Fast Development&nbsp;− Django\'s philosophy is to do all it can to facilitate hyper-fast development.</li><li class=\"ql-align-justify\">Clean Design&nbsp;− Django strictly maintains a clean design throughout its own code and makes it easy to follow best web-development practices.</li></ul><p><br></p>', '2020-12-18 12:03:27', '2020-12-18 12:03:27'),
(12, 6, 'Django - Creating a Project', '<p><span style=\"color: rgb(0, 0, 0);\">Now that we have installed Django, let\'s start using it. In Django, every web app you want to create is called a project; and a project is a sum of applications. An application is a set of code files relying on the MVT pattern. As example let\'s say we want to build a website, the website is our project and, the forum, news, contact engine are applications. This structure makes it easier to move an application between projects since every application is independent.</span></p><p><br></p><h2>Create a Project</h2><p class=\"ql-align-justify\">Whether you are on Windows or Linux, just get a terminal or a&nbsp;cmd&nbsp;prompt and navigate to the place you want your project to be created, then use this code −</p><pre class=\"ql-syntax\" spellcheck=\"false\">$ django-admin startproject myproject\n</pre><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">This will create a \"myproject\" folder with the following structure −</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">myproject/\n   manage.py\n   myproject/\n      __init__.py\n      settings.py\n      urls.py\n      wsgi.py\n</pre>', '2020-12-18 12:04:48', '2020-12-18 12:04:48'),
(13, 8, 'jQuery | Introduction', '<p><strong>jQuery&nbsp;</strong>is an open source JavaScript library that simplifies the interactions between an HTML/CSS document, or more precisely the Document Object Model (DOM), and JavaScript.</p><p>Elaborating the terms, jQuery simplifies HTML document traversing and manipulation, browser event handling, DOM animations, Ajax interactions, and cross-browser JavaScript development.</p><p><strong>Note:</strong>&nbsp;The only library available today that meets the needs of both designer types and programmer types is jQuery.</p><p>jQuery is widely famous with its philosophy of&nbsp;<strong>“Write less, do more.”</strong>&nbsp;This philosophy can be further elaborated as three concepts:</p><ul><li>Finding some elements (via CSS selectors) and doing something with them (via jQuery methods) i.e. locate a set of elements in the DOM, and then do something with that set of elements.</li><li>Chaining multiple jQuery methods on a set of elements</li><li>Using the jQuery wrapper and implicit iteration</li></ul><p><strong><u>Using jQuery (JS) library on HTML page</u></strong></p><p>There are several ways to start using jQuery on your web site.</p><ol><li>Use the Google-hosted/ Microsoft-hosted content delivery network (CDN) to include a version of jQuery.</li><li>Download own version of jQuery from jQuery.com and host it on own server or local filesystem.</li></ol><p><br></p>', '2021-01-06 10:43:49', '2021-01-06 10:43:49'),
(14, 8, 'jQuery | Syntax', '<p>It is used for selecting elements in HTML and performing the action on those elements.</p><p><strong>Syntax:</strong></p><pre class=\"ql-syntax\" spellcheck=\"false\">$(selector).action()\n</pre><p><br></p><p><strong>$ sign:&nbsp;</strong>It grants access to jQuery.</p><p><strong>(selector):&nbsp;</strong>It is used to find HTML elements.</p><p><strong style=\"color: rgb(64, 66, 78);\">jQuery action():&nbsp;</strong><span style=\"color: rgb(64, 66, 78);\">It is used to perform actions on the elements.</span></p><ol><li><strong>Used to hide the current element.</strong></li></ol><pre class=\"ql-syntax\" spellcheck=\"false\">$(this).hide()\n</pre><ol><li><strong>Used to hide all &lt;p&gt; elements.</strong></li></ol><pre class=\"ql-syntax\" spellcheck=\"false\">$(\"p\").hide()\n</pre><ol><li><strong>Used to hide all elements with class=”test”.</strong></li></ol><pre class=\"ql-syntax\" spellcheck=\"false\">$(\".test\").hide()\n</pre><ol><li><strong>Used to hide the element with id=”test”.</strong></li></ol><pre class=\"ql-syntax\" spellcheck=\"false\">$(\"#test\").hide()\n</pre><p><strong>Document Ready Event:</strong></p><ul><li><strong>jQuery Methods are inside a Document ready event for easy reading of code.</strong></li></ul><pre class=\"ql-syntax\" spellcheck=\"false\">$(document).ready(function(){\n\n  // jQuery Method\n\n});\n</pre><ul><li>This is to check and stop the jquery before the document is finished loading. This method also allows you to have JavaScript code before the body of your document, in the head section.</li><li><strong>Some actions that can fail if the method is run before the loaded document:</strong></li><li>Get the image size which is not loaded or hide element which is not created yet.</li><li><strong>The shorter method for document ready:</strong></li></ul><pre class=\"ql-syntax\" spellcheck=\"false\">$(function(){\n\n  // jQuery Method\n\n});\n</pre><p><br></p>', '2021-01-06 10:47:28', '2021-01-06 10:47:28'),
(15, 8, 'jQuery | Selectors and Event Methods', '<p><a href=\"https://www.geeksforgeeks.org/jquery-introduction/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\">jQuery</a>&nbsp;is a powerful JavaScript library. It is more powerful than the JavaScript. The codes of jQuery are more precise, shorter and simpler than the standard JavaScript codes. It can perform a variety of functions.</p><p>In this article, we will learn about jQuery selectors, jQuery Event methods and some useful methods.</p><ol><li><strong>jQuery selectors:</strong></li><li><br></li><li>jQuery selectors are used to select the HTML element(s) and allows you to manipulate the HTML element(s) in a way we want. It selects the HTML elements on a variable parameter such as their name, classes, id, types, attributes, attribute values, etc. All selectors in jQuery are selected using a special sign i.e. dollar sign and parentheses:</li></ol><pre class=\"ql-syntax\" spellcheck=\"false\"> $(\"selector-name\")\n</pre><p><br></p>', '2021-01-06 10:49:05', '2021-01-06 10:49:05'),
(16, 9, 'HTML | Introduction', '<p><strong>HTML</strong>&nbsp;stands for Hyper Text Markup Language. It is used to design web pages using markup language. HTML is the combination of Hypertext and Markup language. Hypertext defines the link between the web pages. Markup language is used to define the text document within tag which defines the structure of web pages. This language is used to annotate (make notes for the computer) text so that a machine can understand it and manipulate text accordingly. Most markup languages (e.g. HTML) are human readable. Language uses tags to define what manipulation has to be done on the text.&nbsp;</p><p>HTML is a markup language used by the browser to manipulate text, images and other content, in order to display it in the required format. HTML was created by Tim Berners-Lee in 1991. The first ever version of HTML was HTML 1.0, but the first standard version was HTML 2.0, published in 1999.</p>', '2021-01-06 12:14:27', '2021-01-06 12:14:27'),
(17, 9, 'HTML full form', '<p><a href=\"https://www.geeksforgeeks.org/html-tutorials/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\"><strong>HTML</strong></a>&nbsp;stands for&nbsp;<strong>Hypertext Markup Language</strong>. It is a standard markup language used to design the documents that will be displayed in the browsers as a web-page. This language can become more interactive and attractive by using CSS ( Cascading Style Sheet) and JS (JavaScript) within it. The HTML word defines some specific meaning within it.&nbsp;<strong>Hypertext</strong>&nbsp;comes from the Hyperlink that means connections between several pages,&nbsp;<strong>Markup</strong>&nbsp;means the defined elements will be the page layout and elements within the page. The&nbsp;<strong>language</strong>&nbsp;combines both the feature and makes it Hypertext Markup Language.</p><p>Initially, the HTML was released in the year of 1993 developed by&nbsp;<em>Tim Berners-Lee in 1990</em>. Currently, the&nbsp;<strong>WHATWG</strong>&nbsp;community working on the development of the HTML. The current HTML5 version gains so much popularity because of newly added features in it. All the websites skeleton are made of HTML and each browser performing on that and makes that visible and user-friendly to the user.</p>', '2021-01-06 12:16:38', '2021-01-06 12:16:38'),
(18, 9, 'HTML | Basics', '<p>In this article, we will go through all the basic stuff of HTML coding. There are various tags that we must consider and include while starting to code in HTML. These tags help in organization and basic formatting of elements in our script or web pages. These step by step procedures will guide you through the process of writing HTML.</p><p><strong>Basic HTML Document</strong></p><p><br></p><ul><li><span style=\"color: rgb(64, 66, 78);\">Below mentioned are the basic HTML tags which divides the whole document into various parts like head, body etc.</span>Every HTML document begins with a HTML document tag. Although this is not mandatory but it is a good convention to start the document with this below mentioned tag:</li></ul><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;!DOCTYPE html&gt;\n</pre><ul><li><strong>&lt;html&gt;</strong>&nbsp;: Every HTML code must be enclosed between basic HTML tags. It begins with&nbsp;<strong>&lt;html&gt;</strong>&nbsp;and ends with&nbsp;<strong>&lt;/html&gt;</strong>&nbsp;tag.</li><li><strong>&lt;head&gt;</strong>&nbsp;: The head tag comes next which contains all the header information of the web page or document like the title of the page and other miscellaneous information. These informations are enclosed within head tag which opens with&nbsp;<strong>&lt;head&gt;</strong>&nbsp;and ends with&nbsp;<strong>&lt;/head&gt;</strong>. The contents will of this tag will be explained in the later sections of course.</li><li><strong>&lt;title&gt; :&nbsp;</strong>We can mention the title of a web page using the&nbsp;<strong>&lt;title&gt;</strong>&nbsp;tag. This is a header information and hence mentioned within the header tags. The tag begins with&nbsp;<strong>&lt;title&gt;</strong>&nbsp;and ends with&nbsp;<strong>&lt;/title&gt;</strong></li><li><strong>&lt;body&gt; :&nbsp;</strong>Next step is the most important of all the tags we have learned so far. The body tag contains the actual body of the page which will be visible to all the users. This opens with&nbsp;<strong>&lt;body&gt;</strong>&nbsp;and ends with&nbsp;<strong>&lt;/body&gt;</strong>. Every content enclosed within this tag will be shown on the web page be it writings or images or audios or videos or even links. We will see later in the section how using various tags we may insert mentioned contents into our web pages.</li></ul>', '2021-01-06 12:17:23', '2021-01-06 12:17:23'),
(19, 10, 'Structured Query Language (SQL)', '<p>Structured Query Language is a standard Database language which is used to create, maintain and retrieve the relational database. Following are some interesting facts about SQL.</p><ul><li>SQL is case insensitive. But it is a recommended practice to use keywords (like SELECT, UPDATE, CREATE, etc) in capital letters and use user defined things (liked table name, column name, etc) in small letters.</li><li>We can write comments in SQL using “–” (double hyphen) at the beginning of any line.</li><li>SQL is the programming language for relational databases (explained below) like MySQL, Oracle, Sybase, SQL Server, Postgre, etc. Other non-relational databases (also called NoSQL) databases like MongoDB, DynamoDB, etc do not use SQL</li><li>Although there is an ISO standard for SQL, most of the implementations slightly vary in syntax. So we may encounter queries that work in SQL Server but do not work in MySQL.</li></ul><p><br></p>', '2021-01-06 12:19:13', '2021-01-06 12:19:13'),
(20, 10, 'Inner Join vs Outer Join', '<p><strong>What is Join?</strong></p><p>An SQL Join is used to combine data from two or more tables, based on a common field between them. For example, consider the following two tables.</p><p>Student Table</p><p><strong>EnrollNoStudentNameAddress</strong>1001geek1geeksquiz11002geek2geeksquiz21003geek3geeksquiz31004geek4geeksquiz4</p><p>StudentCourse Table</p><p>CourseIDEnrollNo1100121001310011100221003</p><p>Following is join query that shows names of students enrolled in different courseIDs.</p><pre class=\"ql-syntax\" spellcheck=\"false\">SELECT StudentCourse.CourseID,Student.StudentName\nFROM Student\nINNER JOIN StudentCourse \nON StudentCourse.EnrollNo = Student.EnrollNo\nORDER BY StudentCourse.CourseID\n</pre><p><br></p>', '2021-01-06 12:19:59', '2021-01-06 12:19:59'),
(21, 10, 'Database Objects in DBMS', '<p>A&nbsp;<strong>database object</strong>&nbsp;is any defined object in a database that is used to store or reference data.Anything which we make from&nbsp;<strong>create command&nbsp;</strong>is known as Database Object.It can be used to hold and manipulate the data.Some of the examples of database objects are : view, sequence, indexes, etc.</p><ul><li><strong>Table –</strong>&nbsp;Basic unit of storage; composed rows and columns</li><li><strong>View –</strong>&nbsp;Logically represents subsets of data from one or more tables</li><li><strong>Sequence –</strong>&nbsp;Generates primary key values</li><li><strong>Index –</strong>&nbsp;Improves the performance of some queries</li><li><strong>Synonym –</strong>&nbsp;Alternative name for an object</li></ul><p><br></p>', '2021-01-06 12:20:27', '2021-01-06 12:20:27'),
(22, 11, 'CSS - Introduction', '<h1 class=\"ql-align-center\">What is CSS?</h1><p class=\"ql-align-justify\">Cascading&nbsp;Style&nbsp;Sheets, fondly referred to as CSS, is a simple design language intended to simplify the process of making web pages presentable.</p><p class=\"ql-align-justify\">CSS handles the look and feel part of a web page. Using CSS, you can control the color of the text, the style of fonts, the spacing between paragraphs, how columns are sized and laid out, what background images or colors are used, layout designs,variations in display for different devices and screen sizes as well as a variety of other effects.</p><p class=\"ql-align-justify\">CSS is easy to learn and understand but it provides powerful control over the presentation of an HTML document. Most commonly, CSS is combined with the markup languages HTML or XHTML.</p><h2>Advantages of CSS</h2><ul><li class=\"ql-align-justify\">CSS saves time&nbsp;− You can write CSS once and then reuse same sheet in multiple HTML pages. You can define a style for each HTML element and apply it to as many Web pages as you want.</li><li class=\"ql-align-justify\">Pages load faster&nbsp;− If you are using CSS, you do not need to write HTML tag attributes every time. Just write one CSS rule of a tag and apply it to all the occurrences of that tag. So less code means faster download times.</li><li class=\"ql-align-justify\">Easy maintenance&nbsp;− To make a global change, simply change the style, and all elements in all the web pages will be updated automatically.</li><li class=\"ql-align-justify\">Superior styles to HTML&nbsp;− CSS has a much wider array of attributes than HTML, so you can give a far better look to your HTML page in comparison to HTML attributes.</li><li class=\"ql-align-justify\">Multiple Device Compatibility&nbsp;− Style sheets allow content to be optimized for more than one type of device. By using the same HTML document, different versions of a website can be presented for handheld devices such as PDAs and cell phones or for printing.</li><li class=\"ql-align-justify\">Global web standards&nbsp;− Now HTML attributes are being deprecated and it is being recommended to use CSS. So its a good idea to start using CSS in all the HTML pages to make them compatible to future browsers.</li></ul><h2>Who Creates and Maintains CSS?</h2><p class=\"ql-align-justify\">CSS is created and maintained through a group of people within the W3C called the CSS Working Group. The CSS Working Group creates documents called specifications. When a specification has been discussed and officially ratified by the W3C members, it becomes a recommendation.</p><p class=\"ql-align-justify\">These ratified specifications are called recommendations because the W3C has no control over the actual implementation of the language. Independent companies and organizations create that software.</p><p><br></p>', '2021-01-07 07:33:48', '2021-01-07 07:33:48'),
(23, 11, 'CSS - Visibility', '<p class=\"ql-align-justify\">A property called&nbsp;<em>visibility</em>&nbsp;allows you to hide an element from view. You can use this property along with JavaScript to create very complex menu and very complex webpage layouts.</p><p class=\"ql-align-justify\">You may choose to use the visibility property to hide error messages that are only displayed if the user needs to see them, or to hide answers to a quiz until the user selects an option.</p><p class=\"ql-align-justify\">NOTE&nbsp;− Remember that the source code will still contain whatever is in the invisible paragraph, so you should not use this to hide sensitive information such as credit card details or passwords.</p><p class=\"ql-align-justify\">The&nbsp;<em>visibility</em>&nbsp;property can take the values listed in the table that follows −</p><p class=\"ql-align-justify\">Sr.No.Value &amp; Description1visible</p><p class=\"ql-align-justify\">The box and its contents are shown to the user.</p><p class=\"ql-align-justify\">2hidden</p><p class=\"ql-align-justify\">The box and its content are made invisible, although they still affect the layout of the page.</p><p class=\"ql-align-justify\">3collapse</p><p class=\"ql-align-justify\">This is for use only with dynamic table columns and row effects.</p><p class=\"ql-align-justify\">Here is an example −</p><p class=\"ql-align-right\"><a href=\"http://tpcg.io/m3c6xw\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(255, 255, 255); background-color: rgb(164, 65, 112);\">Live Demo</a></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;html&gt;\n   &lt;head&gt;\n   &lt;/head&gt;\n\n   &lt;body&gt;\n      &lt;p&gt;\n         This paragraph should be visible in normal way.\n      &lt;/p&gt;\n   \n      &lt;p style = \"visibility:hidden;\"&gt;\n         This paragraph should not be visible.\n      &lt;/p&gt;\n   &lt;/body&gt;\n&lt;/html&gt; \n</pre><p class=\"ql-align-justify\"><br></p>', '2021-01-07 07:34:35', '2021-01-07 07:34:35'),
(24, 12, 'ASP.NET - Introduction', '<p class=\"ql-align-justify\">ASP.NET is a web development platform, which provides a programming model, a comprehensive software infrastructure and various services required to build up robust web applications for PC, as well as mobile devices.</p><p class=\"ql-align-justify\">ASP.NET works on top of the HTTP protocol, and uses the HTTP commands and policies to set a browser-to-server bilateral communication and cooperation.</p><p class=\"ql-align-justify\">ASP.NET is a part of Microsoft .Net platform. ASP.NET applications are compiled codes, written using the extensible and reusable components or objects present in .Net framework. These codes can use the entire hierarchy of classes in .Net framework.</p><p class=\"ql-align-justify\">The ASP.NET application codes can be written in any of the following languages:</p><ul><li>C#</li><li>Visual Basic.Net</li><li>Jscript</li><li>J#</li></ul><p class=\"ql-align-justify\">ASP.NET is used to produce interactive, data-driven web applications over the internet. It consists of a large number of controls such as text boxes, buttons, and labels for assembling, configuring, and manipulating code to create HTML pages.</p><p><br></p>', '2021-01-07 07:45:02', '2021-01-07 07:45:02'),
(25, 13, 'C# - Basic Syntax', '<p class=\"ql-align-justify\">C# is an object-oriented programming language. In Object-Oriented Programming methodology, a program consists of various objects that interact with each other by means of actions. The actions that an object may take are called methods. Objects of the same kind are said to have the same type or, are said to be in the same class.</p><p class=\"ql-align-justify\">For example, let us consider a Rectangle object. It has attributes such as length and width. Depending upon the design, it may need ways for accepting the values of these attributes, calculating the area, and displaying details.</p><p class=\"ql-align-justify\">Let us look at implementation of a Rectangle class and discuss C# basic syntax −</p><p class=\"ql-align-right\"><a href=\"http://tpcg.io/xRqOPn\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(255, 255, 255); background-color: rgb(254, 148, 0);\">Live Demo</a></p><pre class=\"ql-syntax\" spellcheck=\"false\">using System;\n\nnamespace RectangleApplication {\n   class Rectangle {\n      \n      // member variables\n      double length;\n      double width;\n      \n      public void Acceptdetails() {\n         length = 4.5;    \n         width = 3.5;\n      }\n      public double GetArea() {\n         return length * width; \n      }\n      public void Display() {\n         Console.WriteLine(\"Length: {0}\", length);\n         Console.WriteLine(\"Width: {0}\", width);\n         Console.WriteLine(\"Area: {0}\", GetArea());\n      }\n   }\n   class ExecuteRectangle {\n      static void Main(string[] args) {\n         Rectangle r = new Rectangle();\n         r.Acceptdetails();\n         r.Display();\n         Console.ReadLine(); \n      }\n   }\n}\n</pre><p class=\"ql-align-justify\">When the above code is compiled and executed, it produces the following result −</p><pre class=\"ql-syntax\" spellcheck=\"false\">Length: 4.5\nWidth: 3.5\nArea: 15.75\n</pre><p><br></p>', '2021-01-07 07:48:44', '2021-01-07 07:48:44'),
(26, 14, 'MySQL - PHP Syntax', '<p class=\"ql-align-justify\">MySQL works very well in combination of various programming languages like PERL, C, C++, JAVA and PHP. Out of these languages, PHP is the most popular one because of its web application development capabilities.</p><p class=\"ql-align-justify\">This tutorial focuses heavily on using MySQL in a PHP environment. If you are interested in MySQL with PERL, then you can consider reading the&nbsp;<a href=\"https://www.tutorialspoint.com/perl/perl_database.htm\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(49, 49, 49);\">PERL</a>&nbsp;Tutorial.</p><p class=\"ql-align-justify\">PHP provides various functions to access the MySQL database and to manipulate the data records inside the MySQL database. You would require to call the PHP functions in the same way you call any other PHP function.</p><p class=\"ql-align-justify\">The PHP functions for use with MySQL have the following general format −</p><pre class=\"ql-syntax\" spellcheck=\"false\">mysql_function(value,value,...);\n</pre><p class=\"ql-align-justify\">The second part of the function name is specific to the function, usually a word that describes what the function does. The following are two of the functions, which we will use in our tutorial −</p><pre class=\"ql-syntax\" spellcheck=\"false\">mysqli_connect($connect);\nmysqli_query($connect,\"SQL statement\");\n</pre><p class=\"ql-align-justify\">The following example shows a generic syntax of PHP to call any MySQL function.</p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;html&gt;\n   &lt;head&gt;\n      &lt;title&gt;PHP with MySQL&lt;/title&gt;\n   &lt;/head&gt;\n   \n   &lt;body&gt;\n      &lt;?php\n         $retval = mysql_function(value, [value,...]);\n         if( !$retval ) {\n            die ( \"Error: a related error message\" );\n         }\n         // Otherwise MySQL  or PHP Statements\n      ?&gt;\n   &lt;/body&gt;\n&lt;/html&gt;\n</pre><p><br></p>', '2021-01-07 08:06:03', '2021-01-07 08:06:03'),
(27, 1, 'C++ Operator', '<p class=\"ql-align-justify\">An operator is a symbol that tells the compiler to perform specific mathematical or logical manipulations. C++ is rich in built-in operators and provide the following types of operators −</p><ul><li>Arithmetic Operators</li><li>Relational Operators</li><li>Logical Operators</li><li>Bitwise Operators</li><li>Assignment Operators</li><li>Misc Operators</li></ul><p class=\"ql-align-justify\">This chapter will examine the arithmetic, relational, logical, bitwise, assignment and other operators one by one.</p><p><br></p>', '2021-02-07 13:34:55', '2021-02-07 13:34:55');
INSERT INTO `course_lessons` (`id`, `course_id`, `lesson_title`, `lesson_body`, `created_at`, `updated_at`) VALUES
(28, 1, 'Operators in C++', '<p class=\"ql-align-justify\">An operator is a symbol that tells the compiler to perform specific mathematical or logical manipulations. C++ is rich in built-in operators and provide the following types of operators −</p><ul><li>Arithmetic Operators</li><li>Relational Operators</li><li>Logical Operators</li><li>Bitwise Operators</li><li>Assignment Operators</li><li>Misc Operators</li></ul><p class=\"ql-align-justify\">This chapter will examine the arithmetic, relational, logical, bitwise, assignment and other operators one by one.</p><h2>Arithmetic Operators</h2><p class=\"ql-align-justify\">There are following arithmetic operators supported by C++ language −</p><p class=\"ql-align-justify\">Assume variable A holds 10 and variable B holds 20, then -</p><p class=\"ql-align-justify\"><img src=\"data:image/png;base64,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\"></p><h2>Relational Operators</h2><p class=\"ql-align-justify\">There are following relational operators supported by C++ language</p><p class=\"ql-align-justify\">Assume variable A holds 10 and variable B holds 20, then −</p><p class=\"ql-align-justify\"><a href=\"https://www.tutorialspoint.com/cplusplus/cpp_relational_operators.htm\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(49, 49, 49);\">Show Examples</a></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><img src=\"data:image/png;base64,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\"></p>', '2021-02-22 08:06:16', '2021-02-22 08:06:16');
INSERT INTO `course_lessons` (`id`, `course_id`, `lesson_title`, `lesson_body`, `created_at`, `updated_at`) VALUES
(29, 1, 'C++ Loop Types', '<p class=\"ql-align-justify\">There may be a situation, when you need to execute a block of code several number of times. In general, statements are executed sequentially: The first statement in a function is executed first, followed by the second, and so on.</p><p class=\"ql-align-justify\">Programming languages provide various control structures that allow for more complicated execution paths.</p><p class=\"ql-align-justify\">A loop statement allows us to execute a statement or group of statements multiple times and following is the general from of a loop statement in most of the programming languages −</p><p><img src=\"data:image/png;base64,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\"></p><p><span style=\"color: rgb(0, 0, 0);\">C++ programming language provides the following type of loops to handle looping requirements.</span></p><p><img src=\"data:image/png;base64,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\"></p><p><br></p><h2>Loop Control Statements</h2><p class=\"ql-align-justify\">Loop control statements change execution from its normal sequence. When execution leaves a scope, all automatic objects that were created in that scope are destroyed.</p><p class=\"ql-align-justify\">C++ supports the following control statements.</p><p><img src=\"data:image/png;base64,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\"></p><p><br></p><h2>The Infinite Loop</h2><p class=\"ql-align-justify\">A loop becomes infinite loop if a condition never becomes false. The&nbsp;for&nbsp;loop is traditionally used for this purpose. Since none of the three expressions that form the ‘for’ loop are required, you can make an endless loop by leaving the conditional expression empty.</p><p><br></p><pre class=\"ql-syntax\" spellcheck=\"false\">#include &lt;iostream&gt;\nusing namespace std;\n \nint main () {\n   for( ; ; ) {\n      printf(\"This loop will run forever.\\n\");\n   }\n\n   return 0;\n}\n\n</pre><p><span style=\"color: rgb(0, 0, 0);\">When the conditional expression is absent, it is assumed to be true. You may have an initialization and increment expression, but C++ programmers more commonly use the ‘for (;;)’ construct to signify an infinite loop.</span></p>', '2021-02-22 08:12:04', '2021-02-22 08:12:04');
INSERT INTO `course_lessons` (`id`, `course_id`, `lesson_title`, `lesson_body`, `created_at`, `updated_at`) VALUES
(30, 1, 'C++ Functions', '<p class=\"ql-align-justify\">A function is a group of statements that together perform a task. Every C++ program has at least one function, which is&nbsp;main(), and all the most trivial programs can define additional functions.</p><p class=\"ql-align-justify\">You can divide up your code into separate functions. How you divide up your code among different functions is up to you, but logically the division usually is such that each function performs a specific task.</p><p class=\"ql-align-justify\">A function&nbsp;declaration&nbsp;tells the compiler about a function\'s name, return type, and parameters. A function&nbsp;definition&nbsp;provides the actual body of the function.</p><p class=\"ql-align-justify\">The C++ standard library provides numerous built-in functions that your program can call. For example, function&nbsp;strcat()&nbsp;to concatenate two strings, function&nbsp;memcpy()&nbsp;to copy one memory location to another location and many more functions.</p><p class=\"ql-align-justify\">A function is known with various names like a method or a sub-routine or a procedure etc.</p><h2>Defining a Function</h2><p class=\"ql-align-justify\">The general form of a C++ function definition is as follows −</p><pre class=\"ql-syntax\" spellcheck=\"false\">return_type function_name( parameter list ) {\n   body of the function\n}\n</pre><p class=\"ql-align-justify\">A C++ function definition consists of a function header and a function body. Here are all the parts of a function −</p><ul><li class=\"ql-align-justify\">Return Type&nbsp;− A function may return a value. The&nbsp;return_type&nbsp;is the data type of the value the function returns. Some functions perform the desired operations without returning a value. In this case, the return_type is the keyword&nbsp;void.</li><li class=\"ql-align-justify\">Function Name&nbsp;− This is the actual name of the function. The function name and the parameter list together constitute the function signature.</li><li class=\"ql-align-justify\">Parameters&nbsp;− A parameter is like a placeholder. When a function is invoked, you pass a value to the parameter. This value is referred to as actual parameter or argument. The parameter list refers to the type, order, and number of the parameters of a function. Parameters are optional; that is, a function may contain no parameters.</li><li class=\"ql-align-justify\">Function Body&nbsp;− The function body contains a collection of statements that define what the function does.</li></ul><h2>Example</h2><p class=\"ql-align-justify\">Following is the source code for a function called&nbsp;max(). This function takes two parameters num1 and num2 and return the biggest of both −</p><pre class=\"ql-syntax\" spellcheck=\"false\">// function returning the max between two numbers\n \nint max(int num1, int num2) {\n   // local variable declaration\n   int result;\n \n   if (num1 &gt; num2)\n      result = num1;\n   else\n      result = num2;\n \n   return result; \n}\n</pre><h2>Function Declarations</h2><p class=\"ql-align-justify\">A function&nbsp;declaration&nbsp;tells the compiler about a function name and how to call the function. The actual body of the function can be defined separately.</p><p class=\"ql-align-justify\">A function declaration has the following parts −</p><pre class=\"ql-syntax\" spellcheck=\"false\">return_type function_name( parameter list );\n</pre><p class=\"ql-align-justify\">For the above defined function max(), following is the function declaration −</p><pre class=\"ql-syntax\" spellcheck=\"false\">int max(int num1, int num2);\n</pre><p class=\"ql-align-justify\">Parameter names are not important in function declaration only their type is required, so following is also valid declaration −</p><pre class=\"ql-syntax\" spellcheck=\"false\">int max(int, int);\n</pre><p class=\"ql-align-justify\">Function declaration is required when you define a function in one source file and you call that function in another file. In such case, you should declare the function at the top of the file calling the function.</p><h2>Calling a Function</h2><p class=\"ql-align-justify\">While creating a C++ function, you give a definition of what the function has to do. To use a function, you will have to call or invoke that function.</p><p class=\"ql-align-justify\">When a program calls a function, program control is transferred to the called function. A called function performs defined task and when it’s return statement is executed or when its function-ending closing brace is reached, it returns program control back to the main program.</p><p class=\"ql-align-justify\">To call a function, you simply need to pass the required parameters along with function name, and if function returns a value, then you can store returned value. For example −</p><pre class=\"ql-syntax\" spellcheck=\"false\">#include &lt;iostream&gt;\nusing namespace std;\n \n// function declaration\nint max(int num1, int num2);\n \nint main () {\n   // local variable declaration:\n   int a = 100;\n   int b = 200;\n   int ret;\n \n   // calling a function to get max value.\n   ret = max(a, b);\n   cout &lt;&lt; \"Max value is : \" &lt;&lt; ret &lt;&lt; endl;\n \n   return 0;\n}\n \n// function returning the max between two numbers\nint max(int num1, int num2) {\n   // local variable declaration\n   int result;\n \n   if (num1 &gt; num2)\n      result = num1;\n   else\n      result = num2;\n \n   return result; \n}\n</pre><p class=\"ql-align-justify\">I kept max() function along with main() function and compiled the source code. While running final executable, it would produce the following result −</p><pre class=\"ql-syntax\" spellcheck=\"false\">Max value is : 200\n</pre><h2>Function Arguments</h2><p class=\"ql-align-justify\">If a function is to use arguments, it must declare variables that accept the values of the arguments. These variables are called the&nbsp;formal parameters&nbsp;of the function.</p><p class=\"ql-align-justify\">The formal parameters behave like other local variables inside the function and are created upon entry into the function and destroyed upon exit.</p><p class=\"ql-align-justify\">While calling a function, there are two ways that arguments can be passed to a function −</p><p>Sr.NoCall Type &amp; Description1<a href=\"https://www.tutorialspoint.com/cplusplus/cpp_function_call_by_value.htm\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(49, 49, 49);\">Call by Value</a></p><p class=\"ql-align-justify\">This method copies the actual value of an argument into the formal parameter of the function. In this case, changes made to the parameter inside the function have no effect on the argument.</p><p>2<a href=\"https://www.tutorialspoint.com/cplusplus/cpp_function_call_by_pointer.htm\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(49, 49, 49);\">Call by Pointer</a></p><p class=\"ql-align-justify\">This method copies the address of an argument into the formal parameter. Inside the function, the address is used to access the actual argument used in the call. This means that changes made to the parameter affect the argument.</p><p>3<a href=\"https://www.tutorialspoint.com/cplusplus/cpp_function_call_by_reference.htm\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(49, 49, 49);\">Call by Reference</a></p><p class=\"ql-align-justify\">This method copies the reference of an argument into the formal parameter. Inside the function, the reference is used to access the actual argument used in the call. This means that changes made to the parameter affect the argument.</p><p class=\"ql-align-justify\">By default, C++ uses&nbsp;call by value&nbsp;to pass arguments. In general, this means that code within a function cannot alter the arguments used to call the function and above mentioned example while calling max() function used the same method.</p><h2>Default Values for Parameters</h2><p class=\"ql-align-justify\">When you define a function, you can specify a default value for each of the last parameters. This value will be used if the corresponding argument is left blank when calling to the function.</p><p class=\"ql-align-justify\">This is done by using the assignment operator and assigning values for the arguments in the function definition. If a value for that parameter is not passed when the function is called, the default given value is used, but if a value is specified, this default value is ignored and the passed value is used instead. Consider the following example −</p><p class=\"ql-align-right\"><a href=\"http://tpcg.io/KoJLUN\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(255, 255, 255); background-color: rgb(0, 68, 129);\">Live Demo</a></p><p class=\"ql-align-right\"><br></p><pre class=\"ql-syntax\" spellcheck=\"false\">#include &lt;iostream&gt;\nusing namespace std;\n \nint sum(int a, int b = 20) {\n   int result;\n   result = a + b;\n  \n   return (result);\n}\nint main () {\n   // local variable declaration:\n   int a = 100;\n   int b = 200;\n   int result;\n \n   // calling a function to add the values.\n   result = sum(a, b);\n   cout &lt;&lt; \"Total value is :\" &lt;&lt; result &lt;&lt; endl;\n\n   // calling a function again as follows.\n   result = sum(a);\n   cout &lt;&lt; \"Total value is :\" &lt;&lt; result &lt;&lt; endl;\n \n   return 0;\n}\n</pre><p class=\"ql-align-justify\">When the above code is compiled and executed, it produces the following result −</p><pre class=\"ql-syntax\" spellcheck=\"false\">Total value is :300\nTotal value is :120\n</pre><p><br></p>', '2021-02-22 08:14:02', '2021-02-22 08:14:02'),
(31, 1, 'C++ Data Structures', '<p class=\"ql-align-justify\">C/C++ arrays allow you to define variables that combine several data items of the same kind, but&nbsp;structure&nbsp;is another user defined data type which allows you to combine data items of different kinds.</p><p class=\"ql-align-justify\">Structures are used to represent a record, suppose you want to keep track of your books in a library. You might want to track the following attributes about each book −</p><ul><li>Title</li><li>Author</li><li>Subject</li><li>Book ID</li></ul><h2>Defining a Structure</h2><p class=\"ql-align-justify\">To define a structure, you must use the struct statement. The struct statement defines a new data type, with more than one member, for your program. The format of the struct statement is this −</p><pre class=\"ql-syntax\" spellcheck=\"false\">struct [structure tag] {\n   member definition;\n   member definition;\n   ...\n   member definition;\n} [one or more structure variables];  \n</pre><p class=\"ql-align-justify\">The&nbsp;structure tag&nbsp;is optional and each member definition is a normal variable definition, such as int i; or float f; or any other valid variable definition. At the end of the structure\'s definition, before the final semicolon, you can specify one or more structure variables but it is optional. Here is the way you would declare the Book structure −</p><pre class=\"ql-syntax\" spellcheck=\"false\">struct Books {\n   char  title[50];\n   char  author[50];\n   char  subject[100];\n   int   book_id;\n} book;  \n</pre><h2>Accessing Structure Members</h2><p class=\"ql-align-justify\">To access any member of a structure, we use the&nbsp;member access operator (.). The member access operator is coded as a period between the structure variable name and the structure member that we wish to access. You would use&nbsp;struct&nbsp;keyword to define variables of structure type. Following is the example to explain usage of structure −</p><p class=\"ql-align-right\"><a href=\"http://tpcg.io/zvIEi0\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(255, 255, 255); background-color: rgb(0, 68, 129);\">Live Demo</a></p><p class=\"ql-align-right\"><br></p><pre class=\"ql-syntax\" spellcheck=\"false\">#include &lt;iostream&gt;\n#include &lt;cstring&gt;\n \nusing namespace std;\n \nstruct Books {\n   char  title[50];\n   char  author[50];\n   char  subject[100];\n   int   book_id;\n};\n \nint main() {\n   struct Books Book1;        // Declare Book1 of type Book\n   struct Books Book2;        // Declare Book2 of type Book\n \n   // book 1 specification\n   strcpy( Book1.title, \"Learn C++ Programming\");\n   strcpy( Book1.author, \"Chand Miyan\"); \n   strcpy( Book1.subject, \"C++ Programming\");\n   Book1.book_id = 6495407;\n\n   // book 2 specification\n   strcpy( Book2.title, \"Telecom Billing\");\n   strcpy( Book2.author, \"Yakit Singha\");\n   strcpy( Book2.subject, \"Telecom\");\n   Book2.book_id = 6495700;\n \n   // Print Book1 info\n   cout &lt;&lt; \"Book 1 title : \" &lt;&lt; Book1.title &lt;&lt;endl;\n   cout &lt;&lt; \"Book 1 author : \" &lt;&lt; Book1.author &lt;&lt;endl;\n   cout &lt;&lt; \"Book 1 subject : \" &lt;&lt; Book1.subject &lt;&lt;endl;\n   cout &lt;&lt; \"Book 1 id : \" &lt;&lt; Book1.book_id &lt;&lt;endl;\n\n   // Print Book2 info\n   cout &lt;&lt; \"Book 2 title : \" &lt;&lt; Book2.title &lt;&lt;endl;\n   cout &lt;&lt; \"Book 2 author : \" &lt;&lt; Book2.author &lt;&lt;endl;\n   cout &lt;&lt; \"Book 2 subject : \" &lt;&lt; Book2.subject &lt;&lt;endl;\n   cout &lt;&lt; \"Book 2 id : \" &lt;&lt; Book2.book_id &lt;&lt;endl;\n\n   return 0;\n}\n</pre><p class=\"ql-align-justify\">When the above code is compiled and executed, it produces the following result −</p><pre class=\"ql-syntax\" spellcheck=\"false\">Book 1 title : Learn C++ Programming\nBook 1 author : Chand Miyan\nBook 1 subject : C++ Programming\nBook 1 id : 6495407\nBook 2 title : Telecom Billing\nBook 2 author : Yakit Singha\nBook 2 subject : Telecom\nBook 2 id : 6495700\n</pre><h2>Structures as Function Arguments</h2><p class=\"ql-align-justify\">You can pass a structure as a function argument in very similar way as you pass any other variable or pointer. You would access structure variables in the similar way as you have accessed in the above example −</p><p class=\"ql-align-right\"><a href=\"http://tpcg.io/xvb7BQ\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(255, 255, 255); background-color: rgb(0, 68, 129);\">Live Demo</a></p><p class=\"ql-align-right\"><br></p><pre class=\"ql-syntax\" spellcheck=\"false\">#include &lt;iostream&gt;\n#include &lt;cstring&gt;\n \nusing namespace std;\nvoid printBook( struct Books book );\n\nstruct Books {\n   char  title[50];\n   char  author[50];\n   char  subject[100];\n   int   book_id;\n};\n \nint main() {\n   struct Books Book1;        // Declare Book1 of type Book\n   struct Books Book2;        // Declare Book2 of type Book\n \n   // book 1 specification\n   strcpy( Book1.title, \"Learn C++ Programming\");\n   strcpy( Book1.author, \"Chand Miyan\"); \n   strcpy( Book1.subject, \"C++ Programming\");\n   Book1.book_id = 6495407;\n\n   // book 2 specification\n   strcpy( Book2.title, \"Telecom Billing\");\n   strcpy( Book2.author, \"Yakit Singha\");\n   strcpy( Book2.subject, \"Telecom\");\n   Book2.book_id = 6495700;\n \n   // Print Book1 info\n   printBook( Book1 );\n\n   // Print Book2 info\n   printBook( Book2 );\n\n   return 0;\n}\nvoid printBook( struct Books book ) {\n   cout &lt;&lt; \"Book title : \" &lt;&lt; book.title &lt;&lt;endl;\n   cout &lt;&lt; \"Book author : \" &lt;&lt; book.author &lt;&lt;endl;\n   cout &lt;&lt; \"Book subject : \" &lt;&lt; book.subject &lt;&lt;endl;\n   cout &lt;&lt; \"Book id : \" &lt;&lt; book.book_id &lt;&lt;endl;\n}\n</pre><p class=\"ql-align-justify\">When the above code is compiled and executed, it produces the following result −</p><pre class=\"ql-syntax\" spellcheck=\"false\">Book title : Learn C++ Programming\nBook author : Chand Miyan\nBook subject : C++ Programming\nBook id : 6495407\nBook title : Telecom Billing\nBook author : Yakit Singha\nBook subject : Telecom\nBook id : 6495700\n</pre><h2>Pointers to Structures</h2><p class=\"ql-align-justify\">You can define pointers to structures in very similar way as you define pointer to any other variable as follows −</p><pre class=\"ql-syntax\" spellcheck=\"false\">struct Books *struct_pointer;\n</pre><p class=\"ql-align-justify\">Now, you can store the address of a structure variable in the above defined pointer variable. To find the address of a structure variable, place the &amp; operator before the structure\'s name as follows −</p><pre class=\"ql-syntax\" spellcheck=\"false\">struct_pointer = &amp;Book1;\n</pre><p class=\"ql-align-justify\">To access the members of a structure using a pointer to that structure, you must use the -&gt; operator as follows −</p><pre class=\"ql-syntax\" spellcheck=\"false\">struct_pointer-&gt;title;\n</pre><p class=\"ql-align-justify\">Let us re-write above example using structure pointer, hope this will be easy for you to understand the concept −</p><p class=\"ql-align-right\"><a href=\"http://tpcg.io/P8IeUE\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(255, 255, 255); background-color: rgb(0, 68, 129);\">Live Demo</a></p><p class=\"ql-align-right\"><br></p><pre class=\"ql-syntax\" spellcheck=\"false\">#include &lt;iostream&gt;\n#include &lt;cstring&gt;\n \nusing namespace std;\nvoid printBook( struct Books *book );\n\nstruct Books {\n   char  title[50];\n   char  author[50];\n   char  subject[100];\n   int   book_id;\n};\nint main() {\n   struct Books Book1;        // Declare Book1 of type Book\n   struct Books Book2;        // Declare Book2 of type Book\n \n   // Book 1 specification\n   strcpy( Book1.title, \"Learn C++ Programming\");\n   strcpy( Book1.author, \"Chand Miyan\"); \n   strcpy( Book1.subject, \"C++ Programming\");\n   Book1.book_id = 6495407;\n\n   // Book 2 specification\n   strcpy( Book2.title, \"Telecom Billing\");\n   strcpy( Book2.author, \"Yakit Singha\");\n   strcpy( Book2.subject, \"Telecom\");\n   Book2.book_id = 6495700;\n \n   // Print Book1 info, passing address of structure\n   printBook( &amp;Book1 );\n\n   // Print Book1 info, passing address of structure\n   printBook( &amp;Book2 );\n\n   return 0;\n}\n\n// This function accept pointer to structure as parameter.\nvoid printBook( struct Books *book ) {\n   cout &lt;&lt; \"Book title : \" &lt;&lt; book-&gt;title &lt;&lt;endl;\n   cout &lt;&lt; \"Book author : \" &lt;&lt; book-&gt;author &lt;&lt;endl;\n   cout &lt;&lt; \"Book subject : \" &lt;&lt; book-&gt;subject &lt;&lt;endl;\n   cout &lt;&lt; \"Book id : \" &lt;&lt; book-&gt;book_id &lt;&lt;endl;\n}\n</pre><p class=\"ql-align-justify\">When the above code is compiled and executed, it produces the following result −</p><pre class=\"ql-syntax\" spellcheck=\"false\">Book title : Learn C++ Programming\nBook author : Chand Miyan\nBook subject : C++ Programming\nBook id : 6495407\nBook title : Telecom Billing\nBook author : Yakit Singha\nBook subject : Telecom\nBook id : 6495700\n</pre><h2>The typedef Keyword</h2><p class=\"ql-align-justify\">There is an easier way to define structs or you could \"alias\" types you create. For example −</p><pre class=\"ql-syntax\" spellcheck=\"false\">typedef struct {\n   char  title[50];\n   char  author[50];\n   char  subject[100];\n   int   book_id;\n} Books;\n</pre><p class=\"ql-align-justify\">Now, you can use&nbsp;<em>Books</em>&nbsp;directly to define variables of&nbsp;<em>Books</em>&nbsp;type without using struct keyword. Following is the example −</p><pre class=\"ql-syntax\" spellcheck=\"false\">Books Book1, Book2;\n</pre><p class=\"ql-align-justify\">You can use&nbsp;typedef&nbsp;keyword for non-structs as well as follows −</p><pre class=\"ql-syntax\" spellcheck=\"false\">typedef long int *pint32;\n \npint32 x, y, z;\n</pre><p class=\"ql-align-justify\">x, y and z are all pointers to long ints.</p><p><br></p>', '2021-02-22 08:15:11', '2021-02-22 08:15:11'),
(32, 3, 'VueJS - Introduction', '<p class=\"ql-align-justify\">Vue&nbsp;is a JavaScript framework for building user interfaces. Its core part is focused mainly on the view layer and it is very easy to understand. The version of Vue that we are going to use in this tutorial is 2.0.</p><p class=\"ql-align-justify\">As Vue is basically built for frontend development, we are going to deal with lot of HTML, JavaScript and CSS files in the upcoming chapters. To understand the details, let us start with a simple example.</p><p class=\"ql-align-justify\">In this example, we are going to use the development verison of vuejs.</p><h2>Example</h2><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;html&gt;\n   &lt;head&gt;\n      &lt;title&gt;VueJs Introduction&lt;/title&gt;\n      &lt;script type = \"text/javascript\" src = \"js/vue.js\"&gt;&lt;/script&gt;\n   &lt;/head&gt;\n   &lt;body&gt;\n      &lt;div id = \"intro\" style = \"text-align:center;\"&gt;\n         &lt;h1&gt;{{ message }}&lt;/h1&gt;\n      &lt;/div&gt;\n      &lt;script type = \"text/javascript\"&gt;\n         var vue_det = new Vue({\n            el: \'#intro\',\n            data: {\n               message: \'My first VueJS Task\'\n            }\n         });\n      &lt;/script&gt;\n   &lt;/body&gt;\n&lt;/html&gt;\n</pre><p><br></p>', '2021-02-23 23:18:10', '2021-02-23 23:18:10'),
(33, 7, 'VueJS - Introduction', '<p class=\"ql-align-justify\">Vue&nbsp;is a JavaScript framework for building user interfaces. Its core part is focused mainly on the view layer and it is very easy to understand. The version of Vue that we are going to use in this tutorial is 2.0.</p><p class=\"ql-align-justify\">As Vue is basically built for frontend development, we are going to deal with lot of HTML, JavaScript and CSS files in the upcoming chapters. To understand the details, let us start with a simple example.</p><p class=\"ql-align-justify\">In this example, we are going to use the development verison of vuejs.</p><h2>Example</h2><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;html&gt;\n   &lt;head&gt;\n      &lt;title&gt;VueJs Introduction&lt;/title&gt;\n      &lt;script type = \"text/javascript\" src = \"js/vue.js\"&gt;&lt;/script&gt;\n   &lt;/head&gt;\n   &lt;body&gt;\n      &lt;div id = \"intro\" style = \"text-align:center;\"&gt;\n         &lt;h1&gt;{{ message }}&lt;/h1&gt;\n      &lt;/div&gt;\n      &lt;script type = \"text/javascript\"&gt;\n         var vue_det = new Vue({\n            el: \'#intro\',\n            data: {\n               message: \'My first VueJS Task\'\n            }\n         });\n      &lt;/script&gt;\n   &lt;/body&gt;\n&lt;/html&gt;\n</pre><p><br></p>', '2021-02-23 23:49:38', '2021-02-23 23:49:38'),
(34, 7, 'VueJS - Template', '<p class=\"ql-align-justify\">We have learnt in the earlier chapters, how to get an output in the form of text content on the screen. In this chapter, we will learn how to get an output in the form of HTML template on the screen.</p><p class=\"ql-align-justify\">To understand this, let us consider an example and see the output in the browser.</p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;html&gt;\n   &lt;head&gt;\n      &lt;title&gt;VueJs Instance&lt;/title&gt;\n      &lt;script type = \"text/javascript\" src = \"js/vue.js\"&gt;&lt;/script&gt;\n   &lt;/head&gt;\n   &lt;body&gt;\n      &lt;div id = \"vue_det\"&gt;\n         &lt;h1&gt;Firstname : {{firstname}}&lt;/h1&gt;\n         &lt;h1&gt;Lastname : {{lastname}}&lt;/h1&gt;\n         &lt;div&gt;{{htmlcontent}}&lt;/div&gt;\n      &lt;/div&gt;\n      &lt;script type = \"text/javascript\" src = \"js/vue_template.js\"&gt;&lt;/script&gt;\n   &lt;/body&gt;\n&lt;/html&gt;\n</pre><h3>vue_template.js</h3><pre class=\"ql-syntax\" spellcheck=\"false\">var vm = new Vue({\n   el: \'#vue_det\',\n   data: {\n      firstname : \"Ria\",\n      lastname  : \"Singh\",\n      htmlcontent : \"&lt;div&gt;&lt;h1&gt;Vue Js Template&lt;/h1&gt;&lt;/div&gt;\"\n   }\n})\n</pre><p class=\"ql-align-justify\">Now, suppose we want to show the html content on the page. If we happen to use it with interpolation, i.e. with double curly brackets, this is what we will get in the browser.</p><p><br></p>', '2021-02-23 23:51:13', '2021-02-23 23:51:13');

-- --------------------------------------------------------

--
-- Table structure for table `course_progress_reports`
--

CREATE TABLE `course_progress_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lession_id` bigint(20) UNSIGNED NOT NULL,
  `marks_percent` double(8,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_progress_reports`
--

INSERT INTO `course_progress_reports` (`id`, `user_id`, `course_id`, `lession_id`, `marks_percent`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 2, 100.00, 1, '2021-02-26 09:07:59', '2021-02-26 12:43:51');

-- --------------------------------------------------------

--
-- Table structure for table `course_questions`
--

CREATE TABLE `course_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`question_options`)),
  `question_answers` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `lession_id` bigint(20) UNSIGNED NOT NULL,
  `question_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`options`)),
  `answer` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_questions`
--

INSERT INTO `exam_questions` (`id`, `course_id`, `lession_id`, `question_body`, `options`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'How much memory \"int\" data type takes to store the value in memory?', '\"1byte,2byte,3byte,4byte\"', 4, '2021-02-22 08:26:09', '2021-02-22 08:26:09'),
(3, 1, 27, 'What is the purpose of the operator in bracket, (%)?', '\"Adds two operands,Divides numerator by de-numerator,Modulus Operator and remainder of after an integer division,Increment operator, increases integer value by one\"', 3, '2021-02-22 08:36:36', '2021-02-22 08:36:36'),
(4, 1, 29, 'How many loops are there in C++?', '\"1,2,3,4\"', 4, '2021-02-22 08:41:00', '2021-02-22 08:41:00'),
(5, 1, 30, 'In how many ways arguments can be passed to a function?', '\"1,2,3,4\"', 3, '2021-02-22 09:50:30', '2021-02-22 09:50:30'),
(6, 1, 2, 'How to define string in C++?', '\"var,int,char,float\"', 3, '2021-02-26 09:06:02', '2021-02-26 09:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `suggested` int(11) NOT NULL,
  `wrong` int(11) DEFAULT NULL,
  `wrong_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`wrong_ids`)),
  `right` int(11) DEFAULT NULL,
  `feedback` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interest_surveys`
--

CREATE TABLE `interest_surveys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `categories` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`categories`)),
  `sub_categories` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`sub_categories`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_11_11_143402_create_admin_profiles_table', 1),
(5, '2020_11_11_143515_create_categories_table', 1),
(6, '2020_11_11_143630_create_blog_comments_table', 1),
(7, '2020_11_11_143701_create_contributor_profiles_table', 1),
(8, '2020_11_11_143929_create_course_exams_table', 1),
(9, '2020_11_11_143950_create_blog_posts_table', 1),
(10, '2020_11_11_144036_create_course_questions_table', 1),
(11, '2020_11_11_144119_create_question_and_answers_table', 1),
(12, '2020_11_11_144143_create_student_profiles_table', 1),
(13, '2020_11_11_144221_create_blog_tags_table', 1),
(14, '2020_11_11_144325_create_tutorials_table', 1),
(15, '2020_11_11_144340_create_tutorial_comments_table', 1),
(16, '2020_12_07_152208_create_sub_categories_table', 1),
(17, '2020_12_07_152806_create_courses_table', 1),
(18, '2020_12_07_152934_create_course_lessons_table', 1),
(19, '2020_12_23_145626_create_questions_table', 2),
(20, '2020_12_23_145652_create_answers_table', 2),
(21, '2021_01_20_101026_create_ratings_table', 3),
(22, '2021_02_15_143929_create_course_exams_table', 4),
(23, '2021_02_15_171650_create_exam_questions_table', 4),
(24, '2021_02_15_171810_create_course_progress_reports_table', 4),
(25, '2021_02_20_143929_create_course_exams_table', 5),
(26, '2021_03_12_160949_create_career_paths_table', 6),
(27, '2021_05_23_181107_create_feedback_table', 7),
(28, '2021_08_23_180659_create_interest_surveys_table', 7),
(29, '2021_09_24_095313_create_survey_questions_table', 7),
(30, '2021_09_24_120522_add_new_to_users_table', 7),
(31, '2021_09_24_173556_add_link_to_course_lessons_table', 7),
(32, '2021_10_29_175627_add_twofields_to_courses_table', 7),
(33, '2018_12_23_120000_create_shoppingcart_table', 8),
(34, '2021_11_02_183643_create_orders_table', 9),
(35, '2021_11_03_183643_create_orders_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `product_ids` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `phone`, `amount`, `product_ids`, `status`, `transaction_id`, `currency`, `created_at`, `updated_at`) VALUES
(13, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 10000, '[2]', 'Processing', '6182dd21c7421', 'BDT', NULL, NULL),
(14, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 10000, '[2]', 'Processing', '6182dd49b9167', 'BDT', NULL, NULL),
(15, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 10000, '[2]', 'Processing', '6182ddb78ea7a', 'BDT', NULL, NULL),
(16, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 20000, '[15]', 'Processing', '61841de7af946', 'BDT', NULL, NULL),
(17, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 20000, '[15]', 'Pending', '61841ea61b4d3', 'BDT', '2021-11-04 17:55:50', '2021-11-04 17:55:50'),
(18, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 20000, '[15]', 'Pending', '61841efb15d77', 'BDT', '2021-11-04 17:57:15', '2021-11-04 17:57:15'),
(19, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 20000, '[15]', 'Processing', '61841f8cb7587', 'BDT', '2021-11-04 17:59:40', '2021-11-04 17:59:50'),
(20, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 20000, '[15]', 'Processing', '618420061a2e1', 'BDT', '2021-11-04 18:01:42', '2021-11-04 18:01:52'),
(21, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 10000, '[2]', 'Pending', '618420613479f', 'BDT', '2021-11-04 18:03:13', '2021-11-04 18:03:13'),
(22, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 10000, '[2]', 'Processing', '61842107f2be0', 'BDT', '2021-11-04 18:05:59', '2021-11-04 18:06:08'),
(23, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 10000, '[2]', 'Processing', '618421b0aafa8', 'BDT', '2021-11-04 18:08:48', '2021-11-04 18:08:57'),
(24, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 10000, '[2]', 'Processing', '6184227ce860e', 'BDT', '2021-11-04 18:12:12', '2021-11-04 18:12:22'),
(25, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 20000, '[15]', 'Processing', '618423d1dcd60', 'BDT', '2021-11-04 18:17:53', '2021-11-04 18:18:04'),
(26, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 10000, '[2]', 'Processing', '618424bb650e0', 'BDT', '2021-11-04 18:21:47', '2021-11-04 18:21:55'),
(27, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 10000, '[2]', 'Processing', '618425599b0e9', 'BDT', '2021-11-04 18:24:25', '2021-11-04 18:24:34'),
(28, 'mursalin', 'mursalinemon@example.com', '8801XXXXXXXXX', 10000, '[2]', 'Processing', '618425da8a41b', 'BDT', '2021-11-04 18:26:34', '2021-11-04 18:26:42'),
(29, 'Lizeth Heaney', 'eabbott@example.com', '8801XXXXXXXXX', 20000, '[15]', 'Processing', '61bcbb069e2bc', 'BDT', '2021-12-17 16:29:58', '2021-12-17 16:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asked_by` bigint(20) UNSIGNED NOT NULL,
  `answered_by` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`answered_by`)),
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `asked_by`, `answered_by`, `question`, `body`, `topic`, `tags`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 'collaborative filtering  php', '<p>fcsdfsdgvf</p>', 'collaborative filtering', '[\"vsv\"]', '2021-01-02 11:58:29', '2021-01-02 11:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `question_and_answers`
--

CREATE TABLE `question_and_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `course_id`, `student_id`, `rating`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 4, '2021-01-26 09:57:11', '2021-01-26 09:57:11'),
(2, 5, 2, 5, '2021-01-26 10:58:34', '2021-01-26 10:58:34'),
(3, 3, 2, 4, '2021-01-26 11:13:20', '2021-01-26 11:13:20'),
(4, 2, 3, 3, '2021-01-26 11:13:58', '2021-01-26 11:13:58'),
(5, 6, 3, 4, '2021-01-26 11:14:10', '2021-01-26 11:14:10'),
(6, 1, 34, 3, '2021-01-26 11:15:40', '2021-01-26 11:15:40'),
(7, 13, 34, 4, '2021-01-26 11:16:05', '2021-01-26 11:16:05'),
(8, 12, 34, 3, '2021-01-26 11:16:20', '2021-01-26 11:16:20'),
(9, 9, 35, 5, '2021-01-26 11:16:52', '2021-01-26 11:16:52'),
(10, 3, 35, 4, '2021-01-26 11:17:12', '2021-01-26 11:17:12'),
(11, 8, 35, 4, '2021-01-26 11:17:24', '2021-01-26 11:17:24'),
(12, 10, 35, 5, '2021-01-26 11:17:35', '2021-01-26 11:17:35'),
(13, 11, 35, 4, '2021-01-26 11:17:44', '2021-01-26 11:17:44'),
(14, 1, 36, 2, '2021-01-26 11:18:16', '2021-01-26 11:18:16'),
(15, 10, 36, 4, '2021-01-26 11:18:28', '2021-01-26 11:18:28'),
(16, 13, 36, 5, '2021-01-26 11:18:36', '2021-01-26 11:18:36'),
(17, 12, 36, 5, '2021-01-26 11:18:48', '2021-01-26 11:18:48'),
(18, 2, 37, 5, '2021-01-26 11:19:25', '2021-01-26 11:19:25'),
(19, 6, 37, 4, '2021-01-26 11:19:37', '2021-01-26 11:19:37'),
(20, 14, 37, 4, '2021-01-26 11:19:47', '2021-01-26 11:19:47'),
(21, 1, 38, 4, '2021-01-26 11:20:16', '2021-01-26 11:20:16'),
(22, 10, 38, 5, '2021-01-26 11:20:24', '2021-01-26 11:20:24'),
(23, 14, 38, 4, '2021-01-26 11:20:33', '2021-01-26 11:20:33'),
(24, 2, 39, 2, '2021-01-26 11:21:04', '2021-01-26 11:21:04'),
(25, 8, 39, 5, '2021-01-26 11:21:23', '2021-01-26 11:21:23'),
(26, 9, 39, 5, '2021-01-26 11:21:33', '2021-01-26 11:21:33'),
(27, 11, 39, 3, '2021-01-26 11:21:44', '2021-01-26 11:21:44'),
(28, 4, 40, 4, '2021-01-26 11:23:55', '2021-01-26 11:23:55'),
(29, 5, 40, 5, '2021-01-26 11:24:04', '2021-01-26 11:24:04'),
(30, 14, 40, 3, '2021-01-26 11:24:20', '2021-01-26 11:24:20'),
(31, 2, 41, 5, '2021-01-26 11:24:51', '2021-01-26 11:24:51'),
(32, 6, 41, 4, '2021-01-26 11:25:00', '2021-01-26 11:25:00'),
(33, 9, 41, 4, '2021-01-26 11:25:20', '2021-01-26 11:25:20'),
(34, 11, 41, 4, '2021-01-26 11:25:40', '2021-01-26 11:25:40'),
(35, 3, 41, 5, '2021-01-26 11:25:52', '2021-01-26 11:25:52'),
(36, 2, 42, 5, '2021-01-26 11:27:55', '2021-01-26 11:27:55'),
(37, 14, 42, 2, '2021-01-26 11:28:03', '2021-01-26 11:28:03'),
(38, 2, 43, 5, '2021-01-26 11:29:21', '2021-01-26 11:29:21'),
(39, 6, 43, 5, '2021-01-26 11:29:28', '2021-01-26 11:29:28'),
(40, 14, 43, 3, '2021-01-26 11:29:37', '2021-01-26 11:29:37'),
(41, 2, 44, 4, '2021-01-26 11:30:12', '2021-01-26 11:30:12'),
(42, 6, 44, 4, '2021-01-26 11:30:20', '2021-01-26 11:30:20'),
(43, 1, 45, 5, '2021-01-26 11:30:47', '2021-01-26 11:30:47'),
(44, 13, 45, 4, '2021-01-26 11:30:55', '2021-01-26 11:30:55'),
(45, 12, 45, 5, '2021-01-26 11:31:04', '2021-01-26 11:31:04'),
(46, 14, 45, 3, '2021-01-26 11:31:13', '2021-01-26 11:31:13'),
(47, 3, 46, 5, '2021-01-26 11:31:36', '2021-01-26 11:31:36'),
(48, 9, 46, 5, '2021-01-26 11:31:45', '2021-01-26 11:31:45'),
(49, 8, 46, 3, '2021-01-26 11:31:55', '2021-01-26 11:31:55'),
(50, 11, 46, 5, '2021-01-26 11:32:05', '2021-01-26 11:32:05'),
(51, 9, 47, 5, '2021-01-26 11:33:57', '2021-01-26 11:33:57'),
(52, 11, 47, 5, '2021-01-26 11:34:06', '2021-01-26 11:34:06'),
(53, 3, 47, 5, '2021-01-26 11:50:47', '2021-01-26 11:50:47'),
(54, 1, 48, 5, '2021-01-26 11:51:19', '2021-01-26 11:51:19'),
(55, 2, 49, 5, '2021-01-26 11:51:51', '2021-01-26 11:51:51'),
(56, 6, 49, 4, '2021-01-26 11:51:59', '2021-01-26 11:51:59'),
(57, 11, 49, 3, '2021-01-26 11:52:07', '2021-01-26 11:52:07'),
(58, 9, 49, 4, '2021-01-26 11:52:17', '2021-01-26 11:52:17'),
(59, 4, 50, 4, '2021-01-26 11:52:51', '2021-01-26 11:52:51'),
(60, 5, 50, 5, '2021-01-26 11:53:00', '2021-01-26 11:53:00'),
(61, 14, 50, 3, '2021-01-26 11:53:14', '2021-01-26 11:53:14'),
(62, 1, 51, 4, '2021-01-26 11:53:45', '2021-01-26 11:53:45'),
(63, 10, 51, 4, '2021-01-26 11:53:54', '2021-01-26 11:53:54'),
(64, 13, 51, 4, '2021-01-26 11:54:04', '2021-01-26 11:54:04'),
(65, 12, 51, 5, '2021-01-26 11:54:13', '2021-01-26 11:54:13'),
(66, 2, 52, 4, '2021-01-26 11:54:47', '2021-01-26 11:54:47'),
(67, 1, 52, 3, '2021-01-26 11:54:55', '2021-01-26 11:54:55'),
(68, 14, 52, 4, '2021-01-26 11:55:04', '2021-01-26 11:55:04'),
(149, 1, 22, 5, '2021-02-05 11:36:53', '2021-02-05 11:36:53'),
(150, 13, 22, 4, '2021-02-05 11:37:57', '2021-02-05 11:37:57'),
(151, 12, 22, 5, '2021-02-05 11:38:05', '2021-02-05 11:38:05'),
(152, 2, 23, 4, '2021-02-05 11:40:26', '2021-02-05 11:40:26'),
(153, 6, 23, 4, '2021-02-05 11:40:33', '2021-02-05 11:40:33'),
(154, 2, 24, 5, '2021-02-05 11:41:15', '2021-02-05 11:41:15'),
(155, 3, 25, 5, '2021-02-05 11:41:49', '2021-02-05 11:41:49'),
(156, 3, 26, 4, '2021-02-05 11:49:53', '2021-02-05 11:49:53'),
(157, 4, 26, 3, '2021-02-05 11:50:02', '2021-02-05 11:50:02'),
(158, 4, 27, 3, '2021-02-05 11:50:30', '2021-02-05 11:50:30'),
(159, 5, 27, 5, '2021-02-05 11:50:37', '2021-02-05 11:50:37'),
(160, 2, 28, 4, '2021-02-05 11:51:10', '2021-02-05 11:51:10'),
(161, 3, 28, 2, '2021-02-05 11:51:18', '2021-02-05 11:51:18'),
(162, 2, 29, 4, '2021-02-05 12:13:26', '2021-02-05 12:13:26'),
(163, 3, 30, 5, '2021-02-05 12:14:41', '2021-02-05 12:14:41'),
(164, 8, 30, 3, '2021-02-05 12:14:56', '2021-02-05 12:14:56'),
(165, 9, 31, 3, '2021-02-05 12:16:00', '2021-02-05 12:16:00'),
(166, 11, 31, 3, '2021-02-05 12:16:07', '2021-02-05 12:16:07'),
(167, 3, 31, 5, '2021-02-05 12:16:15', '2021-02-05 12:16:15'),
(168, 1, 32, 5, '2021-02-05 12:16:41', '2021-02-05 12:16:41'),
(169, 9, 33, 3, '2021-02-05 12:17:18', '2021-02-05 12:17:18'),
(170, 11, 33, 4, '2021-02-05 12:17:27', '2021-02-05 12:17:27'),
(171, 3, 33, 4, '2021-02-05 12:17:35', '2021-02-05 12:17:35'),
(172, 4, 34, 3, '2021-02-05 12:18:05', '2021-02-05 12:18:05'),
(173, 5, 34, 4, '2021-02-05 12:18:13', '2021-02-05 12:18:13'),
(174, 3, 34, 3, '2021-02-05 12:18:21', '2021-02-05 12:18:21'),
(175, 9, 34, 3, '2021-02-05 12:18:33', '2021-02-05 12:18:33'),
(176, 11, 34, 4, '2021-02-05 12:18:42', '2021-02-05 12:18:42'),
(177, 14, 34, 4, '2021-02-05 12:18:51', '2021-02-05 12:18:51'),
(178, 14, 36, 4, '2021-02-05 12:24:06', '2021-02-05 12:24:06'),
(179, 4, 37, 3, '2021-02-05 12:24:29', '2021-02-05 12:24:29'),
(180, 5, 37, 5, '2021-02-05 12:24:37', '2021-02-05 12:24:37'),
(181, 11, 37, 3, '2021-02-05 12:25:56', '2021-02-05 12:25:56'),
(182, 9, 37, 4, '2021-02-05 12:26:05', '2021-02-05 12:26:05'),
(183, 13, 38, 3, '2021-02-05 12:26:48', '2021-02-05 12:26:48'),
(184, 12, 38, 5, '2021-02-05 12:26:57', '2021-02-05 12:26:57'),
(185, 2, 40, 4, '2021-02-05 12:31:08', '2021-02-05 12:31:08'),
(186, 6, 40, 5, '2021-02-05 12:31:15', '2021-02-05 12:31:15'),
(187, 6, 39, 5, '2021-02-05 12:34:15', '2021-02-05 12:34:15'),
(188, 14, 39, 4, '2021-02-05 12:34:24', '2021-02-05 12:34:24'),
(189, 4, 41, 3, '2021-02-05 12:34:56', '2021-02-05 12:34:56'),
(190, 5, 41, 4, '2021-02-05 12:35:05', '2021-02-05 12:35:05'),
(191, 4, 42, 3, '2021-02-05 12:36:01', '2021-02-05 12:36:01'),
(192, 5, 42, 5, '2021-02-05 12:36:09', '2021-02-05 12:36:09'),
(193, 9, 43, 4, '2021-02-05 12:37:09', '2021-02-05 12:37:09'),
(194, 11, 43, 4, '2021-02-05 12:37:17', '2021-02-05 12:37:17'),
(195, 3, 43, 4, '2021-02-05 12:37:24', '2021-02-05 12:37:24'),
(196, 9, 44, 4, '2021-02-05 22:54:30', '2021-02-05 22:54:30'),
(197, 11, 44, 3, '2021-02-05 22:54:40', '2021-02-05 22:54:40'),
(198, 3, 44, 4, '2021-02-05 22:54:49', '2021-02-05 22:54:49'),
(199, 4, 46, 3, '2021-02-05 22:56:11', '2021-02-05 22:56:11'),
(200, 5, 46, 5, '2021-02-05 22:56:19', '2021-02-05 22:56:19'),
(201, 1, 47, 3, '2021-02-05 22:57:30', '2021-02-05 22:57:30'),
(202, 2, 47, 5, '2021-02-05 22:57:38', '2021-02-05 22:57:38'),
(203, 2, 48, 4, '2021-02-05 22:58:07', '2021-02-05 22:58:07'),
(204, 6, 48, 5, '2021-02-05 22:58:14', '2021-02-05 22:58:14'),
(205, 3, 48, 3, '2021-02-05 22:58:31', '2021-02-05 22:58:31'),
(206, 4, 49, 3, '2021-02-05 22:59:21', '2021-02-05 22:59:21'),
(207, 5, 49, 5, '2021-02-05 22:59:27', '2021-02-05 22:59:27'),
(208, 9, 50, 4, '2021-02-05 23:03:32', '2021-02-05 23:03:32'),
(209, 4, 51, 4, '2021-02-05 23:04:08', '2021-02-05 23:04:08'),
(210, 5, 51, 5, '2021-02-05 23:04:16', '2021-02-05 23:04:16'),
(211, 3, 51, 4, '2021-02-05 23:04:27', '2021-02-05 23:04:27'),
(212, 9, 51, 3, '2021-02-05 23:04:36', '2021-02-05 23:04:36'),
(213, 11, 51, 4, '2021-02-05 23:04:45', '2021-02-05 23:04:45'),
(214, 3, 52, 5, '2021-02-05 23:05:17', '2021-02-05 23:05:17'),
(215, 8, 52, 2, '2021-02-05 23:05:25', '2021-02-05 23:05:25'),
(216, 9, 52, 3, '2021-02-05 23:05:35', '2021-02-05 23:05:35'),
(217, 11, 52, 4, '2021-02-05 23:05:45', '2021-02-05 23:05:45'),
(218, 2, 103, 5, '2021-02-23 23:54:38', '2021-02-23 23:54:38'),
(219, 6, 103, 4, '2021-02-23 23:55:25', '2021-02-23 23:55:25'),
(220, 14, 103, 3, '2021-02-23 23:55:35', '2021-02-23 23:55:35'),
(221, 3, 103, 1, '2021-02-23 23:55:46', '2021-02-23 23:55:46'),
(222, 7, 104, 4, '2021-02-23 23:57:18', '2021-02-23 23:57:18'),
(223, 4, 104, 4, '2021-02-23 23:57:30', '2021-02-23 23:57:30'),
(224, 5, 104, 5, '2021-02-23 23:57:37', '2021-02-23 23:57:37'),
(225, 14, 104, 1, '2021-02-23 23:57:47', '2021-02-23 23:57:47'),
(226, 3, 104, 3, '2021-02-23 23:57:58', '2021-02-23 23:57:58'),
(227, 2, 105, 5, '2021-02-24 00:13:07', '2021-02-24 00:13:07'),
(228, 6, 105, 4, '2021-02-24 00:13:15', '2021-02-24 00:13:15'),
(229, 13, 105, 5, '2021-02-24 00:13:28', '2021-02-24 00:13:28'),
(230, 1, 105, 1, '2021-02-24 00:13:36', '2021-02-24 00:13:36'),
(231, 14, 105, 3, '2021-02-24 00:13:47', '2021-02-24 00:13:47'),
(232, 1, 106, 3, '2021-02-24 00:14:36', '2021-02-24 00:14:36'),
(233, 13, 106, 4, '2021-02-24 00:14:43', '2021-02-24 00:14:43'),
(234, 12, 106, 5, '2021-02-24 00:14:50', '2021-02-24 00:14:50'),
(235, 1, 107, 5, '2021-02-24 00:15:39', '2021-02-24 00:15:39'),
(236, 13, 107, 3, '2021-02-24 00:15:46', '2021-02-24 00:15:46'),
(237, 12, 107, 5, '2021-02-24 00:15:54', '2021-02-24 00:15:54'),
(238, 2, 108, 5, '2021-02-24 00:37:53', '2021-02-24 00:37:53'),
(239, 1, 108, 3, '2021-02-24 00:38:08', '2021-02-24 00:38:08'),
(240, 13, 108, 2, '2021-02-24 00:38:17', '2021-02-24 00:38:17'),
(241, 14, 108, 4, '2021-02-24 00:38:29', '2021-02-24 00:38:29'),
(242, 2, 110, 5, '2021-02-24 02:03:49', '2021-02-24 02:03:49'),
(243, 6, 110, 4, '2021-02-24 02:03:58', '2021-02-24 02:03:58'),
(244, 1, 111, 3, '2021-02-24 02:10:11', '2021-02-24 02:10:11'),
(245, 13, 111, 4, '2021-02-24 02:10:19', '2021-02-24 02:10:19'),
(246, 12, 111, 5, '2021-02-24 02:10:26', '2021-02-24 02:10:26'),
(247, 4, 112, 4, '2021-02-24 02:18:02', '2021-02-24 02:18:02'),
(248, 5, 112, 5, '2021-02-24 02:18:08', '2021-02-24 02:18:08'),
(249, 3, 112, 5, '2021-02-24 02:18:15', '2021-02-24 02:18:15'),
(250, 7, 112, 4, '2021-02-24 02:18:22', '2021-02-24 02:18:22'),
(251, 9, 112, 3, '2021-02-24 02:18:29', '2021-02-24 02:18:29'),
(252, 11, 112, 4, '2021-02-24 02:18:37', '2021-02-24 02:18:37'),
(253, 14, 112, 5, '2021-02-24 02:18:45', '2021-02-24 02:18:45'),
(254, 9, 113, 4, '2021-02-24 02:22:44', '2021-02-24 02:22:44'),
(255, 11, 113, 5, '2021-02-24 02:22:53', '2021-02-24 02:22:53'),
(256, 3, 113, 5, '2021-02-24 02:23:03', '2021-02-24 02:23:03'),
(257, 8, 113, 3, '2021-02-24 02:23:10', '2021-02-24 02:23:10'),
(258, 1, 113, 1, '2021-02-24 02:23:21', '2021-02-24 02:23:21'),
(259, 1, 114, 5, '2021-02-24 02:31:12', '2021-02-24 02:31:12'),
(260, 13, 114, 4, '2021-02-24 02:31:19', '2021-02-24 02:31:19'),
(261, 12, 114, 5, '2021-02-24 02:31:26', '2021-02-24 02:31:26'),
(262, 1, 109, 2, '2021-02-24 02:33:31', '2021-02-24 02:33:31'),
(263, 6, 109, 5, '2021-02-24 02:33:38', '2021-02-24 02:33:38'),
(264, 2, 109, 5, '2021-02-24 02:33:46', '2021-02-24 02:33:46'),
(265, 13, 115, 4, '2021-02-24 02:35:22', '2021-02-24 02:35:22'),
(266, 2, 115, 5, '2021-02-24 02:35:30', '2021-02-24 02:35:30'),
(267, 6, 115, 2, '2021-02-24 02:35:37', '2021-02-24 02:35:37'),
(268, 12, 115, 5, '2021-02-24 02:35:47', '2021-02-24 02:35:47'),
(269, 10, 115, 4, '2021-02-24 02:35:54', '2021-02-24 02:35:54'),
(270, 14, 115, 5, '2021-02-24 02:36:01', '2021-02-24 02:36:01'),
(271, 1, 116, 5, '2021-02-24 02:37:00', '2021-02-24 02:37:00'),
(272, 4, 116, 5, '2021-02-24 02:37:07', '2021-02-24 02:37:07'),
(273, 3, 116, 3, '2021-02-24 02:37:14', '2021-02-24 02:37:14'),
(274, 5, 116, 5, '2021-02-24 02:37:22', '2021-02-24 02:37:22'),
(275, 14, 116, 4, '2021-02-24 02:37:29', '2021-02-24 02:37:29'),
(276, 13, 117, 4, '2021-02-24 02:38:26', '2021-02-24 02:38:26'),
(277, 12, 117, 5, '2021-02-24 02:38:32', '2021-02-24 02:38:32'),
(278, 14, 117, 4, '2021-02-24 02:38:40', '2021-02-24 02:38:40'),
(279, 2, 118, 4, '2021-02-24 02:39:28', '2021-02-24 02:39:28'),
(280, 13, 118, 5, '2021-02-24 02:39:35', '2021-02-24 02:39:35'),
(281, 12, 118, 5, '2021-02-24 02:39:42', '2021-02-24 02:39:42'),
(282, 3, 119, 5, '2021-02-24 02:40:28', '2021-02-24 02:40:28'),
(283, 7, 119, 5, '2021-02-24 02:40:35', '2021-02-24 02:40:35'),
(284, 9, 119, 3, '2021-02-24 02:40:48', '2021-02-24 02:40:48'),
(285, 11, 119, 4, '2021-02-24 02:40:56', '2021-02-24 02:40:56'),
(286, 1, 120, 3, '2021-02-24 22:22:51', '2021-02-24 22:22:51'),
(287, 13, 120, 4, '2021-02-24 22:22:59', '2021-02-24 22:22:59'),
(288, 12, 120, 5, '2021-02-24 22:23:06', '2021-02-24 22:23:06'),
(289, 4, 121, 4, '2021-02-24 22:23:53', '2021-02-24 22:23:53'),
(290, 5, 121, 5, '2021-02-24 22:24:00', '2021-02-24 22:24:00'),
(291, 2, 121, 5, '2021-02-24 22:24:07', '2021-02-24 22:24:07'),
(292, 3, 121, 4, '2021-02-24 22:24:40', '2021-02-24 22:24:40'),
(293, 9, 122, 5, '2021-02-24 22:26:04', '2021-02-24 22:26:04'),
(294, 11, 122, 5, '2021-02-24 22:26:11', '2021-02-24 22:26:11'),
(295, 3, 122, 5, '2021-02-24 22:26:18', '2021-02-24 22:26:18'),
(296, 2, 123, 5, '2021-02-24 22:27:16', '2021-02-24 22:27:16'),
(297, 6, 123, 5, '2021-02-24 22:27:23', '2021-02-24 22:27:23'),
(298, 3, 123, 4, '2021-02-24 22:27:31', '2021-02-24 22:27:31'),
(299, 7, 123, 4, '2021-02-24 22:27:38', '2021-02-24 22:27:38'),
(300, 1, 124, 3, '2021-02-24 22:28:15', '2021-02-24 22:28:15'),
(301, 2, 124, 5, '2021-02-24 22:28:24', '2021-02-24 22:28:24'),
(302, 2, 125, 5, '2021-02-24 22:29:27', '2021-02-24 22:29:27'),
(303, 6, 125, 4, '2021-02-24 22:29:33', '2021-02-24 22:29:33'),
(304, 9, 125, 3, '2021-02-24 22:29:40', '2021-02-24 22:29:40'),
(305, 11, 125, 4, '2021-02-24 22:29:47', '2021-02-24 22:29:47'),
(306, 14, 125, 5, '2021-02-24 22:29:55', '2021-02-24 22:29:55'),
(307, 1, 126, 5, '2021-02-24 22:31:05', '2021-02-24 22:31:05'),
(308, 13, 126, 3, '2021-02-24 22:31:13', '2021-02-24 22:31:13'),
(309, 12, 126, 5, '2021-02-24 22:31:22', '2021-02-24 22:31:22'),
(310, 2, 127, 3, '2021-02-24 22:32:38', '2021-02-24 22:32:38'),
(311, 3, 127, 2, '2021-02-24 22:32:49', '2021-02-24 22:32:49'),
(312, 6, 127, 5, '2021-02-24 22:32:55', '2021-02-24 22:32:55'),
(313, 7, 127, 5, '2021-02-24 22:33:07', '2021-02-24 22:33:07'),
(314, 9, 127, 3, '2021-02-24 22:33:15', '2021-02-24 22:33:15'),
(315, 11, 127, 4, '2021-02-24 22:33:26', '2021-02-24 22:33:26'),
(316, 14, 127, 5, '2021-02-24 22:33:36', '2021-02-24 22:33:36'),
(317, 2, 128, 4, '2021-02-24 22:44:13', '2021-02-24 22:44:13'),
(318, 3, 128, 2, '2021-02-24 22:44:20', '2021-02-24 22:44:20'),
(319, 7, 128, 4, '2021-02-24 22:44:28', '2021-02-24 22:44:28'),
(320, 6, 128, 5, '2021-02-24 22:44:35', '2021-02-24 22:44:35'),
(321, 9, 129, 3, '2021-02-24 22:45:40', '2021-02-24 22:45:40'),
(322, 11, 129, 4, '2021-02-24 22:45:48', '2021-02-24 22:45:48'),
(323, 3, 129, 5, '2021-02-24 22:45:54', '2021-02-24 22:45:54'),
(324, 4, 129, 5, '2021-02-24 22:46:02', '2021-02-24 22:46:02'),
(325, 2, 130, 5, '2021-02-24 22:46:55', '2021-02-24 22:46:55'),
(326, 14, 130, 5, '2021-02-24 22:47:02', '2021-02-24 22:47:02'),
(327, 6, 130, 5, '2021-02-24 22:47:10', '2021-02-24 22:47:10'),
(328, 2, 131, 5, '2021-02-24 22:49:56', '2021-02-24 22:49:56'),
(329, 6, 131, 4, '2021-02-24 22:50:03', '2021-02-24 22:50:03'),
(330, 9, 131, 3, '2021-02-24 22:50:10', '2021-02-24 22:50:10'),
(331, 11, 131, 4, '2021-02-24 22:50:18', '2021-02-24 22:50:18'),
(332, 13, 132, 4, '2021-02-24 22:51:22', '2021-02-24 22:51:22'),
(333, 12, 132, 5, '2021-02-24 22:51:29', '2021-02-24 22:51:29'),
(334, 14, 132, 5, '2021-02-24 22:51:37', '2021-02-24 22:51:37'),
(335, 1, 133, 5, '2021-02-24 22:52:58', '2021-02-24 22:52:58'),
(336, 13, 133, 4, '2021-02-24 22:53:05', '2021-02-24 22:53:05'),
(337, 12, 133, 5, '2021-02-24 22:53:12', '2021-02-24 22:53:12'),
(338, 1, 134, 2, '2021-02-24 22:53:53', '2021-02-24 22:53:53'),
(339, 13, 134, 5, '2021-02-24 22:54:01', '2021-02-24 22:54:01'),
(340, 12, 134, 5, '2021-02-24 22:54:08', '2021-02-24 22:54:08'),
(341, 2, 135, 5, '2021-02-24 22:55:23', '2021-02-24 22:55:23'),
(342, 14, 135, 3, '2021-02-24 22:55:30', '2021-02-24 22:55:30'),
(343, 6, 135, 5, '2021-02-24 22:55:39', '2021-02-24 22:55:39'),
(344, 2, 136, 5, '2021-02-24 22:56:20', '2021-02-24 22:56:20'),
(345, 6, 136, 5, '2021-02-24 22:56:28', '2021-02-24 22:56:28'),
(346, 2, 137, 5, '2021-02-24 22:57:43', '2021-02-24 22:57:43'),
(347, 3, 137, 3, '2021-02-24 22:57:50', '2021-02-24 22:57:50'),
(348, 6, 137, 5, '2021-02-24 22:57:56', '2021-02-24 22:57:56'),
(349, 7, 137, 5, '2021-02-24 22:58:04', '2021-02-24 22:58:04'),
(350, 9, 137, 5, '2021-02-24 22:58:12', '2021-02-24 22:58:12'),
(351, 11, 137, 4, '2021-02-24 22:58:19', '2021-02-24 22:58:19'),
(352, 14, 137, 4, '2021-02-24 22:58:26', '2021-02-24 22:58:26'),
(353, 1, 138, 5, '2021-02-24 22:59:40', '2021-02-24 22:59:40'),
(354, 13, 138, 5, '2021-02-24 22:59:48', '2021-02-24 22:59:48'),
(355, 12, 138, 5, '2021-02-24 22:59:55', '2021-02-24 22:59:55'),
(356, 2, 139, 5, '2021-02-24 23:01:12', '2021-02-24 23:01:12'),
(357, 3, 139, 4, '2021-02-24 23:01:19', '2021-02-24 23:01:19'),
(358, 6, 139, 5, '2021-02-24 23:01:26', '2021-02-24 23:01:26'),
(359, 9, 139, 3, '2021-02-24 23:01:35', '2021-02-24 23:01:35'),
(360, 11, 139, 4, '2021-02-24 23:01:44', '2021-02-24 23:01:44'),
(361, 14, 139, 3, '2021-02-24 23:01:52', '2021-02-24 23:01:52'),
(362, 7, 139, 5, '2021-02-24 23:02:01', '2021-02-24 23:02:01'),
(363, 2, 140, 4, '2021-02-25 07:34:34', '2021-02-25 07:34:34'),
(364, 6, 140, 5, '2021-02-25 07:34:40', '2021-02-25 07:34:40'),
(365, 7, 140, 5, '2021-02-25 07:34:50', '2021-02-25 07:34:50'),
(366, 9, 140, 4, '2021-02-25 07:34:59', '2021-02-25 07:34:59'),
(367, 11, 140, 3, '2021-02-25 07:35:08', '2021-02-25 07:35:08'),
(368, 3, 140, 5, '2021-02-25 07:35:16', '2021-02-25 07:35:16'),
(369, 1, 141, 4, '2021-02-25 07:36:39', '2021-02-25 07:36:39'),
(370, 13, 141, 5, '2021-02-25 07:36:46', '2021-02-25 07:36:46'),
(371, 12, 141, 5, '2021-02-25 07:36:52', '2021-02-25 07:36:52'),
(372, 14, 141, 5, '2021-02-25 07:37:02', '2021-02-25 07:37:02'),
(373, 13, 142, 5, '2021-02-25 07:39:29', '2021-02-25 07:39:29'),
(374, 12, 142, 5, '2021-02-25 07:39:37', '2021-02-25 07:39:37'),
(375, 14, 143, 3, '2021-02-25 08:07:29', '2021-02-25 08:07:29'),
(376, 4, 143, 3, '2021-02-25 08:07:43', '2021-02-25 08:07:43'),
(377, 5, 143, 5, '2021-02-25 08:07:50', '2021-02-25 08:07:50'),
(378, 3, 143, 5, '2021-02-25 08:07:57', '2021-02-25 08:07:57'),
(379, 7, 143, 5, '2021-02-25 08:08:05', '2021-02-25 08:08:05'),
(380, 9, 143, 4, '2021-02-25 08:08:19', '2021-02-25 08:08:19'),
(381, 11, 143, 4, '2021-02-25 08:08:41', '2021-02-25 08:08:41'),
(382, 2, 144, 4, '2021-02-25 08:10:03', '2021-02-25 08:10:03'),
(383, 1, 144, 3, '2021-02-25 08:10:10', '2021-02-25 08:10:10'),
(384, 13, 144, 5, '2021-02-25 08:10:17', '2021-02-25 08:10:17'),
(385, 12, 144, 5, '2021-02-25 08:10:27', '2021-02-25 08:10:27'),
(386, 14, 144, 3, '2021-02-25 08:10:36', '2021-02-25 08:10:36'),
(387, 4, 145, 3, '2021-02-25 08:20:43', '2021-02-25 08:20:43'),
(388, 5, 145, 5, '2021-02-25 08:20:49', '2021-02-25 08:20:49'),
(389, 3, 145, 4, '2021-02-25 08:20:56', '2021-02-25 08:20:56'),
(390, 7, 145, 5, '2021-02-25 08:21:04', '2021-02-25 08:21:04'),
(391, 9, 145, 4, '2021-02-25 08:21:12', '2021-02-25 08:21:12'),
(392, 11, 145, 5, '2021-02-25 08:21:20', '2021-02-25 08:21:20'),
(393, 14, 145, 4, '2021-02-25 08:21:47', '2021-02-25 08:21:47'),
(394, 14, 145, 5, '2021-02-25 08:22:26', '2021-02-25 08:22:26'),
(395, 1, 146, 3, '2021-02-25 08:26:19', '2021-02-25 08:26:19'),
(396, 13, 146, 5, '2021-02-25 08:26:26', '2021-02-25 08:26:26'),
(397, 12, 146, 5, '2021-02-25 08:26:33', '2021-02-25 08:26:33'),
(398, 14, 146, 4, '2021-02-25 08:26:48', '2021-02-25 08:26:48'),
(399, 2, 147, 4, '2021-02-25 08:28:17', '2021-02-25 08:28:17'),
(400, 3, 147, 5, '2021-02-25 08:28:24', '2021-02-25 08:28:24'),
(401, 6, 147, 2, '2021-02-25 08:28:32', '2021-02-25 08:28:32'),
(402, 7, 147, 5, '2021-02-25 08:28:39', '2021-02-25 08:28:39'),
(403, 9, 147, 3, '2021-02-25 08:28:48', '2021-02-25 08:28:48'),
(404, 11, 147, 3, '2021-02-25 08:28:56', '2021-02-25 08:28:56'),
(405, 14, 147, 4, '2021-02-25 08:29:05', '2021-02-25 08:29:05'),
(406, 2, 148, 5, '2021-02-25 08:29:56', '2021-02-25 08:29:56'),
(407, 6, 148, 5, '2021-02-25 08:30:03', '2021-02-25 08:30:03'),
(408, 7, 148, 4, '2021-02-25 08:30:14', '2021-02-25 08:30:14'),
(409, 3, 148, 2, '2021-02-25 08:30:22', '2021-02-25 08:30:22'),
(410, 1, 149, 4, '2021-02-25 08:33:37', '2021-02-25 08:33:37'),
(411, 13, 149, 5, '2021-02-25 08:33:45', '2021-02-25 08:33:45'),
(412, 12, 149, 5, '2021-02-25 08:33:52', '2021-02-25 08:33:52'),
(413, 4, 150, 5, '2021-02-25 08:37:45', '2021-02-25 08:37:45'),
(414, 5, 150, 5, '2021-02-25 08:37:51', '2021-02-25 08:37:51'),
(415, 7, 150, 5, '2021-02-25 08:37:59', '2021-02-25 08:37:59'),
(416, 9, 150, 5, '2021-02-25 08:38:06', '2021-02-25 08:38:06'),
(417, 3, 150, 4, '2021-02-25 08:38:15', '2021-02-25 08:38:15'),
(418, 14, 150, 4, '2021-02-25 08:38:25', '2021-02-25 08:38:25'),
(419, 1, 151, 3, '2021-02-25 08:39:14', '2021-02-25 08:39:14'),
(420, 13, 151, 5, '2021-02-25 08:39:23', '2021-02-25 08:39:23'),
(421, 12, 151, 5, '2021-02-25 08:39:32', '2021-02-25 08:39:32'),
(422, 14, 151, 4, '2021-02-25 08:39:40', '2021-02-25 08:39:40'),
(423, 1, 152, 5, '2021-02-25 08:41:19', '2021-02-25 08:41:19'),
(424, 13, 152, 3, '2021-02-25 08:41:28', '2021-02-25 08:41:28'),
(425, 12, 152, 5, '2021-02-25 08:41:36', '2021-02-25 08:41:36'),
(426, 14, 152, 4, '2021-02-25 08:41:54', '2021-02-25 08:41:54'),
(427, 1, 153, 3, '2021-02-25 09:11:47', '2021-02-25 09:11:47'),
(428, 13, 153, 3, '2021-02-25 09:11:57', '2021-02-25 09:11:57'),
(429, 12, 153, 5, '2021-02-25 09:12:08', '2021-02-25 09:12:08'),
(430, 2, 154, 4, '2021-02-25 09:13:01', '2021-02-25 09:13:01'),
(431, 6, 154, 5, '2021-02-25 09:13:09', '2021-02-25 09:13:09'),
(432, 2, 155, 5, '2021-02-25 09:15:33', '2021-02-25 09:15:33'),
(433, 6, 155, 5, '2021-02-25 09:16:00', '2021-02-25 09:16:00'),
(434, 1, 156, 3, '2021-02-25 09:19:42', '2021-02-25 09:19:42'),
(435, 13, 156, 5, '2021-02-25 09:19:50', '2021-02-25 09:19:50'),
(436, 12, 156, 5, '2021-02-25 09:19:59', '2021-02-25 09:19:59'),
(437, 3, 157, 5, '2021-02-25 09:25:28', '2021-02-25 09:25:28'),
(438, 7, 157, 3, '2021-02-25 09:25:35', '2021-02-25 09:25:35'),
(439, 11, 157, 4, '2021-02-25 09:25:42', '2021-02-25 09:25:42'),
(440, 9, 157, 4, '2021-02-25 09:25:51', '2021-02-25 09:25:51'),
(441, 1, 158, 3, '2021-02-25 09:33:04', '2021-02-25 09:33:04'),
(442, 13, 158, 5, '2021-02-25 09:33:11', '2021-02-25 09:33:11'),
(443, 12, 158, 5, '2021-02-25 09:33:18', '2021-02-25 09:33:18'),
(444, 2, 159, 3, '2021-02-25 09:35:43', '2021-02-25 09:35:43'),
(445, 3, 159, 2, '2021-02-25 09:35:50', '2021-02-25 09:35:50'),
(446, 6, 159, 5, '2021-02-25 09:35:58', '2021-02-25 09:35:58'),
(447, 7, 159, 5, '2021-02-25 09:36:06', '2021-02-25 09:36:06'),
(448, 14, 159, 3, '2021-02-25 09:36:32', '2021-02-25 09:36:32'),
(449, 11, 159, 3, '2021-02-25 09:36:42', '2021-02-25 09:36:42'),
(450, 11, 160, 3, '2021-02-25 09:42:56', '2021-02-25 09:42:56'),
(451, 3, 160, 5, '2021-02-25 09:43:06', '2021-02-25 09:43:06'),
(452, 4, 160, 3, '2021-02-25 09:43:14', '2021-02-25 09:43:14'),
(453, 5, 160, 4, '2021-02-25 09:43:21', '2021-02-25 09:43:21'),
(454, 7, 160, 4, '2021-02-25 09:43:28', '2021-02-25 09:43:28'),
(455, 9, 160, 4, '2021-02-25 09:43:36', '2021-02-25 09:43:36'),
(456, 1, 161, 5, '2021-02-25 10:06:10', '2021-02-25 10:06:10'),
(457, 12, 161, 3, '2021-02-25 10:06:17', '2021-02-25 10:06:17'),
(458, 13, 161, 5, '2021-02-25 10:06:25', '2021-02-25 10:06:25'),
(459, 1, 162, 4, '2021-02-25 11:36:31', '2021-02-25 11:36:31'),
(460, 13, 162, 5, '2021-02-25 11:36:39', '2021-02-25 11:36:39'),
(461, 12, 162, 5, '2021-02-25 11:36:47', '2021-02-25 11:36:47'),
(462, 14, 162, 4, '2021-02-25 11:36:54', '2021-02-25 11:36:54'),
(463, 14, 163, 3, '2021-02-25 11:41:56', '2021-02-25 11:41:56'),
(464, 2, 163, 5, '2021-02-25 11:42:05', '2021-02-25 11:42:05'),
(465, 3, 163, 5, '2021-02-25 11:42:17', '2021-02-25 11:42:17'),
(466, 9, 163, 3, '2021-02-25 11:42:26', '2021-02-25 11:42:26'),
(467, 6, 163, 5, '2021-02-25 11:42:41', '2021-02-25 11:42:41'),
(468, 11, 163, 3, '2021-02-25 11:42:57', '2021-02-25 11:42:57'),
(469, 3, 164, 5, '2021-02-25 11:44:45', '2021-02-25 11:44:45'),
(470, 4, 164, 5, '2021-02-25 11:44:52', '2021-02-25 11:44:52'),
(471, 5, 164, 5, '2021-02-25 11:45:00', '2021-02-25 11:45:00'),
(472, 9, 164, 3, '2021-02-25 11:45:08', '2021-02-25 11:45:08'),
(473, 7, 164, 5, '2021-02-25 11:45:16', '2021-02-25 11:45:16'),
(474, 8, 164, 5, '2021-02-25 11:45:25', '2021-02-25 11:45:25'),
(475, 11, 164, 4, '2021-02-25 11:45:35', '2021-02-25 11:45:35'),
(476, 1, 165, 3, '2021-02-25 11:51:05', '2021-02-25 11:51:05'),
(477, 13, 165, 2, '2021-02-25 11:51:12', '2021-02-25 11:51:12'),
(478, 11, 165, 2, '2021-02-25 11:51:19', '2021-02-25 11:51:19'),
(479, 12, 165, 5, '2021-02-25 11:51:27', '2021-02-25 11:51:27'),
(480, 1, 3, 5, '2021-02-26 11:55:57', '2021-02-26 11:55:57'),
(481, 1, 1, 5, '2021-02-26 12:18:48', '2021-02-26 12:18:48'),
(482, 2, 166, 5, '2021-02-27 23:42:30', '2021-02-27 23:42:30'),
(483, 3, 166, 5, '2021-02-27 23:42:50', '2021-02-27 23:42:50'),
(484, 6, 166, 5, '2021-02-27 23:43:05', '2021-02-27 23:43:05'),
(485, 7, 166, 5, '2021-02-27 23:43:14', '2021-02-27 23:43:14'),
(486, 9, 166, 5, '2021-02-27 23:43:22', '2021-02-27 23:43:22'),
(487, 11, 166, 4, '2021-02-27 23:44:59', '2021-02-27 23:44:59'),
(488, 14, 166, 4, '2021-02-27 23:45:09', '2021-02-27 23:45:09'),
(489, 3, 167, 5, '2021-02-27 23:46:51', '2021-02-27 23:46:51'),
(490, 4, 167, 3, '2021-02-27 23:47:00', '2021-02-27 23:47:00'),
(491, 5, 167, 5, '2021-02-27 23:47:07', '2021-02-27 23:47:07'),
(492, 7, 167, 5, '2021-02-27 23:47:14', '2021-02-27 23:47:14'),
(493, 9, 167, 3, '2021-02-27 23:47:24', '2021-02-27 23:47:24'),
(494, 14, 167, 4, '2021-02-27 23:47:31', '2021-02-27 23:47:31'),
(495, 11, 167, 5, '2021-02-27 23:47:43', '2021-02-27 23:47:43'),
(496, 1, 168, 3, '2021-02-27 23:50:43', '2021-02-27 23:50:43'),
(497, 13, 168, 3, '2021-02-27 23:50:51', '2021-02-27 23:50:51'),
(498, 12, 168, 5, '2021-02-27 23:51:00', '2021-02-27 23:51:00'),
(499, 14, 168, 4, '2021-02-27 23:51:07', '2021-02-27 23:51:07'),
(500, 1, 169, 3, '2021-02-27 23:51:51', '2021-02-27 23:51:51'),
(501, 12, 169, 5, '2021-02-27 23:51:58', '2021-02-27 23:51:58'),
(502, 13, 169, 5, '2021-02-27 23:52:06', '2021-02-27 23:52:06'),
(503, 2, 170, 4, '2021-02-27 23:54:57', '2021-02-27 23:54:57'),
(504, 3, 170, 3, '2021-02-27 23:55:04', '2021-02-27 23:55:04'),
(505, 6, 170, 5, '2021-02-27 23:55:11', '2021-02-27 23:55:11'),
(506, 7, 170, 5, '2021-02-27 23:55:19', '2021-02-27 23:55:19'),
(507, 9, 170, 4, '2021-02-27 23:55:27', '2021-02-27 23:55:27'),
(508, 11, 170, 3, '2021-02-27 23:55:36', '2021-02-27 23:55:36'),
(509, 4, 172, 4, '2021-02-27 23:57:34', '2021-02-27 23:57:34'),
(510, 3, 172, 4, '2021-02-27 23:57:57', '2021-02-27 23:57:57'),
(511, 5, 172, 5, '2021-02-27 23:58:05', '2021-02-27 23:58:05'),
(512, 7, 172, 5, '2021-02-27 23:58:13', '2021-02-27 23:58:13'),
(513, 9, 172, 4, '2021-02-27 23:58:25', '2021-02-27 23:58:25'),
(514, 11, 172, 4, '2021-02-27 23:58:39', '2021-02-27 23:58:39'),
(515, 4, 173, 4, '2021-02-28 00:00:18', '2021-02-28 00:00:18'),
(516, 5, 173, 5, '2021-02-28 00:00:27', '2021-02-28 00:00:27'),
(517, 1, 174, 4, '2021-02-28 00:02:16', '2021-02-28 00:02:16'),
(518, 13, 174, 4, '2021-02-28 00:02:23', '2021-02-28 00:02:23'),
(519, 12, 174, 5, '2021-02-28 00:02:31', '2021-02-28 00:02:31'),
(520, 1, 175, 4, '2021-02-28 00:03:35', '2021-02-28 00:03:35'),
(521, 12, 175, 5, '2021-02-28 00:03:59', '2021-02-28 00:03:59'),
(522, 13, 175, 5, '2021-02-28 00:06:54', '2021-02-28 00:06:54'),
(523, 4, 176, 4, '2021-02-28 00:09:11', '2021-02-28 00:09:11'),
(524, 5, 176, 4, '2021-02-28 00:09:18', '2021-02-28 00:09:18'),
(525, 3, 176, 4, '2021-02-28 00:09:26', '2021-02-28 00:09:26'),
(526, 7, 176, 5, '2021-02-28 00:09:34', '2021-02-28 00:09:34'),
(527, 9, 176, 3, '2021-02-28 00:09:43', '2021-02-28 00:09:43'),
(528, 11, 176, 4, '2021-02-28 00:09:51', '2021-02-28 00:09:51'),
(529, 4, 177, 4, '2021-02-28 00:11:21', '2021-02-28 00:11:21'),
(530, 5, 177, 5, '2021-02-28 00:11:29', '2021-02-28 00:11:29'),
(531, 7, 177, 5, '2021-02-28 00:11:36', '2021-02-28 00:11:36'),
(532, 9, 177, 4, '2021-02-28 00:11:44', '2021-02-28 00:11:44'),
(533, 11, 177, 4, '2021-02-28 00:11:51', '2021-02-28 00:11:51'),
(534, 3, 177, 4, '2021-02-28 00:11:59', '2021-02-28 00:11:59'),
(535, 4, 178, 4, '2021-02-28 00:17:27', '2021-02-28 00:17:27'),
(536, 3, 178, 4, '2021-02-28 00:18:47', '2021-02-28 00:18:47'),
(537, 5, 178, 5, '2021-02-28 00:18:55', '2021-02-28 00:18:55'),
(538, 7, 178, 5, '2021-02-28 00:19:02', '2021-02-28 00:19:02'),
(539, 9, 178, 5, '2021-02-28 00:19:09', '2021-02-28 00:19:09'),
(540, 11, 178, 5, '2021-02-28 00:19:17', '2021-02-28 00:19:17'),
(541, 4, 179, 4, '2021-02-28 00:21:53', '2021-02-28 00:21:53'),
(542, 7, 179, 5, '2021-02-28 00:22:26', '2021-02-28 00:22:26'),
(543, 9, 179, 4, '2021-02-28 00:22:36', '2021-02-28 00:22:36'),
(544, 3, 179, 5, '2021-02-28 00:22:56', '2021-02-28 00:22:56'),
(545, 11, 179, 4, '2021-02-28 00:23:04', '2021-02-28 00:23:04'),
(546, 3, 180, 5, '2021-02-28 00:27:21', '2021-02-28 00:27:21'),
(547, 4, 180, 5, '2021-02-28 00:27:28', '2021-02-28 00:27:28'),
(548, 5, 180, 5, '2021-02-28 00:28:53', '2021-02-28 00:28:53'),
(549, 7, 180, 4, '2021-02-28 00:29:02', '2021-02-28 00:29:02'),
(550, 9, 180, 3, '2021-02-28 00:29:14', '2021-02-28 00:29:14'),
(551, 11, 180, 4, '2021-02-28 00:29:23', '2021-02-28 00:29:23'),
(552, 4, 181, 4, '2021-02-28 00:31:29', '2021-02-28 00:31:29'),
(553, 5, 181, 5, '2021-02-28 00:31:36', '2021-02-28 00:31:36'),
(554, 7, 181, 5, '2021-02-28 00:31:43', '2021-02-28 00:31:43'),
(555, 9, 181, 4, '2021-02-28 00:32:14', '2021-02-28 00:32:14'),
(556, 11, 181, 4, '2021-02-28 00:32:22', '2021-02-28 00:32:22'),
(557, 3, 181, 4, '2021-02-28 00:32:31', '2021-02-28 00:32:31'),
(558, 3, 182, 4, '2021-02-28 00:34:17', '2021-02-28 00:34:17'),
(559, 4, 182, 5, '2021-02-28 00:34:26', '2021-02-28 00:34:26'),
(560, 5, 182, 5, '2021-02-28 00:34:34', '2021-02-28 00:34:34'),
(561, 7, 182, 5, '2021-02-28 00:34:44', '2021-02-28 00:34:44'),
(562, 9, 182, 5, '2021-02-28 00:35:09', '2021-02-28 00:35:09'),
(563, 11, 182, 4, '2021-02-28 00:35:19', '2021-02-28 00:35:19'),
(564, 4, 183, 4, '2021-02-28 00:41:00', '2021-02-28 00:41:00'),
(565, 5, 183, 4, '2021-02-28 00:41:07', '2021-02-28 00:41:07'),
(566, 3, 183, 5, '2021-02-28 00:41:15', '2021-02-28 00:41:15'),
(567, 7, 183, 5, '2021-02-28 00:41:22', '2021-02-28 00:41:22'),
(568, 9, 183, 3, '2021-02-28 00:41:32', '2021-02-28 00:41:32'),
(569, 11, 183, 3, '2021-02-28 00:41:42', '2021-02-28 00:41:42'),
(570, 4, 184, 4, '2021-02-28 00:43:02', '2021-02-28 00:43:02'),
(571, 5, 184, 4, '2021-02-28 00:43:21', '2021-02-28 00:43:21'),
(572, 3, 184, 5, '2021-02-28 00:43:28', '2021-02-28 00:43:28'),
(573, 7, 184, 5, '2021-02-28 00:43:36', '2021-02-28 00:43:36'),
(574, 9, 184, 5, '2021-02-28 00:43:44', '2021-02-28 00:43:44'),
(575, 11, 184, 4, '2021-02-28 00:43:59', '2021-02-28 00:43:59'),
(576, 4, 185, 5, '2021-02-28 00:45:12', '2021-02-28 00:45:12'),
(577, 5, 185, 5, '2021-02-28 00:45:19', '2021-02-28 00:45:19'),
(578, 7, 185, 5, '2021-02-28 00:45:33', '2021-02-28 00:45:33'),
(579, 3, 185, 3, '2021-02-28 00:45:41', '2021-02-28 00:45:41'),
(580, 9, 185, 4, '2021-02-28 00:45:50', '2021-02-28 00:45:50'),
(581, 11, 185, 4, '2021-02-28 00:45:59', '2021-02-28 00:45:59'),
(582, 1, 186, 4, '2021-02-28 00:47:52', '2021-02-28 00:47:52'),
(583, 13, 186, 3, '2021-02-28 00:48:01', '2021-02-28 00:48:01'),
(584, 12, 186, 4, '2021-02-28 00:48:08', '2021-02-28 00:48:08'),
(585, 2, 187, 4, '2021-02-28 00:53:21', '2021-02-28 00:53:21'),
(586, 6, 187, 5, '2021-02-28 00:53:28', '2021-02-28 00:53:28'),
(587, 9, 187, 5, '2021-02-28 00:53:36', '2021-02-28 00:53:36'),
(588, 7, 187, 4, '2021-02-28 00:53:44', '2021-02-28 00:53:44'),
(589, 3, 187, 5, '2021-02-28 00:54:03', '2021-02-28 00:54:03'),
(590, 11, 187, 4, '2021-02-28 00:54:11', '2021-02-28 00:54:11'),
(591, 2, 188, 4, '2021-02-28 00:56:06', '2021-02-28 00:56:06'),
(592, 3, 188, 3, '2021-02-28 00:56:13', '2021-02-28 00:56:13'),
(593, 7, 188, 4, '2021-02-28 00:56:21', '2021-02-28 00:56:21'),
(594, 6, 188, 5, '2021-02-28 00:56:29', '2021-02-28 00:56:29'),
(595, 9, 188, 4, '2021-02-28 00:56:37', '2021-02-28 00:56:37'),
(596, 11, 188, 5, '2021-02-28 00:56:45', '2021-02-28 00:56:45'),
(597, 2, 189, 4, '2021-02-28 00:57:27', '2021-02-28 00:57:27'),
(598, 3, 189, 4, '2021-02-28 00:57:34', '2021-02-28 00:57:34'),
(599, 2, 190, 3, '2021-02-28 01:43:30', '2021-02-28 01:43:30'),
(600, 3, 190, 4, '2021-02-28 01:43:48', '2021-02-28 01:43:48'),
(601, 1, 191, 4, '2021-02-28 01:44:28', '2021-02-28 01:44:28'),
(602, 13, 191, 5, '2021-02-28 01:44:37', '2021-02-28 01:44:37'),
(603, 12, 191, 4, '2021-02-28 01:44:51', '2021-02-28 01:44:51'),
(604, 3, 192, 4, '2021-02-28 01:45:45', '2021-02-28 01:45:45'),
(605, 4, 192, 5, '2021-02-28 01:45:52', '2021-02-28 01:45:52'),
(606, 5, 192, 5, '2021-02-28 01:45:59', '2021-02-28 01:45:59'),
(607, 2, 193, 5, '2021-02-28 01:47:11', '2021-02-28 01:47:11'),
(608, 3, 193, 5, '2021-02-28 01:47:18', '2021-02-28 01:47:18'),
(609, 6, 193, 5, '2021-02-28 01:47:26', '2021-02-28 01:47:26'),
(610, 11, 194, 4, '2021-02-28 01:49:36', '2021-02-28 01:49:36'),
(611, 14, 194, 4, '2021-02-28 01:49:46', '2021-02-28 01:49:46'),
(612, 9, 194, 3, '2021-02-28 01:49:54', '2021-02-28 01:49:54'),
(613, 3, 194, 5, '2021-02-28 01:50:02', '2021-02-28 01:50:02'),
(614, 1, 195, 5, '2021-02-28 01:50:45', '2021-02-28 01:50:45'),
(615, 13, 196, 4, '2021-02-28 01:51:27', '2021-02-28 01:51:27'),
(616, 12, 196, 4, '2021-02-28 01:51:35', '2021-02-28 01:51:35'),
(617, 4, 198, 4, '2021-02-28 01:53:29', '2021-02-28 01:53:29'),
(618, 5, 198, 4, '2021-02-28 01:53:37', '2021-02-28 01:53:37'),
(619, 9, 199, 4, '2021-02-28 01:56:31', '2021-02-28 01:56:31'),
(620, 3, 199, 4, '2021-02-28 01:56:39', '2021-02-28 01:56:39'),
(621, 4, 199, 4, '2021-02-28 01:56:48', '2021-02-28 01:56:48'),
(622, 5, 199, 4, '2021-02-28 01:56:56', '2021-02-28 01:56:56'),
(623, 11, 199, 5, '2021-02-28 01:57:12', '2021-02-28 01:57:12'),
(624, 7, 199, 5, '2021-02-28 01:57:20', '2021-02-28 01:57:20'),
(625, 1, 200, 4, '2021-02-28 01:58:14', '2021-02-28 01:58:14'),
(626, 13, 200, 4, '2021-02-28 01:58:23', '2021-02-28 01:58:23'),
(627, 12, 200, 5, '2021-02-28 01:58:31', '2021-02-28 01:58:31'),
(628, 2, 201, 4, '2021-02-28 01:59:19', '2021-02-28 01:59:19'),
(629, 3, 201, 3, '2021-02-28 01:59:26', '2021-02-28 01:59:26'),
(630, 6, 201, 5, '2021-02-28 01:59:34', '2021-02-28 01:59:34'),
(631, 7, 201, 4, '2021-02-28 01:59:42', '2021-02-28 01:59:42'),
(632, 9, 201, 4, '2021-02-28 01:59:51', '2021-02-28 01:59:51'),
(633, 11, 201, 4, '2021-02-28 01:59:59', '2021-02-28 01:59:59'),
(634, 3, 202, 4, '2021-02-28 02:00:54', '2021-02-28 02:00:54'),
(635, 4, 202, 4, '2021-02-28 02:01:01', '2021-02-28 02:01:01'),
(636, 5, 202, 5, '2021-02-28 02:01:08', '2021-02-28 02:01:08'),
(637, 7, 202, 3, '2021-02-28 02:01:22', '2021-02-28 02:01:22'),
(638, 9, 202, 4, '2021-02-28 02:01:32', '2021-02-28 02:01:32'),
(639, 11, 202, 5, '2021-02-28 02:01:39', '2021-02-28 02:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shoppingcart`
--

INSERT INTO `shoppingcart` (`identifier`, `instance`, `content`, `created_at`, `updated_at`) VALUES
('Lizeth Heaney43', 'default', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"ab474a72475ea6ea54d2085e5cdacc28\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":10:{s:5:\"rowId\";s:32:\"ab474a72475ea6ea54d2085e5cdacc28\";s:2:\"id\";i:15;s:3:\"qty\";i:1;s:4:\"name\";s:31:\"MERN stack: A complete tutorial\";s:5:\"price\";d:20000;s:6:\"weight\";d:550;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:0:{}}s:7:\"taxRate\";i:21;s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:10:\"App\\Course\";s:46:\"\0Gloudemans\\Shoppingcart\\CartItem\0discountRate\";i:0;}}}', '2021-12-17 10:29:52', '2021-12-17 10:29:52'),
('mursalin2', 'default', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{s:32:\"370d08585360f5c568b18d1f2e4ca1df\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":10:{s:5:\"rowId\";s:32:\"370d08585360f5c568b18d1f2e4ca1df\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:27:\"Python Programming Language\";s:5:\"price\";d:10000;s:6:\"weight\";d:550;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":1:{s:8:\"\0*\0items\";a:0:{}}s:7:\"taxRate\";i:21;s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:10:\"App\\Course\";s:46:\"\0Gloudemans\\Shoppingcart\\CartItem\0discountRate\";i:0;}}}', '2021-11-04 12:26:30', '2021-11-04 12:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `student_profiles`
--

CREATE TABLE `student_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `enrolled_courses` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`enrolled_courses`)),
  `course_performance` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`course_performance`)),
  `course_status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`course_status`)),
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_profiles`
--

INSERT INTO `student_profiles` (`id`, `user_id`, `enrolled_courses`, `course_performance`, `course_status`, `contact`, `about`, `created_at`, `updated_at`) VALUES
(1, 2, '[1,3,4,5,6,2,15]', NULL, NULL, NULL, NULL, '2020-12-18 10:25:55', '2021-11-04 12:26:42'),
(2, 3, '[2,6,7]', NULL, NULL, NULL, NULL, '2020-12-18 10:28:13', '2021-01-05 12:01:15'),
(3, 34, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:50', '2021-01-08 08:56:23'),
(4, 35, '[9,3,8,10,11]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:50', '2021-01-07 07:58:02'),
(5, 36, '[1,10,13,12]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:50', '2021-01-07 08:06:25'),
(6, 37, '[2,6,14]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:50', '2021-01-07 08:08:02'),
(7, 38, '[1,10,14]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:50', '2021-01-07 08:27:37'),
(8, 39, '[2,7,8,9,11]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:50', '2021-01-07 08:28:36'),
(9, 40, '[4,5,14]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-07 08:32:31'),
(10, 41, '[2,6,7,9,11,3]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-07 08:44:09'),
(11, 42, '[2,14]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 05:56:07'),
(12, 43, '{\"0\":2,\"1\":6,\"2\":14,\"4\":15}', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-12-17 10:30:11'),
(13, 44, '[2,6]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 05:56:55'),
(14, 45, '[1,13,12,14]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 05:58:07'),
(15, 46, '[3,9,8,11]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 05:58:56'),
(16, 47, '[9,11,3]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 05:59:46'),
(17, 48, '[1]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 06:00:57'),
(18, 49, '[2,6,7,11,9]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 06:02:16'),
(19, 50, '[4,5,14]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 06:03:03'),
(20, 51, '[1,10,13,12]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 06:03:59'),
(21, 52, '[2,1,14]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 08:47:00'),
(22, 53, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 08:47:51'),
(23, 54, '[2,6]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 08:49:07'),
(24, 55, '[2]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 08:49:44'),
(25, 56, '[3,7]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 08:50:26'),
(26, 57, '[3,4]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 08:50:59'),
(27, 58, '[4,5]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 08:51:28'),
(28, 59, '[2,3]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 08:52:11'),
(29, 60, '[2]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 08:52:34'),
(30, 61, '[3,8]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 08:53:15'),
(31, 62, '[9,11,3]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 08:54:11'),
(32, 63, '[1]', NULL, NULL, NULL, NULL, '2021-01-05 11:57:51', '2021-01-08 08:54:53'),
(33, 64, '[9,11,3,7]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:21', '2021-01-10 11:45:21'),
(34, 65, '[4,5,3,7,9,11,14]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:21', '2021-01-10 11:47:14'),
(35, 66, '[9,11,8,7,3]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:21', '2021-01-10 11:48:19'),
(36, 67, '[13,12,14]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:21', '2021-01-10 11:49:31'),
(37, 68, '[4,5,14,11,9]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:21', '2021-01-10 11:52:38'),
(38, 69, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:21', '2021-01-10 11:53:27'),
(39, 70, '[2,6,7,14]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:21', '2021-01-10 11:54:51'),
(40, 71, '[2,6,7]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 11:56:40'),
(41, 72, '[4,5,3,7]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 11:57:16'),
(42, 73, '[4,5]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 11:58:18'),
(43, 74, '[9,11,3]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 11:59:27'),
(44, 75, '[9,7,11,3]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 12:00:17'),
(45, 76, '[13,12]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 12:01:17'),
(46, 77, '[4,5,3,7,9,11]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 12:02:31'),
(47, 78, '[1,2]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 12:03:17'),
(48, 79, '[2,6,7,3]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 12:05:19'),
(49, 80, '[4,5,9,11,14]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 12:06:26'),
(50, 81, '[4,5,9]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 12:07:02'),
(51, 82, '[4,5,3,7,9,11]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 12:07:58'),
(52, 83, '[3,8,7,9,11]', NULL, NULL, NULL, NULL, '2021-01-10 11:41:22', '2021-01-10 12:09:30'),
(103, 134, '[2,6,14,3]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:50', '2021-02-23 22:30:18'),
(104, 135, '[4,5,14,3,7]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:50', '2021-02-23 23:56:51'),
(105, 136, '[6,14,13,2,1]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:50', '2021-02-24 00:10:57'),
(106, 137, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:50', '2021-02-24 00:14:20'),
(107, 138, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:50', '2021-02-24 00:15:19'),
(108, 139, '[2,1,13,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:50', '2021-02-24 00:26:57'),
(109, 140, '[1,6,2]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:50', '2021-02-24 02:33:04'),
(110, 141, '[2,6]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 02:03:36'),
(111, 142, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 02:09:56'),
(112, 143, '[4,5,3,7,9,11,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 02:17:48'),
(113, 144, '[9,11,8,3,1]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 02:22:31'),
(114, 145, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 02:23:54'),
(115, 146, '[2,6,10,14,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 02:35:04'),
(116, 147, '[1,4,3,5,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 02:36:47'),
(117, 148, '[13,12,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 02:38:10'),
(118, 149, '[2,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 02:39:13'),
(119, 150, '[3,7,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 02:40:16'),
(120, 151, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 22:22:37'),
(121, 152, '[4,5,2,3]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 22:24:23'),
(122, 153, '[9,11,3]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 22:25:50'),
(123, 154, '[2,6,7,3]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 22:26:58'),
(124, 155, '[1,2]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 22:28:03'),
(125, 156, '[2,6,9,11,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 22:29:15'),
(126, 157, '[1,11,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 22:30:49'),
(127, 158, '[2,3,6,7,9,11,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 22:32:14'),
(128, 159, '[2,3,7,6]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:51', '2021-02-24 22:44:01'),
(129, 160, '[9,11,3,4]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-24 22:45:21'),
(130, 161, '[2,14,6]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-24 22:46:35'),
(131, 162, '[2,6,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-24 22:49:42'),
(132, 163, '[13,12,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-24 22:50:45'),
(133, 164, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-24 22:52:44'),
(134, 165, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-24 22:53:41'),
(135, 166, '[2,14,6]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-24 22:55:07'),
(136, 167, '[2,6]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-24 22:56:05'),
(137, 168, '[2,3,6,7,9,11,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-24 22:57:18'),
(138, 169, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-24 22:59:09'),
(139, 170, '[2,3,6,7,9,11,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-24 23:00:54'),
(140, 171, '[2,6,9,7,11,3]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-25 07:34:19'),
(141, 172, '[1,13,12,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:52', '2021-02-25 07:35:51'),
(142, 173, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 07:39:07'),
(143, 174, '[4,5,3,7,9,11,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 08:02:07'),
(144, 175, '[2,1,13,12,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 08:09:51'),
(145, 176, '[4,5,3,7,9,11,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 08:20:30'),
(146, 177, '[1,13,12,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 08:24:10'),
(147, 178, '[2,3,6,7,9,11,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 08:27:56'),
(148, 179, '[2,6,7,3]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 08:29:40'),
(149, 180, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 08:30:54'),
(150, 181, '[4,5,7,9,11,3,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 08:37:28'),
(151, 182, '[1,13,12,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 08:38:59'),
(152, 183, '[1,13,12,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 08:40:15'),
(153, 184, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 08:57:24'),
(154, 185, '[2,6]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 09:12:47'),
(155, 186, '[2,6]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 09:15:01'),
(156, 187, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 09:19:22'),
(157, 188, '[3,7,11,9]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 09:21:48'),
(158, 189, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 09:32:37'),
(159, 190, '[2,3,6,7,9,11,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 09:35:18'),
(160, 191, '[4,5,7,9,3,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 09:40:33'),
(161, 192, '[1,12,13]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 10:05:57'),
(162, 193, '[1,13,12,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 11:36:12'),
(163, 194, '[2,3,6,7,9,11,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 11:40:35'),
(164, 195, '[3,4,5,9,7,8,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 11:44:32'),
(165, 196, '[1,13,11,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-25 11:50:52'),
(166, 197, '[2,3,6,7,9,11,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-27 23:42:15'),
(167, 198, '[3,4,5,7,9,14,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:53', '2021-02-27 23:46:31'),
(168, 199, '[1,13,12,14]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-27 23:50:19'),
(169, 200, '[1,12,13]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-27 23:51:34'),
(170, 201, '[2,3,6,7,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-27 23:53:05'),
(171, 202, '[]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-13 00:23:54'),
(172, 203, '[4,3,5,7,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-27 23:57:16'),
(173, 204, '[4,5]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:00:00'),
(174, 205, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:01:40'),
(175, 206, '[1,12,13]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:04:21'),
(176, 207, '[4,5,3,7,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:08:00'),
(177, 208, '[4,5,7,9,11,3]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:11:07'),
(178, 209, '[4,3,5,7,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:13:57'),
(179, 210, '[4,5,7,9,11,3]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:20:09'),
(180, 211, '[3,4,5,7,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:25:22'),
(181, 212, '[4,5,7,9,11,3]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:31:09'),
(182, 213, '[3,4,5,7,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:33:54'),
(183, 214, '[4,5,3,7,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:38:55'),
(184, 215, '[4,5,3,7,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:42:46'),
(185, 216, '[4,5,7,3,11,9]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:44:56'),
(186, 217, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:47:38'),
(187, 218, '[2,6,9,7,3,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:49:24'),
(188, 219, '[2,3,7,6,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:55:51'),
(189, 220, '[2,3]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 00:57:08'),
(190, 221, '[2,3]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 01:43:09'),
(191, 222, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 01:44:16'),
(192, 223, '[3,4,5]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 01:45:27'),
(193, 224, '[2,3,6]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 01:46:55'),
(194, 225, '[11,14,7,9,3]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:54', '2021-02-28 01:49:18'),
(195, 226, '[1]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:55', '2021-02-28 01:50:32'),
(196, 227, '[13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:55', '2021-02-28 01:51:14'),
(197, 228, '[13,12,14,6,4,4]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:55', '2021-12-17 10:24:29'),
(198, 229, '[4,5]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:55', '2021-02-28 01:52:56'),
(199, 230, '[9,3,4,5,11,7]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:55', '2021-02-28 01:55:58'),
(200, 231, '[1,13,12]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:55', '2021-02-28 01:57:56'),
(201, 232, '[2,3,6,7,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:55', '2021-02-28 01:59:06'),
(202, 233, '[3,4,5,7,9,11]', NULL, NULL, NULL, NULL, '2021-02-13 00:23:55', '2021-02-28 02:00:42');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `description`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 'gddgdg', 1, '2020-12-18 16:34:08', '2020-12-18 16:34:08'),
(2, 'Python', 'dvgsvs', 1, '2020-12-18 16:35:37', '2020-12-18 16:35:37'),
(3, 'javascript', 'fgsdgvsd', 1, '2020-12-18 16:36:04', '2020-12-18 16:36:04'),
(4, 'Laravel', 'fdsvx', 3, '2020-12-18 16:36:48', '2020-12-18 16:36:48'),
(5, 'django', 'dawawd', 3, '2020-12-18 16:37:30', '2020-12-18 16:37:30'),
(6, 'vue', 'sdafaf', 3, '2020-12-18 16:37:47', '2020-12-18 16:37:47'),
(7, 'reactjs', 'sfdafa', 3, '2020-12-18 16:38:22', '2020-12-18 16:38:22'),
(8, 'docker', 'fadfdf', 4, '2020-12-18 16:38:50', '2020-12-18 16:38:50'),
(9, 'api', 'fafafa', 4, '2020-12-18 16:44:02', '2020-12-18 16:44:02'),
(10, 'html', 'fasf', 7, '2020-12-18 16:44:55', '2020-12-18 16:44:55'),
(11, 'css', 'sdasf', 7, '2020-12-09 16:15:48', '2020-12-09 16:15:48'),
(12, 'bootstrap', 'fdgdsg', 3, '2020-12-09 16:15:21', '2020-12-09 16:15:21'),
(13, 'c++', 'sdafa', 1, '2020-12-18 16:47:38', '2020-12-18 16:47:38'),
(14, 'jquery', 'adafa', 8, '2020-12-07 15:48:44', '2020-12-07 15:48:44'),
(15, 'sql', 'fasfaf', 1, '2020-12-07 15:47:14', '2020-12-07 15:47:14'),
(16, 'asp.net', 'afdfaf', 3, '2020-11-12 12:25:46', '2020-11-12 12:25:46'),
(17, 'c#', 'afwsfafa', 1, '2020-11-12 12:24:53', '2020-11-12 12:24:53'),
(18, 'mysql', 'afasfa', 9, '2020-12-09 16:15:21', '2020-12-09 16:15:21'),
(19, 'MERN', 'MERN stack', 7, '2021-10-30 17:15:49', '2021-10-30 17:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `survey_questions`
--

CREATE TABLE `survey_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey_questions`
--

INSERT INTO `survey_questions` (`id`, `question_body`, `type`, `created_at`, `updated_at`) VALUES
(1, 'What are you interested in learning?', 'cat', '2021-12-08 11:45:38', '2021-12-08 11:45:38'),
(2, 'Select one from the followings.', 'subcat', '2021-12-08 11:49:39', '2021-12-08 11:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE `tutorials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tutorial_comments`
--

CREATE TABLE `tutorial_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `survey_taken` int(11) NOT NULL DEFAULT 0,
  `survey_result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`survey_result`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `remember_token`, `created_at`, `updated_at`, `survey_taken`, `survey_result`) VALUES
(1, 'mursalin', 'mursalinemon@gmail.com', '2020-12-16 18:12:03', '$2y$10$Rc2B56drZV9/v3XAWWktxO5S59iflD798teO5TaWtUh9TKcZBX2ES', 'contributor', NULL, '2020-12-16 12:11:54', '2020-12-16 12:11:54', 0, NULL),
(2, 'mursalin', 'mursalinemon@example.com', '2020-12-18 16:26:23', '$2y$10$i954J91PKM2nJ7YneXXSseQZRL3FZ.iMHDMQptc2M6KN5AhYpie4W', 'student', NULL, '2020-12-18 10:25:55', '2021-12-08 11:46:39', 1, '[\"cat-1\",\"cat-2\"]'),
(3, 'emon', 'warboom85@gmail.com', '2021-01-05 17:28:53', '$2y$10$O8Rccu7tnykb8XBom979RevUKVsiVhCYVd1qz4uWmCFSiqg40yBOC', 'student', NULL, '2020-12-18 10:28:13', '2020-12-18 10:28:13', 0, NULL),
(4, 'admin', 'admin@admin.com', '2020-12-18 16:26:23', '$2y$10$i954J91PKM2nJ7YneXXSseQZRL3FZ.iMHDMQptc2M6KN5AhYpie4W', 'admin', NULL, '2020-12-18 10:25:55', '2021-12-08 11:46:39', 0, NULL),
(34, 'Mr. Quinn Yost DDS', 'kaylee.king@example.com', '2021-01-05 11:57:47', '$2y$10$LxQMDzyPHPXeuGnv.GNpPucW3dMrMklqElLLp6Ue9A7Sb5.CPYspW', 'student', 'sSzid5Jf8McFgIM3xc6iBGTf02yEkQe03dJCKYQjY37QcdSAgLUrrDhCa8kg', '2021-01-05 11:57:49', '2021-12-08 12:49:21', 1, '[\"cat-3\",\"subcat-4\",\"subcat-8\",\"subcat-14\"]'),
(35, 'Dr. Myrna Bahringer DDS', 'hhickle@example.com', '2021-01-05 11:57:47', '$2y$10$AvT2uJfb87WiANmYGNNyjO2gaJf0/OZKbULv6rFa07EKIQ3UYofHm', 'student', 'KPFpTZr1QTbMSJzJLx0gA1UyH9QjaSR8uBHkX54cSExc6ImwRonOMH84rBY7', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(36, 'Nellie O\'Hara', 'guy46@example.com', '2021-01-05 11:57:47', '$2y$10$ljzKaC9pIEcGKivxgQq2aepD7BXK/a5LkgzmhvHl.XDVEkclQUYlu', 'student', 'xzHNvamAQWNmJ6MuXIzqs4jRC6tgB1xTNO85AE8q8a8zs8nhPaLtVMguyDZ1', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(37, 'Zoe Gusikowski', 'pacocha.bill@example.org', '2021-01-05 11:57:47', '$2y$10$Xvk5FT5CzfDlWbx6EhcBrO4VBBCf1gpk2L..xxbHPHKPEG/sDz9Uy', 'student', 'bmoiUSkAxo61bVQIa14RCWO4phAduSDWwUEx2oaBPxw8Lmvl5G5bI88h8OZ3', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(38, 'Miss Destini Volkman Jr.', 'fausto48@example.org', '2021-01-05 11:57:47', '$2y$10$dH/Q46kOLaZfTkrhWwK/8eJ/NJOwkto3nNkznLgsms08QjaEn667y', 'student', 'fdHX3z09ASfkSBEj5qosZsVuE7CmpmwxWmII8UdHEywBkBGOBzjpZZXIumWQ', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(39, 'Emiliano Lueilwitz', 'jstreich@example.org', '2021-01-05 11:57:47', '$2y$10$6pICSi5mnen57wDr.qsNoOvTtcT4VqL6MnFhb3mH8gleNBenddLU2', 'student', 'SUQMyVZjeCRz417g4nDRI2K4p8es1SVogwMOW1Qhiwv5QASUqTIEJNhZjSLh', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(40, 'Teresa Spinka', 'shyanne.harvey@example.org', '2021-01-05 11:57:47', '$2y$10$uQcfx/RQE/SlMJgG.4Lb3uvM/uFWadHzJlhXySmmvbW196nyfSiXC', 'student', 'jCmLWYnY5GlmAcgpG6PorXKy1ixw2xejb3JiE7oCPCX4wN3hkkP9SyeYO6xs', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(41, 'Dr. Coty Lemke', 'plittle@example.net', '2021-01-05 11:57:47', '$2y$10$9cqGNpLrMpVT2zirTvIIz.Vbybn3Kdrn3RALcQUx/4I0mhIagBgCy', 'student', 'tqoeJCgzlIbIFXPkAfLtUIBhWghSFWBnmNyVCgiqem6i5aHp1W0pwepZKV2l', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(42, 'Mr. Roman Welch III', 'xkunde@example.com', '2021-01-05 11:57:47', '$2y$10$bAIdmW0GnKwsU4nXMmBQi.VKAonuZy/1N4SDG72u2ZW7RF05/AyRG', 'student', 'vrlL16yxRqxAsaqAotT5dVwz4ILwe2dJPFjPFPlFFNJYhSSSWySKQflxLY4X', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(43, 'Lizeth Heaney', 'eabbott@example.com', '2021-01-05 11:57:47', '$2y$10$H/N4uwAb5pxDFEBRgh1rB.DttRhoyOIF/xKW./r.pY2e/NzjCtuK2', 'student', 'k3NPzEM1SsgoBUsqprOzlxWBCLZqrP8BV9HL9JiIfGbP6UIfl3SfmqBX5JbR', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(44, 'Eldon Tremblay MD', 'jimmy29@example.org', '2021-01-05 11:57:48', '$2y$10$LcJa5OfiPWKboSAGzedvM.7CIw.Ih2bpQgRtbUa.MWvUVCXCFWDHi', 'student', 'LrYFy7t8HTkpLlIiwkKN987IPkI9e6m9Man6vjyco1AozPGyj0PfvkNxsRbH', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(45, 'Benny Schoen DDS', 'arjun25@example.net', '2021-01-05 11:57:48', '$2y$10$EPvG8riXBpJ2eevKQHWn4O9oetSWNEBEUosAJorz6M.CnyZNdwBkK', 'student', 'UOlRZPtOwVjk0IVe65nxsnCiX8rrvYESkF59OI7n8MNzxqqww8I3x5L3nesd', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(46, 'Miss Melba Smitham', 'daphne05@example.org', '2021-01-05 11:57:48', '$2y$10$tTRUamARr8/GBKgOVcHCU.1Ng3YiXYXYNH7hw5El4TX3uJK.kpVJq', 'student', 'PAd2AJR8i6r4Og94IWa2ShHl83TiDM2PjDnAKS3UMtsIfdVFqftgkfAlTqcu', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(47, 'Mr. Brett Batz', 'shanny14@example.org', '2021-01-05 11:57:48', '$2y$10$nnjPGxR1/zO.1DJrAuchIeYHoNBCQaDKHuEFzQyWVA8FRctaU7tSm', 'student', 'NkzF96juVOZVTCQ3elU4eP3bN94OLPQj9AGfUcU7TpWfdvDyXAWQe7OJqyuS', '2021-01-05 11:57:49', '2021-01-05 11:57:49', 0, NULL),
(48, 'Kyleigh Sawayn', 'angelina77@example.com', '2021-01-05 11:57:48', '$2y$10$OrfB3.Yk8r7fO4VYrLKBiune2UFMW/nmIWoFEK/8aI02x9ILKGUsa', 'student', '5O1IxPGm1ghPiI1nPLWFyobwhwFz8QqfKKEFRt4CX1pkoa8hl8ARuUFuD8jE', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(49, 'Dr. Tito McClure DDS', 'emerson46@example.org', '2021-01-05 11:57:48', '$2y$10$KngXXU6gj3ik1.X4T6FmwOVe3CgWtVVC9x9Q/6.N41OhmFBvkVscm', 'student', '8Wj9jhy0DD5Ej2Ycbyuj5RduxPigycvKjxVvVoIqQg4e4E03jM68B5ValE9h', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(50, 'Oral Gerlach', 'cbashirian@example.com', '2021-01-05 11:57:48', '$2y$10$KoFyYOXgTkOvUNorfqN1geYcebNtywuieiEUcostiiY2Wj3dZvHta', 'student', 'mc1Px005DHcu0sQDMglrSua4ro6iWRLrFISrX93mhQp7tDG0NTrgE3PweS0c', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(51, 'Marquis D\'Amore V', 'cwunsch@example.com', '2021-01-05 11:57:48', '$2y$10$XdiM7fDOuZezUlyFGguWL.46XTpBK01hX7/Vi1U6j8ce1wfEACpzi', 'student', '9PhCgYxqy9YoYLbb5lMDhjeT4VirPpfp2x0RPNyUIQpr0spt0qEvKDSB2z5H', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(52, 'Mr. Turner Considine Jr.', 'jermey40@example.net', '2021-01-05 11:57:48', '$2y$10$clcpBF1nfvTo5lPZkicqf.b1uePxoNZNgIhYiYnNdfCYhmGGzJvwq', 'student', 'PKQ4OQr7sqZzIDgKJ9utNaMj7dSK0nwX9QBTziXM5XJzHoWJyEwZE240PTGT', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(53, 'Tyra Davis', 'leonora.crist@example.com', '2021-01-05 11:57:48', '$2y$10$GULDHR2Xw5jiaJnixCnT6.xx/HJg9zyQqQ4iYVxv7sbnElx6LW/Ie', 'student', 'XjLmNBSTH5ZZRhhC33RHjO04GR8R6KxeKO4npAbqV0e4lxGf4h7ZYkhFyTR9', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(54, 'Amaya Braun', 'gstracke@example.net', '2021-01-05 11:57:48', '$2y$10$n/JE8kx5QAMEKCNs//OJVe2GHXtVIZWHil7Gp7sPpCNjD29Di8UY.', 'student', '5tIHCaZHgxNuvqCsXFwVQxfWI1d7NhGaGNJyyAmV844MJRRtu1SCgqHj9v55', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(55, 'Hazel Feeney', 'lehner.wilbert@example.net', '2021-01-05 11:57:48', '$2y$10$dnjV31HChshzSvCX2Lwhs.S8GhhgWBAYLtROmo1MGVdpGxOjfEtu6', 'student', '9EkrOI7Ya5qR26tAU8cAtarWXgOrtUqG78lZaozjNkMVCANYhLPLacZPeuaO', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(56, 'Joanne Wintheiser', 'dtorp@example.org', '2021-01-05 11:57:48', '$2y$10$5qsYlHMfnPBJX..pxqg5GuFQwcI6T1zcdKtpL7GCNZhKPxSIBdAAq', 'student', 'hyKA50g88euSvXLGQCJvjkGjZXz6G7MbpvLKhAclVGfbvbNfvtDjp3JQqXKy', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(57, 'Shakira Rogahn', 'vkreiger@example.com', '2021-01-05 11:57:48', '$2y$10$z6.5.9D2nVW4BUCtI3F9duUyxwIPqhFv.37EE3cp6QlReN5cu.576', 'student', '4Pu4819JhOEmOE8VJuCtQJk6H0eBtyUCRrENsyRFioU4N847geGZLFtsUIpf', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(58, 'Mr. Mustafa Bernier IV', 'gay13@example.org', '2021-01-05 11:57:48', '$2y$10$PCwe/2iTyXMGy0jsXa7scO.4GO3kI4cgkunAKnFH/p.FSic36hI56', 'student', 'HoK3Qvdi62rQlhzcVj9WTPg9pUaiGCaw5ngE9GiHrEPC6FTNq93UjmqgpJHs', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(59, 'Amy Collier', 'kaycee57@example.com', '2021-01-05 11:57:49', '$2y$10$96nc2o1Z4v6SOCmTWAIKpecliU/eYYxtKECI7giP1PT4DOZU0RbFG', 'student', 'bSCoeVbIc7bSgmCqJUVywBUJ3nIqTJkSYxTrcGeq4kN9iZzqe5wh1yUVqqUH', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(60, 'Haley Nitzsche', 'rgerhold@example.com', '2021-01-05 11:57:49', '$2y$10$aHZGw4NfHkdB9DRULLhla.Vl1xeqOx3PcmVvGNPMAXFsG8EbZGbdi', 'student', '84Gxra5HOe4VgGD6ACM6X0bqskkBUxGY2h2B7eT8gNWEo7cI37z2ksNoP5CF', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(61, 'Glenna Turcotte', 'hilma40@example.org', '2021-01-05 11:57:49', '$2y$10$jBpwsMMpVtEta1fwbRvDX.uWDFWXMPcmGX4cpXiuW913MCccbuUoS', 'student', 'TGFUrWCFIk202gfVdzsW8lkJGU3EBenkQdgM1re6R6q5Jb0SRO2H0Qlc0VLp', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(62, 'Dr. Kristofer Stehr V', 'swaniawski.mohamed@example.net', '2021-01-05 11:57:49', '$2y$10$DqwECd1lWqJZC77u21ZdXOR1wH7CrLcspJgNRoAeK/qcgDy2TBKK.', 'student', 'PKN34BKQDz6vjQ6LZPpX6eENjJp4FMdWKOKSsM4IrSAicLplmDFU7jxl0SHn', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(63, 'Ara Ernser II', 'tyrell71@example.com', '2021-01-05 11:57:49', '$2y$10$UTYNFfI9xk.AoOTgKtXCsOhFJm2nzNuxf.GK8VOQ8IXXBxymzjsoS', 'student', 'WNoObvYwqXajicb0aIWemMASdflapmPExSHhees9sFTb0fy9LI9USY6nMea0', '2021-01-05 11:57:50', '2021-01-05 11:57:50', 0, NULL),
(64, 'Dr. Ruthie Reynolds V', 'oconnell.mariano@example.net', '2021-01-10 11:41:19', '$2y$10$RCcAgdKQ0lof3JFVcKRMweTmblDG2z0BjISA1.xub.cTU9eKUjQ4m', 'student', 'qaZaZDnTwHxXUhOL3q0Eidqc80xTXWLqXLdNssPjcgrCvkocd8NasDRFVO29', '2021-01-10 11:41:20', '2021-01-10 11:41:20', 0, NULL),
(65, 'Dr. Roslyn Mraz', 'kmills@example.com', '2021-01-10 11:41:19', '$2y$10$8RcTLy.TwrDtIQrbcRvClOWm3lBWKbWf7N0BIqorDwql9wOKi4sGq', 'student', '4fk2IHJdbLpTe04mU5YGBWgI9yRvVtBc7BCGfNADNyiblZM6pmUYIT9r1i5d', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(66, 'Kristoffer Kihn IV', 'eliseo95@example.org', '2021-01-10 11:41:19', '$2y$10$kM3LSmw0LhCo50GvYb1SS.qqN6kPnxGwKCUL4hKd0DPKm8bQWy62q', 'student', 'DB2aywmFzuq0dKABcdM9Nlh6X08sco6m1giinYG1Et0iDiSg2XR0sJO6T6YR', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(67, 'Josephine Cole', 'hintz.vance@example.net', '2021-01-10 11:41:19', '$2y$10$sqpL4MJDksO8eLqPZXxF7uFAKBB0mnVZmVUYomg5PfhAwKm898/v6', 'student', 'zr8cTREoXaac3te6rZajizWLz5cqiSoUWwVw2Z3dVXNllOib1zWn1kxPbfmm', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(68, 'Darby Dickens', 'vcollins@example.net', '2021-01-10 11:41:19', '$2y$10$YUMlDiSEzK2isVoo63o.au8B8opCDOAOvBUdcjt.BjxCXsEQDXBKu', 'student', 'PYr5TlrDU46oNi4M5DCHIR8hjeH3J3Ct5RtnmKd9WdLBQ5H8dFatXXuYtrWe', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(69, 'Dr. Emile Glover', 'aniya58@example.org', '2021-01-10 11:41:19', '$2y$10$rY4J26.dVyZq.UkBRZqSxeW.OaZHhMeKoTN2/qWBrEbI38lTP6EEW', 'student', 'Atfqe6HkYdrdqKY0bKo2OCLv7Cq1j2zcRf2Tqgk2jAH7g7B1pUD8Psl1VCbB', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(70, 'Mrs. Kiara Lind', 'abbey.bergstrom@example.org', '2021-01-10 11:41:20', '$2y$10$WZqA9wfPH/J0XI4aMy6eYOE/0A3s5hGO2qFPg8HB9iuv6iuU7ctFi', 'student', '6ZggUcFvOHYbwCjW7Ehet9e1hgQSuAD2rqu3T9ehMC3zWXM7Fna8NMomcZ7S', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(71, 'August Herzog', 'bemard@example.com', '2021-01-10 11:41:20', '$2y$10$gHiczEpY.RVV2ru2L2ReqekvKbYg4hNBQpAxrke38kSm3GBB9l3dK', 'student', 'TBGcOQoQ4qaMezQAEHbu2WbarF5A61o0AdRtZ5wKuQkTqOZQcgJ40F1l54HC', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(72, 'Carley O\'Reilly MD', 'krajcik.marcel@example.com', '2021-01-10 11:41:20', '$2y$10$0qSwp5XlqPr79FwDk0IMFu1Gx6TVLwQefS822j9WLv6tPaWUrelO.', 'student', 'OyAqdPzpzASwsupa6BoYYBt0ctQoRFw1RI4bpOJ8Yy5UU5swgnPOQ1XfzzgH', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(73, 'Estrella Wehner', 'maureen37@example.org', '2021-01-10 11:41:20', '$2y$10$v0xXIYGQRXqXtSNi9ghV6.Td.61PQlN.Qg/Yi3l34NZ1xr6NlYBpy', 'student', 'PYUEq5ENcQq7W0Js5CGQCDWlFHzDQEncYQznz7rIdDQgaBtgUPb0GHqS1h2A', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(74, 'Dr. Tremayne Ward', 'clovis71@example.com', '2021-01-10 11:41:20', '$2y$10$/wJy7Qp6TNOcKyTM7Uxe9emkgZ3.5zfEeBGS4trsgFaiySv9bhf0u', 'student', 'JarcLodyyvq9KqNXFHxiT6deT1XpvKJgwTd7AeHauvcXM2XCkZXu6P2LUwhi', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(75, 'Amalia Kohler', 'bbernier@example.com', '2021-01-10 11:41:20', '$2y$10$JDonCRwAMJL5WPGc.jBWeuJ1oQiim0NceQGWnnTmhNAlc0ZR0JyNS', 'student', 'v7CZjLqZaQLBGydOfwOYLUIbLvVPcZ7ToYw2SJwETtzwvHaqPgjQDSb8BXjg', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(76, 'Arlene Dietrich', 'gpowlowski@example.net', '2021-01-10 11:41:20', '$2y$10$Tb0v3Iu96cmSEj3.vZ2zgOvooXmWLnadTkP.L8l7O0c1DglvGWZGa', 'student', 'IUr9dJXg4aX3TBhsXuIunH6szUASiBwNzSAV72uEIN0jcXX3q2ZGPdyiXcxn', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(77, 'Tobin Collins', 'dangelo28@example.org', '2021-01-10 11:41:20', '$2y$10$o5HuGvfAXUmx5Wo.8tzizujU8N2T4W77pp2rBt4xNAaWcnghz1e0G', 'student', '8T7hN4LZxcs21WuDzj00LlqONGJhSVZABamufFuIIreu9XqLtKuNSd3wSyKG', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(78, 'Jude Herzog DDS', 'russell95@example.net', '2021-01-10 11:41:20', '$2y$10$6KiUZ57XzBTon2YlhKFgOOslNqRKzr4L6XL8aal204n.KmzFznrXm', 'student', 'weqOLG8ispYIAS5TkCsZ1TrF3yew4VmQWURZHg2nPBtNHUNXGkQQl1Zb3Kd4', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(79, 'Mrs. Zoe Koelpin MD', 'ernestina.wisozk@example.com', '2021-01-10 11:41:20', '$2y$10$1UNws2dvfeD33zjYbRWSA.7GPT.4.XSMu3pMCQqJZmMB39oeO/3Ni', 'student', 'Iy2EVDpzQtQHFL311RLAGHJslc6loY8083QnbeBHxg6EQcFZRHL5uJpe7MHI', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(80, 'Omari Hintz', 'alanna97@example.coma', '2021-01-10 11:41:20', '$2y$10$gg92y/AOz07mVmNUfh1EWudAflTZuuoWXinn.Xum.OCANGw5OW5li', 'student', 'kvzyKs4fABeg2h0J4zbFYRQVaKSX4HySrDeQggFcXcnwU5j8Rm0LADJDFtCi', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(81, 'Milford Monahan', 'eldon38@example.com', '2021-01-10 11:41:20', '$2y$10$2JzMEeJiO5jyGrJftV5zkOGxHGCAG88.Mmgotp9TBvNwLMIfAIvbm', 'student', '3zA3KACKRkd4VegU28DM53PgxZQwOACAK622uNldf7kU7McsolGSQ0AXIbJX', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(82, 'Kavon Christiansen', 'alowe@example.org', '2021-01-10 11:41:20', '$2y$10$GHZPWZulaEmWU17TvQ3A9.jskqC/0l6gbjVZ0Cm8dUnUJEkShSe4y', 'student', 'cdyapHWCPr5WgJJHZwXKDjPShoCpzwTEUkE4tA391WS8yTLzbcSMVdZcErFB', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(83, 'Carmen Harber', 'vbins@example.net', '2021-01-10 11:41:20', '$2y$10$44tArx8NjeMuRl4GZugWWeFboT9qLBKHTO8IC19PRBpbZDy4TQXbe', 'student', 'Fd1CaaiC4ajppepjabagQwg8zGWA93RCOGuiSpvKmodNLdXsq9GYyXaFR1zq', '2021-01-10 11:41:21', '2021-01-10 11:41:21', 0, NULL),
(134, 'Sabrina Dach', 'janae.cummerata@example.com', '2021-02-13 00:23:40', '$2y$10$TMoUVUP07zqBtLzeI5jca.R8cUb3gsmtETSGxewq1/orMIGb4flVG', 'student', 'vlUZJLxSsGG0Ixvd3OZy7stLHuhZglfV0KSaFjUUoD4lasCfdvZAR7wAJ2p1', '2021-02-13 00:23:46', '2021-02-13 00:23:46', 0, NULL),
(135, 'Dr. Roscoe Gerlach', 'ryan.taylor@example.com', '2021-02-13 00:23:40', '$2y$10$.ZndqudLXfRLcr8XYVsyQOEvh2ivAFoR.1Huvv8xLUal/MTx2qh7m', 'student', 'zdDY7NbRg84DlMgZr2MiwQyqjWFwkK7ot81UrIjVHaf1Kzpn2b008Cd8yO34', '2021-02-13 00:23:46', '2021-02-13 00:23:46', 0, NULL),
(136, 'Devonte Berge', 'mercedes89@example.com', '2021-02-13 00:23:40', '$2y$10$WE0B7OA5A6RclY0Xdhbby.uTKKSuAW2NsqHcIIHzhu/wFz8dVPgh6', 'student', 'tDha1HX9ghKDgJmRa83ngmsU5XmwaglmtSvUG7JNGWFNGHimtg1eYgroZn5B', '2021-02-13 00:23:46', '2021-02-13 00:23:46', 0, NULL),
(137, 'Vilma Hansen DDS', 'maybelle.steuber@example.org', '2021-02-13 00:23:40', '$2y$10$G7.jzoeBfbx8gF9fSkf3YuthTM9enz3muaRyjqo0/RZkV88Hgf.pu', 'student', 'HwwiG8x9E981NBGt7ssTzQrZXfrsB5MgCZPBZWaE5GzMX9LzaeFL08GYGa8H', '2021-02-13 00:23:46', '2021-02-13 00:23:46', 0, NULL),
(138, 'Mariam Cassin', 'krystel25@example.net', '2021-02-13 00:23:40', '$2y$10$FWe6d3p7xdmtDg4M/EK5B.SlRCPuSRfDbmfl8XjODTobIAh/pTuH6', 'student', 'aTjegq7M087T0q6I9gQVMPVxh3QJygkxWJZsAREWbJ3G9BMSFqaBdBeN0kpC', '2021-02-13 00:23:46', '2021-02-13 00:23:46', 0, NULL),
(139, 'Brody Kirlin', 'xkertzmann@example.net', '2021-02-13 00:23:40', '$2y$10$jh/HWm5L0VwOr9fu3OL8qu3VkIkQV4ovwRltZGsKbUdxzvU/P/tba', 'student', '7Hmsjxh9Fx5gFR10jcpfGbkMLKKsuEGbGQeJyRLB4jYo7RNjWqs9UL8vrGv9', '2021-02-13 00:23:46', '2021-02-13 00:23:46', 0, NULL),
(140, 'Dr. Kennith Nikolaus Jr.', 'vboyer@example.net', '2021-02-13 00:23:40', '$2y$10$8Xi3dVc5Qi36wzNwMnPGWOozJGuT4s.USGgj4EN0YctxYbHTgLQIa', 'student', 'taoRTSunOF3To12B2h8yZEk0yELUmLYkL0ZIiF9HbbSTtw3m00Ut5OzTYQ11', '2021-02-13 00:23:46', '2021-02-13 00:23:46', 0, NULL),
(141, 'Dion McDermott', 'conrad56@example.com', '2021-02-13 00:23:40', '$2y$10$waxx81yKt1gV7fyNOmbxHeYJcgBAMmWss8jKBGY586J88q4suDDxa', 'student', 'pzdoR5b0iw9XBwwxdWTBXIwD93Fs40EE4Wd3w68XkumyrnSJk9wGjX3wyBtq', '2021-02-13 00:23:46', '2021-02-13 00:23:46', 0, NULL),
(142, 'Petra Pacocha', 'kirlin.amari@example.org', '2021-02-13 00:23:40', '$2y$10$D1PdCDt99EcLaohB1YM49.IpTMYvMehs1KqENVIqj5lU2OBPk.Qk.', 'student', 'c812p9Qz1ygDzidhftjB4diAfM36viiS9UduRKScEbu1bpdos2Z8BF7Q8ZQe', '2021-02-13 00:23:46', '2021-02-13 00:23:46', 0, NULL),
(143, 'Eunice Maggio', 'thad01@example.com', '2021-02-13 00:23:40', '$2y$10$DZ4dzMaCYxGwvqpiVRXEzeZ5vhM36Xa9w6CL4MRaXHC98H1lJk0tK', 'student', 'ipxjsJs1QnrlaI9nVhuGxokhWdfuUo4hf6JI4BWvlH5WzRtOJHu3vpvvX26W', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(144, 'Prof. Adrien Bogan', 'kpadberg@example.org', '2021-02-13 00:23:40', '$2y$10$3H5C81xqQ2li4kjSDhSRmeWOHFzzXLAVve5s3Fom.noq2WvJIGAYC', 'student', 'RX2ReQNV6o73yR2ShKMxio11rcOV0o23dsG80cySWG4Eiryei4EHnZ0fGnL5', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(145, 'Junior Treutel', 'ohane@example.com', '2021-02-13 00:23:40', '$2y$10$IL4cthnhpILvOBJue2TZm.ctmAQEQ3gM/KdLd4CWj1FlqQrqL3pNG', 'student', '0VxPeU9hJ83wDjFS3qi4nmYeVFHpuzkNRcO8iE1O6VBJQBbG5NcridzsVJCk', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(146, 'Mr. Gonzalo Aufderhar', 'dquigley@example.net', '2021-02-13 00:23:40', '$2y$10$NbA6RkOokTQFzw8VqyruWOfNS2oY0wRiVXX3O40cyVfDURZZ72xsq', 'student', 'SIwCwrduDlcIM4yrA6tJUDv22fqJCAzDxWmOQ9tmpV7C8wKsK9tbreB0lSqC', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(147, 'Krystal Cruickshank', 'guillermo57@example.net', '2021-02-13 00:23:40', '$2y$10$c9geHC52gN94IF7ZAO7rKul6WFSeb529NJd3ZkZ4w65MjrI4JTIJ.', 'student', 'kN0bnXWfGEfndDrVvj5k7b4mjkyPgDLiWh4CbBcfClZUs6ClgUI46voRcARG', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(148, 'Suzanne Ullrich', 'elena30@example.org', '2021-02-13 00:23:40', '$2y$10$BfOKgzd3Kh.Angy2cRjFIOzVbww9gIJrVkQjsu5jtAX4qeU7oTnCm', 'student', 'nJRGVLerJTDla46tcsf84NgCAPE93FWUOobunjMfqZpFsOANh4ly37WcxpMB', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(149, 'Mrs. Claire Runolfsson PhD', 'ferdman@example.net', '2021-02-13 00:23:40', '$2y$10$qdT65pjf5dhBC13M1F3Wkup/hep6X/e8EYK65UodPWO5qUqHmMX5S', 'student', 'olVuPEAn6TT9Dpe7XCA4NodbqxKdwAzz6g0cFNiqqfztsL5Wy9CXMldsv99Z', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(150, 'Franz Johnston', 'bosco.meaghan@example.net', '2021-02-13 00:23:41', '$2y$10$aLdRYgOBvaYDz1xM1dqPyui3KDRv5o1ZdU0zW3C0XLcxbe/LwFhZW', 'student', 'cDbPMaADeKgDrjxMYxb80qK5ZHmZromX1OeHUAocdhQCyTOohmDlTboY8HAJ', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(151, 'Dr. Alysa Ryan PhD', 'sandy.bosco@example.com', '2021-02-13 00:23:41', '$2y$10$FrETMVpwG.aNodIheI5DJe4OGR3ion35mNF9I1PiVDD1hNQszkxtm', 'student', 'q5fgfpYUOf91fbhZkMH33z289QAJ2A2HjNZhTchoE9g12WWR0KyoUt1OFoN7', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(152, 'Brandi Walsh', 'idell.dickens@example.com', '2021-02-13 00:23:41', '$2y$10$wYQ4UGVH3XUrTPeNcHFy9eRDR75nzLJvt/0Y0WphzystDAHfuxHte', 'student', 'HJ1EazPUOTyVkKNLXsXJdExhRYZj2sDoaVT63jOUkCrA4CiSDa2NgspEf4C0', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(153, 'Jerod Predovic', 'abigale56@example.com', '2021-02-13 00:23:41', '$2y$10$a9LfzpLhYb4Pyr0XlsYUpOa1Aq96WjNvgjWe39NdTWOGegKRuBPUG', 'student', 'DvDz86OLerPFIaaGcqhjjIypqDC3jiekEdkTl3h6cHCaceE5bQkZxVDQf8wV', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(154, 'Mrs. Ernestina Gislason PhD', 'beahan.name@example.net', '2021-02-13 00:23:41', '$2y$10$VOskeo8Lyr9VthCNINd2r.4dygothyAwCRHAEllfuoPndtoySgZxG', 'student', 'CUEmCMECGW3S14hcVKj8OFoNf8VjIidPVpIvYxR4Tpxqqinrvq7vsXBM90dh', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(155, 'Elda Nikolaus', 'douglas.shanelle@example.org', '2021-02-13 00:23:41', '$2y$10$Y8DJUJbP3gNx0tTNsxeDFOuo9GQmLIj7Pkl0KL552IEGSLLmJx/7W', 'student', 'stmakpjesrEMn0fyasfVnMlIHnlzLkCeOJa5fFYEgd51yvdNQknNgtz8sbBp', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(156, 'Chanel Terry II', 'wilkinson.roberta@example.com', '2021-02-13 00:23:41', '$2y$10$w.b9EjDlQ8YpQVsMWY9xKeztxw3yfBcsv6YGxceJAD6PYlpJu.VE.', 'student', 'x0yblaimEq09pTCtzf2VYnWwk8N8OI3H1z0hwgfrOE8yDxcMJ94BhwHuZz7C', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(157, 'Dr. Kamron Abshire', 'von.lauryn@example.net', '2021-02-13 00:23:41', '$2y$10$jdS6mw//BTvl3bfB5eoT6OUHlAfHSarGSvfq1s/KTWT3/UhyYMfqS', 'student', 'yWEr71zNZOr3ZPpKViS47EcAZ2QuqKipUgfdJKQBBDMw2421TNvp3di6O7Sp', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(158, 'Hailee Shanahan', 'rath.stefan@example.org', '2021-02-13 00:23:41', '$2y$10$jFguW6QMUh/u0LtpCRXl2em4yyI3jtBObI1worQHS0kOzozNmbRpy', 'student', 'cxOwbb0LEhey1vysSgwGzXs0TpDJM6sSuAAfSYavEZGNeO0E5ZciUKBpjrx4', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(159, 'Zackary O\'Keefe', 'gutmann.josephine@example.org', '2021-02-13 00:23:41', '$2y$10$Ah3VkJ5fTQ9Ik5wCuBdbROPlBwQo1s9yD28cGqJAnlL0gH1HBgRia', 'student', 'XhTPfh5ten6O4xtVIwZzLdEpdQjOPkdYfnHdxlJxpllXVvZjo4liKxxjTLTN', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(160, 'Alyce Bernier', 'ladarius.adams@example.net', '2021-02-13 00:23:41', '$2y$10$8TtzfrsLkWaFI8yaIIm3teZYMRpmaFZj73o3qgI9vm/RjqoQpc83W', 'student', 'T2L3KSxsTtq9WOJrcitp2IFd3cIsXTwEu6URO7jHCv7SGIHbDhzzQyJGv1up', '2021-02-13 00:23:47', '2021-02-13 00:23:47', 0, NULL),
(161, 'Retta Howell', 'dsteuber@example.org', '2021-02-13 00:23:41', '$2y$10$gjFJ5LiR4l/YjlYA0aq/lOBOSeJB3vWNUNe0eZPCXY35kP1F/XuQK', 'student', '7lHqS6XsAIXgAzoov7xJYcQc7LU802U1aiTosvbBkAgE1HDsUCe7bNHnsrTY', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(162, 'Brandt Durgan', 'xgreenholt@example.com', '2021-02-13 00:23:41', '$2y$10$XMfwlgBPAyaVHo8cYBL.v.aBUU9x9tFLawfW/0x3Q7faf3RyzEcNC', 'student', '9PcnIfxnxwU6AYT40tG0K96qdlK1KhXQVCwNk4V0iabnbaOVxcA3hKKH1d3M', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(163, 'Miss Ethelyn Hane Sr.', 'ubosco@example.net', '2021-02-13 00:23:41', '$2y$10$xGzM591G3vU/Vu5WrfyS6eYIZtP6KWUGSN.YwCuyJ5U1zzESF.rEu', 'student', 'k5o5eKsUZsW56esAGA04YumDDSaQoaKG1i0ijnDr420I0YD4umwxKHPCwApI', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(164, 'Ernestine Ondricka', 'amira.kirlin@example.org', '2021-02-13 00:23:41', '$2y$10$Y/0mpm8dpQTtFeFxwb0rCel.J4NhxR.UGgIbcsau0o9EhPZmrVlD2', 'student', 'NgmuNFaEB5j8BhhvoRTgnskQAoYSj6wj8qdGSa2TUV1Jh9kkIgoVGKBupZQj', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(165, 'Gabrielle Gusikowski', 'sophie.collins@example.com', '2021-02-13 00:23:41', '$2y$10$njJuskJN9pdSwRzIigCdsenXrun3A0JStD/WoIMO/5OWcbyTjd.ba', 'student', 'Fl7irjPJZsSQYREwYPHK0DV7yhDDOL9q8oJvwyiKzKsiDjIZIJXTdGesglvl', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(166, 'Vance Grady', 'klocko.selena@example.org', '2021-02-13 00:23:42', '$2y$10$QRL6oXWzmHZaoEHzUcuwSuQi7Ll4mIsTalszUGbGyoeHjJurp.R6G', 'student', 'LPTp3fQpgBe7E6wvc2c1i5KVpsc0NelDTHIllTgCjOqr9R1QlpPC8d8U3iDC', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(167, 'Mollie King', 'llemke@example.org', '2021-02-13 00:23:42', '$2y$10$DHE6FeFXp72xVCRgdx7Zs.hMy7GWXgVbVdndhqjKFCfYT.O2W92T.', 'student', 'QjhelilcdRspb4IAVIibM1ys74AJSTP9pDCbOMSQ0p46QhXs9hKHCBv8H5L3', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(168, 'Gladyce Fritsch', 'nwalsh@example.net', '2021-02-13 00:23:42', '$2y$10$7MU2a.abgs9mQHneomtmnubFIY0Zhe5QBPZzNbzWbDNTqIAo2pB/q', 'student', '4FKVOR3PoTnsolyU3gooF4gDdelZQCvzPJ6kPQ5xmEmAz1CGeoLFdRsejqYy', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(169, 'Zakary Boyle', 'trantow.ryder@example.org', '2021-02-13 00:23:42', '$2y$10$11dIs1k5RTFtR5tuigEyROLFxS2OKE6LIuIfoaxFzSitWucm6i9p6', 'student', 'QkOT0hVdkavCGoVQG4dC89pgfX9rU6cAsdFRnVLpHtCIREkb4WLVjojEElQm', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(170, 'Rowena Grimes', 'bpredovic@example.org', '2021-02-13 00:23:42', '$2y$10$iP4zR0P0TkeeBOaFJMEJh.5UoqpVV.T5s8yNert4BYg0PQvoYiQHa', 'student', 'XXsBt4YarnCncFiqHhAIKO4Zw4xBNt7j7Sd8o68NiUFfKZwdmypccJlGH0qS', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(171, 'Weston Heaney', 'hane.maci@example.org', '2021-02-13 00:23:42', '$2y$10$EoPp4Pxz5qdO56m13SrLm.RG0dTRtS60GNqd80hXbuukwLiXxL1qe', 'student', 'lbq0QhDRoeb60zPdg4hd64c1qAcHfflJb5R8PwNw1TmwsZwkwiDUTDA4RTOm', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(172, 'Cecile Anderson Sr.', 'hintz.roosevelt@example.com', '2021-02-13 00:23:42', '$2y$10$S4.Zj.wEmMPaygjaPvoBj.t9jjoBmhIYfe6VcUqFihUgbDtvNt3Z.', 'student', 'xCZeQxeO5fRwIRrmRp7Z5zOtnD1l0TSVBRiHMs1IOv77BWnkyzxbs1tMdwWv', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(173, 'Adele Zulauf PhD', 'lindgren.neha@example.net', '2021-02-13 00:23:42', '$2y$10$h5iFuDSudw/wgVnu8eNDtu87mkehKpv7c6lwVMdDr7JE1MGM2z9A6', 'student', 'Yq1X9wGdcf42AacQI97DuontZBKbd7KXKf3AiuP4UB4Y6o9I8FUdgk0yw8XB', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(174, 'Raquel Graham IV', 'krystel.dickinson@example.org', '2021-02-13 00:23:42', '$2y$10$SLmNXlayNUnzze.jg3G9XOAi.gLoBOx3pn7yhBz7Tmz.AtojaEgvq', 'student', 'RDgL7GRsm00vfgtdUCmPEkZUN37TRK6IDcIZkotEFXAQGSosz4XZvEI3uCKS', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(175, 'Patsy Carter', 'gennaro.cassin@example.net', '2021-02-13 00:23:42', '$2y$10$u1hXyNJgmSszSfe3lKlh3eb.C6XDd.uqFOBuVc5jyghL.lxP4qKam', 'student', '65WYi8F88fmBvfK5O7328FCXQlTbQ2XGoouwZ1QpidKPqagRODhwigPg5S51', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(176, 'Sebastian Kertzmann', 'gilbert.kautzer@example.org', '2021-02-13 00:23:42', '$2y$10$gIFDpTz8kRlsEoDxf6Wx7Oo6MTC.0yeG99Dgyp90KzmDUc34PGA0C', 'student', 'e2FUcAZB69KgqsKN3v853kvaaSFyAHXS32peNZkrS5EwfUTha4KzpxXzqRAB', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(177, 'Prof. Jolie Rippin', 'anabelle.leannon@example.org', '2021-02-13 00:23:42', '$2y$10$5J2u2q2OXwjej/DjNoRF5uKc7N9Y5sJi9q7llOQUtR.mZZqySlGJi', 'student', 'B7bfxP42zwLl2lBWnCtM2g52BzSeD4570aEwVivV5MG1CuXokl5zJZxqqFbD', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(178, 'Alberta Torp', 'bgibson@example.com', '2021-02-13 00:23:42', '$2y$10$dr6Fj3NRzUt4Yqw2vFvWUuws8Y20hRwBGvekmrgJC0Xgw4TQaCxEe', 'student', 'sV7JkfU7chA4MrQI7Rlzs8w22i5SxNCziPqBTB0jsNPgE6JNNRwutrOempbX', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(179, 'Cleve Hodkiewicz', 'bergnaum.mellie@example.org', '2021-02-13 00:23:42', '$2y$10$kUPShorX6vLBIJF6.1adJeI0okABwtbN1p4D5wIEb8WumdAGUVpTO', 'student', 'FQaVFd8SOZKxbn4ahPbEBRsD4fsZK5iY4hTu7kuB494zjuvjIfQlTT8XwHfY', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(180, 'Hilma Kuphal', 'august.walker@example.com', '2021-02-13 00:23:42', '$2y$10$9eVdtaetrFGhwve6BdDzruNUYezRwuLUzdEmLltJ9bhhY2SLRrfOW', 'student', 'JakkRpCRnoDmjV3rRvSSyFfnfcqwCqa09PDn2mWognedoepkK2wYrZClcTHh', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(181, 'Birdie Von', 'mhauck@example.org', '2021-02-13 00:23:42', '$2y$10$qC4jbPRWhvdX7I8Jsygp0eVVxzf5kTH1rlmd/JLZZ4YUSyqJHW6WC', 'student', 'kFadBDnKJ1M4LGC612DTuhjDF93rB9ncVLjb2L6UIoISVRrThCPPDtE09ESA', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(182, 'Dr. Liam Kilback Sr.', 'alford.weber@example.net', '2021-02-13 00:23:43', '$2y$10$F/Bn4imdZVJ.sa24gO5LOurMFW.RFfBHXl/O0kueByocyLY0Fax/e', 'student', 'BUypzYfttbUs88vdptzz8Lu9iEMq05aVjgF1JC1iu4fWMlzC0LtIpigLXaiU', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(183, 'Deion Wunsch', 'vella97@example.com', '2021-02-13 00:23:43', '$2y$10$TY2aRyDVrn9OrPT.wOTEEeU4wOD3St66cxJaUc6QftfyvQAEAyjsq', 'student', 'XP4dxWXIzg2wAhg8M5HxdwCm23e7sSrUBEfWZbNSKi9KLVI86m4YI6tyQxlZ', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(184, 'Virginie Bogan', 'amely08@example.net', '2021-02-13 00:23:43', '$2y$10$8bASTn9NuETuZn5nLeS0CukZSy7H..OxfUJJRJjHhRbSK6odQ8Wnu', 'student', '6YxelJ9iDbg0Hmhc4gYRhX7pTtuU5FiaDttio6cacHZFAAiMeWN1RXVhvvEs', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(185, 'Geo Langosh MD', 'rosetta.bartoletti@example.org', '2021-02-13 00:23:43', '$2y$10$qk5bWvWVA2sTEonebMuUxu1120RMsxrWj8sS8Uawqdgu0p/ghHTS6', 'student', 'WGB85loLZDrSlZGwzg5QpxiAfex1YykqYhROz2jBKJyEervAtra4psTr48Du', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(186, 'Verda Dickens', 'trantow.pink@example.net', '2021-02-13 00:23:43', '$2y$10$yF7zMsVEwqfd02a.rvuV3ehnBM3Dy23KniTv5IXPGJAh.XHB7Lr1K', 'student', 'WT5Oiv5cnZbnjMIyfqyKXFgyPoiZxJARkAUIZJ54ThkbJXaAPVYT0s25wTXQ', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(187, 'Bernard Bins', 'dorn@example.org', '2021-02-13 00:23:43', '$2y$10$CtHuxoAXuMvKadQqLCB50eaOVh/fVs9oFQq/ErdyKLtVJGolwQGdK', 'student', 'kYq4FyAV6NeObFD3EUMaxGzYcazy4qhybkrzaNgtgYk4FeqHZYgqoehdSoEb', '2021-02-13 00:23:48', '2021-02-13 00:23:48', 0, NULL),
(188, 'Kathryn O\'Connell MD', 'jeanie.prohaska@example.org', '2021-02-13 00:23:43', '$2y$10$Cid3Rwh5GoXEfpKZSyMEB.Gz9vrgBPHT/qW7vhX9DG/9KGAA1FpHe', 'student', 'zx6sPshIeYzRBLyjXIKPzMkhmEpGeAVNyEr494XGuBvspsr9dfqGz8sM9Q5N', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(189, 'Dr. Name Hill', 'sammy.conn@example.com', '2021-02-13 00:23:43', '$2y$10$YNFjrdxiBMubgoIgNDajweHqGQEMddLKCcA2Pda9cTTJoo5bVCsye', 'student', 'FaNEfTVvF3qxAnSD9WGkasVCAS9pWyYwcIoKDDeGBd8CfHvlLn6CaHqNpVAf', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(190, 'Alexie Hilpert', 'afeest@example.net', '2021-02-13 00:23:43', '$2y$10$C7DW0Bg.z2A8Q8S6yuS0y.kcG4istrdWJhlioWswIb/58IX102eiy', 'student', 'J05VeYDcH4tYQmbDKwe3yw9WyS3k3FP6zxQXkQtmk2Tc8IbqS9leSNKb3o8x', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(191, 'Dr. Dangelo Green II', 'wyman.velva@example.org', '2021-02-13 00:23:43', '$2y$10$rjubpsHQw4pHa6nEPq3m3.m7gVpx2zzJiVoqey3Wymx.fcEwx6l1e', 'student', '0Kazek1MLVycWYQ8keZJgaraqM2qWGZAhD8MOygmjb7anKIH8VifjauAtwpm', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(192, 'Herminia Hintz I', 'magdalen26@example.org', '2021-02-13 00:23:43', '$2y$10$g5Zm.y7Ilgv/q3LmPX0r1eoccUwnXetm0Xjd8acHb6AmJyGju0gXS', 'student', 'dFDHOdwly5LojyvlUQioKGAmh456jLBZyh9FO1B6CAA7bwGPUgWxRvHd7Smd', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(193, 'Dr. Gilbert Beahan III', 'rolfson.sally@example.com', '2021-02-13 00:23:43', '$2y$10$zK/s.JLjYU5fVA0Vi6cBWOU6XJYUrXfKYR22cuDijuVjOVSNahkZ.', 'student', 'u0fTBWFbJt62hzXa2tWARWrzVI2VbaVhgiASsGFBSOj8eOjSqpLnj2p2wYIf', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(194, 'Casey Kassulke II', 'colby.langosh@example.net', '2021-02-13 00:23:43', '$2y$10$lioQH9AZSx/yg8beUc9mSeMZjO1CZJsOH2Mo4Pf0.b77KKL3N/wv2', 'student', '3Wp1JSw5AmkVn1tXHnVYCmMW0qsJek5vMx064nGTtSPYQ6rbmXIu2QKp7PAa', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(195, 'Genesis Larkin', 'ernest56@example.net', '2021-02-13 00:23:43', '$2y$10$Yo3GHBVwxqm90CEZW6/1RuBwjZIge9miz2WZcQXL1r/2bO2Ji74Pq', 'student', 'EhRwngoq3qbwEK2Rou13eUjj04JZUDMJo6UiM2Du4qM6uCMPMyvZM6BcxDHf', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(196, 'Mr. Sigrid Gorczany', 'antonina.franecki@example.org', '2021-02-13 00:23:43', '$2y$10$/z6ZIDkL5fzKHmBt1CBkOujRtBWUo7oa7FzxMrzDigw3Fff3q2CVa', 'student', '5ROAp2lyk2v8h9V78GRVuGzrM7ZDEUMFeGTovkPRZAt6Tzkvirzz8ustCLhy', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(197, 'Dagmar Emmerich', 'friesen.verlie@example.org', '2021-02-13 00:23:43', '$2y$10$5gnmqOowlArMeQLLAPiAAeB2zdNq2JF0HU9gD4GrQeGhXq.oOCbPy', 'student', 'gtBaW2P9hcAcTbl5P3nJxO0ktjwPbqMceExBJgTkLtujhl2gxa42NZN9gSsG', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(198, 'Riley Brown', 'iabernathy@example.com', '2021-02-13 00:23:44', '$2y$10$JJtFFL3a0.EfDHlBAsV2XuTRDvF88j1caNfp2xCn4aPEndsa50zpe', 'student', '3XZVEFkLo41G3xsZfOXFhvxZsdEtU2OGkcsl4TbdTfyqZ6Nayq43NwSNYnFk', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(199, 'Milo Langosh', 'ptillman@example.net', '2021-02-13 00:23:44', '$2y$10$A0oQe/Pu19w/2xE79JzqC./kWUMMP4P4W8XFIefvMd0CA1ZOHnCe6', 'student', 'N4Xd9AIRGX8AQQI85YOE393crRPJSelJMDgdSIEfH9gBJUMopKF9bU0XwnUD', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(200, 'Maximillian Veum', 'mhodkiewicz@example.com', '2021-02-13 00:23:44', '$2y$10$qikPeJjERaHhNZP4sauARekuynAT8hNdrJ.sNGTZuJEO1X1fwKzHq', 'student', '4UeJZVtH7zBm9aMR0tJTreqWfBkPR5Zxq1Og66zGiBtjMGS9mYxdOJdJlPgI', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(201, 'Prof. Clyde Beatty Jr.', 'miles.boyer@example.com', '2021-02-13 00:23:44', '$2y$10$DUe9qVzfNq3YoCLq/qmaVO5lGA9EbtWTZPbZber4xhiOSCFtbycbK', 'student', 'aVVkDQwr5miKvqAJ1kxtOS1pjsdvsfnn7ltYIPlKQqdXXfTSPOFlWvSDlcAM', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(202, 'Abbey Hickle III', 'leilani86@example.org', '2021-02-13 00:23:44', '$2y$10$nIVu6gA/dWcUgHg3vefbPuQmEJBMcY8BTN/xoKz7Rrd/TJ/Y9h9f.', 'student', 'ryDfE4MyoW', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(203, 'Miss Rosanna Goldner', 'rosalyn.mcglynn@example.org', '2021-02-13 00:23:44', '$2y$10$cyZvNQ.MlhooJrYtIp7fYu1o6FQecyGWOlTCHl1X7qiXbQRd0moES', 'student', 'sWHJdSqL9aafSq4WXrvXplujSc15j6f8AkiFAtXjsjzIX2Fb3jdbKZ2sspgu', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(204, 'Mrs. Magnolia Schiller', 'kwilderman@example.net', '2021-02-13 00:23:44', '$2y$10$qMa3cP6lrMSMotJaKEZlru.cQjJ98gS1m0Hbi65lQYkAdRMTOYvRu', 'student', 'ayGfxc1o9jVofIdJnjXh7jgOtxRtUTOyPATlUH8fGAcAY4DhMSeNmLA6Cmbb', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(205, 'Elinore Green', 'reichert.bertha@example.org', '2021-02-13 00:23:44', '$2y$10$xsz1pYoW9pXMZpodz55.g.kEjVb/.NmbBLzy.iUGFwvCXhaPnp9Km', 'student', 'jcFo9KzM7TTASUUMzHaZQ6IuTySRfW4Bb3OdK9FpMVPN5DfFL1HLgACeCAH1', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(206, 'Dr. Missouri Gaylord', 'camren64@example.com', '2021-02-13 00:23:44', '$2y$10$oplrMH0rN21OvQ8NJskOaO2d2uhb3YscwYX3xuqwBnO41XCaEEk62', 'student', 'T2qX3whP3iAOLUGUGnFqEelbKcji67T4WeTluqOdXd67rP3ZNs7wO7TRIHSO', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(207, 'Miss Loma Berge', 'celine58@example.net', '2021-02-13 00:23:44', '$2y$10$SOt7NAklmpHegnU.OnRaNuwrFjQOwHK3oM5DvxZE7U0gZayKP84Da', 'student', 'qGln7qQQyzkmKbopzCqjl4KrQYivYaxykXr1mYfpcenkGKtZjqtM5MbyC6Vs', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(208, 'Prof. Rogers Schuppe', 'corrine41@example.net', '2021-02-13 00:23:44', '$2y$10$d/omj190gHySIKZ50e7Z9O8UGzJ3rQw88o5EadqqAOI7oOSS2/7N6', 'student', 'leC0xSOG2cQRXwcWKb2Nt34OC8goAvG6CHmcVFnOsk7c8xMQjNcTISVGOFd7', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(209, 'Doyle Funk', 'kveum@example.org', '2021-02-13 00:23:44', '$2y$10$FDRLGNltyYlZo1UiUqLnXej.Bdi0L3KgVmVypBZ3mHjcYyVfzCO.G', 'student', 'zOIrhMcbZ1GbE3rDwmyyE8fERvOV6ytKrboH7lDDiuCJWCodel9dTTPZUYkT', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(210, 'Karl Rempel', 'augustus82@example.org', '2021-02-13 00:23:44', '$2y$10$jTVqrRgoswsTaBucqWOZ/.RdC4vKxkx/F.tuEWrRX9bvGxgUV1sPC', 'student', 'oYx1QcnQl075yjbDoERSiJIWXzwJKwNDNIUNBmdQF6oo7DIjFAIFihO73Fay', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(211, 'Phoebe Aufderhar DDS', 'qmurphy@example.net', '2021-02-13 00:23:44', '$2y$10$sSP8ubSgNtnKgedGxp1OW.MRTXh0wcPWxKCX.v90VzOMuaJkGSnqy', 'student', 'i9NCCdHJidXsy9dZOWq1kYOeLUzY9fuWBd8ikJXJ6hvr8oa6LS9ud4vw5oKQ', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(212, 'Mrs. Thelma Johnston I', 'jenkins.etha@example.com', '2021-02-13 00:23:44', '$2y$10$C.Ljbtwp5kjgh.rJ.oRRxerYdHy8PIy2efDI6o3bLdu02XMdBFQ6S', 'student', 'YiLMbzcIsuv3tqDxzSLQos8rdzIZcIq32gpvlpNNYeoXsg7PLpzChdQygqzN', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(213, 'Katherine Pfeffer', 'stan.buckridge@example.com', '2021-02-13 00:23:44', '$2y$10$JwczMFJhkwMHCSNQfCpqT.EmumAwpFE4Ob1lQ1Rt805WwJsqTy0PO', 'student', 'ZS5b4w8rWao7qNlvrlESpvWyuumwUcWIuhCMhKde9u0ZPS1p7L65YQPG8hGj', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(214, 'Alessia Deckow', 'joconner@example.com', '2021-02-13 00:23:45', '$2y$10$.0dToI8z2mgTIpkDddSmvuN6RzH1P0euNVGFcs/RetF1D47Q5Ulaa', 'student', '3WDiLu5eRXss1BnvotBNpfpHZqbzvH4OguRqgS1bsYtmIznA7BYQ4e2Dmm1v', '2021-02-13 00:23:49', '2021-02-13 00:23:49', 0, NULL),
(215, 'Dulce Runte IV', 'marion92@example.com', '2021-02-13 00:23:45', '$2y$10$UP0KtADWE8qSeV9cVFHg0ejvnbtB/OcVXMK04FYhI0hxH7OVZD9Vi', 'student', 'nX75GC72wMwTEgRDexKRhbNZ36jWd9BCywhhe4H2pxH3EAIkvL1rZ8ZxI0kl', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(216, 'Ericka Kovacek', 'everett.hermiston@example.org', '2021-02-13 00:23:45', '$2y$10$LS0QIFMvbCNyFtSOTwjMa.3H5TARmYxZBCOVNefeh/nFq0i7/XtIS', 'student', 'My1yBiftI7sODSEG2IhvOePGJ1KLMzTrCG7UU5yuzNkCFj6m01v32tLxQPT1', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(217, 'Miss Myra Steuber IV', 'xmclaughlin@example.net', '2021-02-13 00:23:45', '$2y$10$CRIWKgSKta1JMMBL8XUjpuiyFMzMZjF2B3Dhdy9vObYaesLYycYRq', 'student', 'jEWYwJop36OZxPArBmSgKkq7xqPBXUZPikc8gFOjoZb5hOGFNkYURe2GQAKv', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(218, 'Darrick Kassulke', 'vella57@example.org', '2021-02-13 00:23:45', '$2y$10$qKZqLeF39V2d8oSIajcJ8uhjBL8SyrBJTGK/SrIuweipM7Rg/0.f2', 'student', 'jUxlXGQ8pXNj9zfzA8KFaiozZ9ggwwmzOw9IVGa6g8MYloZgrsWY6u4Lre3x', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(219, 'Garrison Gerhold', 'charles39@example.com', '2021-02-13 00:23:45', '$2y$10$xvq.eTAnQpc.33Z35Qt8e.mI1Xuu5qusi18h5cdxzR0oazZEh891K', 'student', 'i6ttT81k5p4Dd8XZXhXIRkCLzsxCbpeltFwkxGbsPxEwURVkPCD2csmScQRi', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(220, 'Eugenia Schowalter', 'phansen@example.net', '2021-02-13 00:23:45', '$2y$10$0mmDBl90Tm5TmHKoNqgin.VwfbnP8w/J9WQhDNQGMrLvXnR9/C4kK', 'student', 'SBKWArZBZsNqrV8W4V4h4igdJfN7iXIVdxur2uSDRtn4n8OoMS5wSNjB4h5Y', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(221, 'Laron Hoppe', 'toni.oconnell@example.net', '2021-02-13 00:23:45', '$2y$10$.Rg.7xRTOwwlAJEDoXCeE.cPvEJt3dq02lNzjD35e768ypa3GuJr6', 'student', 'wE7bkAkjR4dxn6L9vaaLkaZrG48iVfQBhVXwq4uy74Mn3rKngo82YqOqUQkr', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(222, 'Otto Reichel', 'carlee.green@example.net', '2021-02-13 00:23:45', '$2y$10$oJH5QYGLtlzzbhbjZ58.6un387JUh/udKB3Gkc/QqYegJ4rn7fOxu', 'student', 'uBcfqlArdlmb0RD9YyMq3KsNHIufpCfTsFH7B6SwOxI6zjEe5pP8LHZpY28A', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(223, 'Prof. Jed Kirlin', 'sskiles@example.org', '2021-02-13 00:23:45', '$2y$10$k3kdLotEap0pcMoGrErQr.3t8kUQcV/tEW1oUHn4xueqfc0tMAbdy', 'student', 'TxqHXy3w6miOcP0Tk863KFXjswTjs1xxu7gZith3ZHLI0CheirCppMVm4JSi', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(224, 'Parker Friesen', 'hubert.jakubowski@example.net', '2021-02-13 00:23:45', '$2y$10$fEhimdLWY4Eutdewpi6uPeWEeV6J45MUsPe5b9thKBIYfmHZeiuzG', 'student', 'bNlUWMf8NywJm6dhZxT1Squqw8r84x4RDpyzwjlLEY0lMNb0O3uXyXnPLBrK', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(225, 'Jayde O\'Hara I', 'ckessler@example.org', '2021-02-13 00:23:45', '$2y$10$1EYsqLE1FghXGr/z9wmKKO73q7bcPLMuSC6abg9VmF.QvYRGJM1Iu', 'student', 'vXdqIM3D2GwpdzAzM8DCcOGuNiJu4j0Sgtb5YANpARagIOxB9Ehowv7TzBZ9', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(226, 'Miss Marjolaine Schowalter II', 'llubowitz@example.net', '2021-02-13 00:23:45', '$2y$10$Lp03vSjyMJUbetKCOwCPU.HZtM7pizP6MrHSyS5sjJWVAMfF41CUy', 'student', 'USPcSGL2rNIVOr7V0chG0caZxM5GmleghgL81BuSSxo9WQsIcnyknvGht5IZ', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(227, 'Frederique Botsford', 'sister.ward@example.org', '2021-02-13 00:23:45', '$2y$10$/BJ043ToyzS6f6SiaxY3bul/7ci4aORVoiZFGBcLHo5dC1WSouvRe', 'student', '3UPt6jKpHTmizGIfHwkGsTSoMerosWEXvWIBJqc7rk9r0v4rSzipLq3srAdJ', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(228, 'Andre Harris DVM', 'sporer.august@example.net', '2021-02-13 00:23:45', '$2y$10$bwTocewiTBRJSMTnadFgHeWeGtHGN4b9vPkmLPAOe46dKb5SKLkg6', 'student', 'OrLSwA0dHCHxKCWNOC85ss14B9jt3z9ujvFbclylS3dBD2wiDqUCMMTO7oTm', '2021-02-13 00:23:50', '2021-12-17 10:08:54', 1, '[\"cat-3\",\"subcat-4\",\"subcat-9\",\"subcat-9\"]'),
(229, 'Sierra Block', 'cbaumbach@example.org', '2021-02-13 00:23:45', '$2y$10$CRGdtydRq.MCagkfhyfUa.22wZnPGXZpmyhr9rlknECRQ.p4rpBbu', 'student', 'qP9mUBqDxryj7wbo6usS0pegqWuJKeExBhrpsdn15L9BULCSFNqyq5eSnwBY', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(230, 'Tomas Fay', 'hershel.rolfson@example.net', '2021-02-13 00:23:46', '$2y$10$zMBcLobHAPUwcTC/H7rJC.Y9jlT.DA/VzhJMW5v2nIZU6JcUsDLg2', 'student', '9435hI6wmtNkI64XW7d1i6fAUPEtMyr0A27IieeHypLLIbEMkjmx5KXC06uL', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(231, 'Chance Blanda', 'enrique.welch@example.com', '2021-02-13 00:23:46', '$2y$10$.gGS7jDruWSJkvHY8vAXzeN8gSrCmx0rCKa9IVpimiHD2fp6uso8a', 'student', 'aorvfLBZKQxTpdElUfi7lyctGoefd4YvCbdrM8x0dVSxuo8OdcAsaaexyxxL', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(232, 'Evans Lind', 'mavis99@example.com', '2021-02-13 00:23:46', '$2y$10$rs2CB36uRLBtbr1NxEfDLeoamlu9AdTyOsMuyTjDN6kncZQSrzN4G', 'student', 'qVxvtfbaQoA9ktT3U4hRVYwNxkrnGOuWoiSygXt6IJiUOuYue3rYa1Vw7hcL', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL),
(233, 'Meta Frami', 'jensen.gottlieb@example.org', '2021-02-13 00:23:46', '$2y$10$ke1a2QFdJpfA4XIl1Gaqs.bBcH9ArjQsG3wcwkbjWD2Zeo5SoJ/qK', 'student', '5NTe351G6bDcrigaBlQBSbHjGw1g4egm0hFZ16A9eUNxzgw3MfHvQj5RRqPT', '2021-02-13 00:23:50', '2021-02-13 00:23:50', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_profiles`
--
ALTER TABLE `admin_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answers_replied_by_foreign` (`replied_by`),
  ADD KEY `answers_answer_for_question_foreign` (`answer_for_question`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career_paths`
--
ALTER TABLE `career_paths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `career_paths_creator_id_foreign` (`creator_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contributor_profiles`
--
ALTER TABLE `contributor_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_contributor_id_foreign` (`contributor_id`),
  ADD KEY `courses_category_id_foreign` (`category_id`),
  ADD KEY `courses_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `course_exams`
--
ALTER TABLE `course_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_exams_user_id_foreign` (`user_id`),
  ADD KEY `course_exams_course_id_foreign` (`course_id`),
  ADD KEY `course_exams_lession_id_foreign` (`lession_id`),
  ADD KEY `course_exams_question_id_foreign` (`question_id`);

--
-- Indexes for table `course_lessons`
--
ALTER TABLE `course_lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_lessons_course_id_foreign` (`course_id`);

--
-- Indexes for table `course_progress_reports`
--
ALTER TABLE `course_progress_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_progress_reports_user_id_foreign` (`user_id`),
  ADD KEY `course_progress_reports_course_id_foreign` (`course_id`),
  ADD KEY `course_progress_reports_lession_id_foreign` (`lession_id`);

--
-- Indexes for table `course_questions`
--
ALTER TABLE `course_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_questions_course_id_foreign` (`course_id`),
  ADD KEY `exam_questions_lession_id_foreign` (`lession_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interest_surveys`
--
ALTER TABLE `interest_surveys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interest_surveys_student_id_foreign` (`student_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_asked_by_foreign` (`asked_by`);

--
-- Indexes for table `question_and_answers`
--
ALTER TABLE `question_and_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_course_id_foreign` (`course_id`),
  ADD KEY `ratings_student_id_foreign` (`student_id`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `student_profiles`
--
ALTER TABLE `student_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `survey_questions`
--
ALTER TABLE `survey_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutorial_comments`
--
ALTER TABLE `tutorial_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_profiles`
--
ALTER TABLE `admin_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `career_paths`
--
ALTER TABLE `career_paths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contributor_profiles`
--
ALTER TABLE `contributor_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `course_exams`
--
ALTER TABLE `course_exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course_lessons`
--
ALTER TABLE `course_lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `course_progress_reports`
--
ALTER TABLE `course_progress_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_questions`
--
ALTER TABLE `course_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_questions`
--
ALTER TABLE `exam_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interest_surveys`
--
ALTER TABLE `interest_surveys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `question_and_answers`
--
ALTER TABLE `question_and_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=640;

--
-- AUTO_INCREMENT for table `student_profiles`
--
ALTER TABLE `student_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `survey_questions`
--
ALTER TABLE `survey_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tutorials`
--
ALTER TABLE `tutorials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tutorial_comments`
--
ALTER TABLE `tutorial_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_answer_for_question_foreign` FOREIGN KEY (`answer_for_question`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `answers_replied_by_foreign` FOREIGN KEY (`replied_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `career_paths`
--
ALTER TABLE `career_paths`
  ADD CONSTRAINT `career_paths_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `courses_contributor_id_foreign` FOREIGN KEY (`contributor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `courses_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`);

--
-- Constraints for table `course_exams`
--
ALTER TABLE `course_exams`
  ADD CONSTRAINT `course_exams_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `course_exams_lession_id_foreign` FOREIGN KEY (`lession_id`) REFERENCES `course_lessons` (`id`),
  ADD CONSTRAINT `course_exams_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `exam_questions` (`id`),
  ADD CONSTRAINT `course_exams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_lessons`
--
ALTER TABLE `course_lessons`
  ADD CONSTRAINT `course_lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_progress_reports`
--
ALTER TABLE `course_progress_reports`
  ADD CONSTRAINT `course_progress_reports_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `course_progress_reports_lession_id_foreign` FOREIGN KEY (`lession_id`) REFERENCES `course_lessons` (`id`),
  ADD CONSTRAINT `course_progress_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD CONSTRAINT `exam_questions_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `exam_questions_lession_id_foreign` FOREIGN KEY (`lession_id`) REFERENCES `course_lessons` (`id`);

--
-- Constraints for table `interest_surveys`
--
ALTER TABLE `interest_surveys`
  ADD CONSTRAINT `interest_surveys_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `student_profiles` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_asked_by_foreign` FOREIGN KEY (`asked_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `student_profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_profiles`
--
ALTER TABLE `student_profiles`
  ADD CONSTRAINT `student_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
