<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.project.model.User"%>
<%@ page session="true"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
%>
<%
	if(session.getAttribute("email")==null)
			response.sendRedirect("Login.jsp");
    String email = (String) session.getAttribute("email");

String username = (String) session.getAttribute("username");
%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<title>Flight Fusion</title>
<link href="https://w7.pngwing.com/pngs/974/566/png-transparent-google-flights-airline-ticket-hotel-travel-blue-angle-flight.png" rel="icon">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css"
	rel="stylesheet" />

<style>
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap")
	;

@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap")
	;

:root {
	 --primary-color: #3d5cb8;
     --primary-color-dark: #334c99;
     --text-dark: #0f172a;
     --text-light: #d4d2d2;
     --extra-light: #f1f5f0;
     --white: #ffffff;
     --max-width: 1200px;
}

* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.booking__container .form__group {
	display: flex;
	align-items: flex-start;
	/* Align items at the start of the flex container */
	gap: 1rem;
	MARGIN-LEFT: 36PX;
}

.booking__container .form__group .input__content {
	flex: 1; /* Let the input content take up remaining space */
}

.booking__container .form__group span {
	padding: 10px;
	font-size: 1.5rem;
	color: var(--text-dark);
	background-color: var(--extra-light);
	border-radius: 1rem;
	margin-top: 0.5rem; /* Add margin to separate from input */
}

.booking__container .form__group label {
	position: absolute;
	top: 0;
	left: 1rem; /* Adjust as needed */
	transform: translateY(-50%);
	font-size: 1.2rem;
	font-weight: 500;
	color: var(--text-dark);
	pointer-events: none;
	transition: 0.3s;
}

.booking__container input {
	width: 100%;
	padding: 10px 1rem; /* Adjust padding as needed */
	font-size: 1rem;
	outline: none;
	border: none;
	border-bottom: 1px solid var(--primary-color);
	color: var(--text-dark);
	position: relative;
}

.booking__container input:focus ~ label {
	font-size: 0.8rem;
	top: -1rem; /* Adjust position when focused */
}

.section__container {
	max-width: var(--max-width);
	margin: auto;
	padding: 5rem 1rem;
}

.section__header {
	text-align : center;		
	font-size: 2.5rem;
	font-weight: 600;
	line-height: 3rem;
	color: var(--text-dark);
}

 .btn {
     padding: 0.75rem 2rem;
     outline: none;
     border: none;
     font-size: 1rem;
     font-weight: 500;
     color: var(---primary-color);
     background-color: var(--white);
     border-radius: 2rem;
     cursor: pointer;
     transition: 0.3s;
 }
 
 .btn:hover {
     background-color: var(--text-light);
 }
.btn1 {
  padding: 0.75rem 2rem;
  outline: none;
  border: none;
  font-size: 1rem;
  font-weight: 500;
  color: var(--white);
  background-color: var(--primary-color);
  border-radius: 2rem;
  cursor: pointer;
  transition: 0.3s;
  MARGIN-LEFT: 36PX;
}

.btn1:hover {
  background-color: var(--primary-color-dark);
}


a {
	text-decoration: none;
}

img {
	width: 100%;
	display: flex;
}

body {
	font-family: "Poppins", sans-serif;
}
 nav {
     background-color: var(--primary-color); /* Background color for the navigation bar */
     box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* Adding shadow for depth */
     padding: 1rem 2rem; /* Padding for better spacing */
     display: flex;
     align-items: center;
     justify-content: space-between;
 }
 
 .nav__logo {
     display: flex;
     align-items: center;
     gap: 0.5rem; /* Adjust gap between logo and text */
     font-size: 1.5rem;
     font-weight: 600;
     color: var(--white); /* Text color changed to white */
 }
 
 
 .nav__links {
     list-style: none;
     display: flex;
     align-items: center;
     gap: 2rem;
 }
 
 .link a {
     font-weight: 500;
     color: var(--white); /* Text color changed to white */
     transition: 0.3s;
 }
 
 .link a:hover {
     color: var(--text-light); /* Hover color changed */
 }
 
 .btn-logout {
     background-color: var(--text-dark); /* Background color for logout button */
     color: var(--white); /* Text color for logout button */
     font-weight: bold; /* Bold font weight for emphasis */
     padding: 0.75rem 1.5rem; /* Adjust padding for better appearance */
     border-radius: 2rem;
     border: none;
     cursor: pointer;
     transition: background-color 0.3s;
 }
 
 .btn-logout:hover {
     background-color: var(--primary-color-light); /* Darker background color on hover */
 }
 
