<?php

require_once("recommend.php");
require_once("sample_list.php");


$re = new Recommend();
print_r($re->getRecommendations($books, "jill"));

?>