.booking__container {
	border-radius: 2rem;
	border: 1px solid var(--extra-light);
	box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.1);
}

.booking__nav {
	max-width: 600px;
	margin: auto;
	display: flex;
	align-items: center;
	background-color: var(--extra-light);
	border-radius: 5px;
}

.booking__nav span {
	flex: 1;
	padding: 1rem 2rem;
	font-weight: 500;
	color: var(--text-light);
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
}

.booking__nav span:nth-child(2) {
	color: var(--white);
	background-color: var(--primary-color);
}

.booking__container form {
	margin-top: 0rem;
	display: grid;
	grid-template-columns: repeat(4, 1fr) auto;
	gap: 1rem;
}

.booking__container .input__content {
	width: 100%;
}

.booking__container .form__group {
	display: flex;
	align-items: center;
	gap: 1rem;
}

.booking__container .form__group span {
	padding: 10px;
	font-size: 1.5rem;
	color: var(--text-dark);
	background-color: var(--extra-light);
	border-radius: 1rem;
}

.booking__container .input__group {
	width: 100%;
	position: relative;
}

.booking__container label {
	position: absolute;
	top: 50%;
	left: 0;
	transform: translateY(-50%);
	font-size: 1.2rem;
	font-weight: 500;
	color: var(--text-dark);
	pointer-events: none;
	transition: 0.3s;
}

.booking__container input {
	width: 100%;
	padding: 10px 0;
	font-size: 1rem;
	outline: none;
	border: none;
	border-bottom: 1px solid var(--primary-color);
	color: var(--text-dark);
}

.booking__container input:focus ~ label {
	font-size: 0.8rem;
	top: 0;
}

.booking__container .form__group p {
	margin-top: 0.5rem;
	font-size: 0.8rem;
	color: var(--text-light);
}

.booking__container .btn {
	padding: 1rem;
	font-size: 1.5rem;
}

.plan__container .subheader {
	margin-bottom: 1rem;
	text-align: center;
	font-weight: 600;
	color: var(--text-dark);
	letter-spacing: 5px;
}

.plan__container .section__header {
	text-align: center;
	font-size: 3rem;
	line-height: 4rem;
	margin-bottom: 1rem;
}

.plan__container .description {
	text-align: center;
	color: var(--text-light);
}

.plan__grid {
	margin-top: 4rem;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 2rem;
}

.plan__content .number {
	display: inline-block;
	padding: 5px 15px;
	margin-bottom: 0.5rem;
	font-weight: 600;
	color: var(--white);
	background-color: var(--primary-color);
	border-radius: 2rem;
}

.plan__content .number:nth-child(4) {
	background-color: #e98b6d;
}

.plan__content .number:nth-child(7) {
	background-color: #ffcca3;
}

.plan__content h4 {
	font-size: 1.2rem;
	font-weight: 600;
	color: var(--text-dark);
	margin-bottom: 0.5rem;
}

.plan__content p {
	color: var(--text-light);
	margin-bottom: 2rem;
}

.plan__image {
	position: relative;
}

.plan__image img {
	position: absolute;
	top: 50%;
	left: 50%;
	border-radius: 10rem;
	box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.2);
}

.plan__image img:nth-child(1) {
	max-width: 250px;
	transform: translate(calc(-50% - 9rem), calc(-50% + 5rem));
	z-index: 3;
}

.plan__image img:nth-child(2) {
	max-width: 260px;
	transform: translate(-50%, calc(-50% - 5rem));
	z-index: 2;
}

.plan__image img:nth-child(3) {
	max-width: 230px;
	transform: translate(calc(-50% + 9rem), calc(-50% + 5rem));
}

.memories {
	background-color: var(--extra-light);
}

.memories__header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 2rem;
}

.memories__header .section__header {
	max-width: 600px;
}

.memories__header .view__all {
	padding: 1rem 2rem;
	font-size: 1rem;
	font-weight: 500;
	color: var(--text-dark);
	background: transparent;
	white-space: nowrap;
	outline: none;
	border: 1px solid var(--text-light);
	border-radius: 2rem;
	box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.1);
	cursor: pointer;
}

.memories__grid {
	margin-top: 4rem;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 5rem;
}

.memories__card {
	padding: 3rem 2rem;
	text-align: center;
	border-radius: 5rem;
	background-color: var(--white);
	box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.05);
}

.memories__card span {
	display: inline-block;
	padding: 20px 32px;
	margin-bottom: 2rem;
	font-size: 3rem;
	color: var(--white);
	background-color: var(--primary-color);
	border-radius: 100%;
}

.memories__card:nth-child(2) span {
	background-color: #e98b6d;
}

.memories__card:nth-child(3) span {
	background-color: #ffcca3;
}

.memories__card h4 {
	margin-bottom: 1rem;
	font-size: 1.2rem;
	font-weight: 600;
	color: var(--text-dark);
}

.memories__card p {
	color: var(--text-light);
	line-height: 1.75rem;
}

.lounge__container {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 2rem;
}

.lounge__grid {
	margin-top: 4rem;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 2rem;
}

.lounge__image {
	position: relative;
}

.lounge__image img {
	position: absolute;
	top: 50%;
	left: 50%;
	border-radius: 20rem;
	box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.2);
}

.lounge__image img:nth-child(1) {
	max-width: 300px;
	transform: translate(calc(-50% - 3rem), -50%);
}

.lounge__image img:nth-child(2) {
	max-width: 200px;
	transform: translate(calc(-50% + 6rem), calc(-50% + 7rem));
}

.lounge__details h4 {
	margin-bottom: 0.5rem;
	font-size: 1.2rem;
	font-weight: 600;
	color: var(--text-dark);
}

.lounge__details p {
	color: var(--text-light);
}

.travellers__grid {
	margin-top: 4rem;
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	gap: 2rem;
}

.travellers__card {
	border-radius: 5rem;
	overflow: hidden;
	box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.2);
}

.travellers__card__content {
	position: relative;
	padding: 1rem;
	text-align: center;
}

.travellers__card__content img {
	position: absolute;
	max-width: 70px;
	top: 0;
	left: 50%;
	transform: translate(-50%, -50%);
	border: 5px solid var(--extra-light);
	border-radius: 100%;
}

.travellers__card__content h4 {
	margin-top: 1.5rem;
	font-size: 1.2rem;
	font-weight: 600;
	color: var(--text-dark);
}

.travellers__card__content p {
	font-weight: 500;
	color: var(--text-light);
}

.subscribe {
	background-color: var(--extra-light);
}

.subscribe__container {
	max-width: 500px;
	text-align: center;
}

.subscribe__form {
	margin-top: 2rem;
	padding: 5px;
	display: flex;
	align-items: center;
	gap: 1rem;
	background-color: var(--white);
	border-radius: 2rem;
}

.subscribe__form input {
	width: 100%;
	padding: 0 1rem;
	outline: none;
	border: none;
	font-size: 1rem;
	color: var(--text-dark);
}

.footer {
	background-color: var(--primary-color);
}

.footer__container {
	display: grid;
	grid-template-columns: 2fr repeat(2, 1fr);
	gap: 5rem;
}

.footer__col h3 {
	font-size: 1.5rem;
	font-weight: 500;
	color: var(--white);
	margin-bottom: 1rem;
}

.footer__col h4 {
	font-size: 1.2rem;
	font-weight: 500;
	color: var(--white);
	margin-bottom: 1rem;
}

.footer__col p {
	color: var(--extra-light);
	margin-bottom: 1rem;
	cursor: pointer;
	transition: 0.3s;
}

.footer__col p:hover {
	color: var(--white);
}

.footer__bar {
	padding: 0.5rem;
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 1rem;
	border-top: 1px solid var(--extra-light);
}

.footer__bar p {
	font-size: 0.9rem;
	color: var(--extra-light);
}

.socials {
	display: flex;
	align-items: center;
	gap: 1rem;
}

.socials span {
	font-size: 1.2rem;
	color: var(--extra-light);
}

@media ( width < 1200px) {
	.section__container.header__container, .section__container.plan__container,
		.section__container.lounge__container {
		overflow: hidden;
	}
	.memories__grid {
		gap: 3rem;
	}
}

@media ( width < 900px) {
	nav .btn {
		display: none;
	}
	.header__container img {
		min-width: 900px;
		margin-left: 50%;
		transform: translateX(-50%);
	}
	.booking__container form {
		grid-template-columns: repeat(2, 1fr);
	}
	.plan__grid {
		grid-template-columns: repeat(1, 1fr);
	}
	.plan__image {
		min-height: 600px;
		grid-area: 1/1/2/2;
	}
	.memories__grid {
		grid-template-columns: repeat(2, 1fr);
		gap: 2rem;
	}
	.lounge__container {
		grid-template-columns: repeat(1, 1fr);
	}
	.lounge__image {
		min-height: 600px;
	}
	.travellers__grid {
		grid-template-columns: repeat(2, 1fr);
	}
	.footer__container {
		gap: 2rem;
	}
}

@media ( width < 600px) {
	.nav__links {
		display: none;
	}
	.booking__nav span {
		padding: 1rem 0.5rem;
	}
	.booking__container form {
		grid-template-columns: repeat(1, 1fr);
	}
	.memories__header {
		flex-direction: column;
	}
	.memories__grid {
		grid-template-columns: repeat(1, 1fr);
	}
	.lounge__grid {
		grid-template-columns: repeat(1, 1fr);
	}
	.travellers__grid {
		grid-template-columns: repeat(1, 1fr);
	}
	.footer__container {
		grid-template-columns: 1fr;
	}
	.footer__bar {
		flex-direction: column;
		text-align: center;
	}
}
</style>
<title>FlightFusion</title>
</head>
<body>
	<nav>
		<div class="nav__logo">FlightFusion</div>
		<ul class="nav__links">
			<li class="link"><a href="#">Home</a></li>
			<li class="link"><a href="#search-home">Search Flights</a></li>
			<li class="link"><a href="myBookings?email=<%=email%>">My
					Bookings</a></li>
			<li class="link"><a href="viewCanceledFlights?email=<%=email%>">Canceled
					Flights</a></li>
			
		</ul>
		<h3 style="color : white">Welcome , <%= username %></h3>
		<button class="btn">
			<a href="logoutServlet" id="logoutBtn">Logout</a>
		</button>

	</nav>
	<header class="section__container header__container">
		<h1 class="section__header">
			Find And Book<br />A Great Experience
		</h1>
		<img src="assets/header.jpg" alt="header" />
	</header>

	<section class="section__container booking__container" id="search-home">
		<form action="cheakFlights" method="post" class="form__group">
			<input type="hidden" name="email" value="<%= email %>">
			<div class="form__group">
				<span><i class="ri-map-pin-line"></i></span>
				<div class="input__content">
					<div class="input__group">
						<input type="text" name="FROM_LOC" required/> <label>From</label>
					</div>
					<p>Departure Point</p>
				</div>
			</div>
			<div class="form__group">
				<span><i class="ri-map-pin-line"></i></span>
				<div class="input__content">
					<div class="input__group">
						<input type="text" name="TO_LOC" required/> <label>To</label>
					</div>
					<p>Arrival Destination</p>
				</div>
			</div>
			<div class="form__group">
				<span><i class="ri-calendar-line"></i></span>
				<div class="input__content">
					<div class="input__group">
						<input type="text" name="departureDate" required/> <label>Departure</label>
					</div>
					<p>Add date</p>
				</div>
			</div>
			<button type="submit" class="btn1">
				<i class="ri-search-line"></i> Search
			</button>
		</form>

	</section>

	<section class="section__container plan__container">
		<p class="subheader">TRAVEL SUPPORT</p>
		<h2 class="section__header">Plan your travel with confidence</h2>
		<p class="description">Find help with your bookings and travel
			plans, and see what to expect along your journey.</p>
		<div class="plan__grid">
			<div class="plan__content">
				<span class="number">01</span>
				<h4>Travel Requirements for Dehradun</h4>
				<p>Stay informed and prepared for your trip to Dehradun with
					essential travel requirements, ensuring a smooth and hassle-free
					experience in this vibrant and captivating city.</p>
				<span class="number">02</span>
				<h4>Multi-risk travel insurance</h4>
				<p>Comprehensive protection for your peace of mind, covering a
					range of potential travel risks and unexpected situations.</p>
				<span class="number">03</span>
				<h4>Travel Requirements by destinations</h4>
				<p>Stay informed and plan your trip with ease, as we provide
					up-to-date information on travel requirements specific to your
					desired destinations.</p>
			</div>
			<div class="plan__image">
				<img src="assets/plan-1.jpg" alt="plan" /> <img
					src="assets/plan-2.jpg" alt="plan" /> <img src="assets/plan-3.jpg"
					alt="plan" />
			</div>
		</div>
	</section>

	<section class="memories">
		<div class="section__container memories__container">
			<div class="memories__header">
				<h2 class="section__header">Travel to make memories all around
					the world</h2>
				<button class="view__all">View All</button>
			</div>
			<div class="memories__grid">
				<div class="memories__card">
					<span><i class="ri-calendar-2-line"></i></span>
					<h4>Book & relax</h4>
					<p>With "Book and Relax," you can sit back, unwind, and enjoy
						the journey while we take care of everything else.</p>
				</div>
				<div class="memories__card">
					<span><i class="ri-shield-check-line"></i></span>
					<h4>Smart Checklist</h4>
					<p>Introducing Smart Checklist with us, the innovative solution
						revolutionizing the way you travel with our airline.</p>
				</div>
				<div class="memories__card">
					<span><i class="ri-bookmark-2-line"></i></span>
					<h4>Save More</h4>
					<p>From discounted ticket prices to exclusive promotions and
						deals, we prioritize affordability without compromising on
						quality.</p>
				</div>
			</div>
		</div>
	</section>

	<section class="section__container lounge__container">
		<div class="lounge__image">
			<img src="assets/lounge-1.jpg" alt="lounge" /> <img
				src="assets/lounge-2.jpg" alt="lounge" />
		</div>
		<div class="lounge__content">
			<h2 class="section__header">Unaccompanied Minor Lounge</h2>
			<div class="lounge__grid">
				<div class="lounge__details">
					<h4>Experience Tranquility</h4>
					<p>Serenity Haven offers a tranquil escape, featuring
						comfortable seating, calming ambiance, and attentive service.</p>
				</div>
				<div class="lounge__details">
					<h4>Elevate Your Experience</h4>
					<p>Designed for discerning travelers, this exclusive lounge
						offers premium amenities, assistance, and private workspaces.</p>
				</div>
				<div class="lounge__details">
					<h4>A Welcoming Space</h4>
					<p>Creating a family-friendly atmosphere, The Family Zone is
						the perfect haven for parents and children.</p>
				</div>
				<div class="lounge__details">
					<h4>A Culinary Delight</h4>
					<p>Immerse yourself in a world of flavors, offering
						international cuisine, gourmet dishes, and carefully curated
						beverages.</p>
				</div>
			</div>
		</div>
	</section>

	<section class="section__container travellers__container">
		<h2 class="section__header">Best travellers of the month</h2>
		<div class="travellers__scrollable">
			<div class="travellers__grid">
				<div class="travellers__card">
					<img src="assets/traveller-1.jpg" alt="traveller" />
					<div class="travellers__card__content">
						<img src="assets/client-2.jpg" alt="client" />
						<h4>Jigar Kanetiya</h4>
						<p>Chennai</p>
					</div>
				</div>
				<div class="travellers__card">
					<img src="assets/traveller-2.jpg" alt="traveller" />
					<div class="travellers__card__content">
						<img src="assets/client-2.jpg" alt="client" />
						<h4>Sohil Saudagar</h4>
						<p>Hydrabad</p>
					</div>
				</div>
				<div class="travellers__card">
					<img src="assets/traveller-3.jpg" alt="traveller" />
					<div class="travellers__card__content">
						<img src="assets/client-3.jpg" alt="client" />
						<h4>Shreya Shah</h4>
						<p>Mumbai</p>
					</div>
				</div>
				<div class="travellers__card">
					<img src="assets/traveller-4.jpg" alt="traveller" />
					<div class="travellers__card__content">
						<img src="assets/client-4.jpg" alt="client" />
						<h4>Jay Bhatelia</h4>
						<p>Delhi</p>
					</div>
				</div>
				<div class="travellers__card">
					<img src="assets/traveller-4.jpg" alt="traveller" />
					<div class="travellers__card__content">
						<img src="assets/client-4.jpg" alt="client" />
						<h4>Sahil Vohra</h4>
						<p>Kolkata</p>
					</div>
				</div>
			</div>
		</div>
	</section>


	<footer class="footer">
		<div class="section__container footer__container">
			<div class="footer__col">
				<h3>FlightFusion</h3>
				<p>Where Excellence Takes Flight. With a strong commitment to
					customer satisfaction and a passion for air travel, Flivan Airlines
					offers exceptional service and seamless journeys.</p>
				<p>From friendly smiles to state-of-the-art aircraft, we connect
					the world, ensuring safe, comfortable, and unforgettable
					experiences.</p>
			</div>
			<div class="footer__col">
				<h4>INFORMATION</h4>
				<p>Home</p>
				<p>About</p>
				<p>Offers</p>
				<p>Seats</p>
				<p>Destinations</p>
			</div>
			<div class="footer__col">
				<h4>CONTACT</h4>
				<p>Support</p>
				<p>Media</p>
				<p>Socials</p>
			</div>
		</div>
		<div class="section__container footer__bar">
			<p>Copyright © 2024 Designed and Developed by Flight Fusion. All
				rights reserved.</p>
			<div class="socials">
				<span><i class="ri-facebook-fill"></i></span> <span><i
					class="ri-twitter-fill"></i></span> <span><i
					class="ri-instagram-line"></i></span> <span><i
					class="ri-youtube-fill"></i></span>
			</div>
		</div>
	</footer>
	<script>
	document.addEventListener('DOMContentLoaded', function() {
	    var userIcon = document.getElementById('userIcon');
	    var userEmail = document.getElementById('userEmail');
	    
	    userIcon.addEventListener('mouseover', function() {
	        userEmail.style.visibility = 'visible';
	        userEmail.style.opacity = 1;
	    });
	    
	    userIcon.addEventListener('mouseout', function() {
	        userEmail.style.visibility = 'hidden';
	        userEmail.style.opacity = 0;
	    });
	});

</script>
</body>
</html>
