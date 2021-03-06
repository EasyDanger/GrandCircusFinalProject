<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"
%>
<!DOCTYPE html>
<html>
<head>

<link
	rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
>
<meta charset="UTF-8">
<meta
	name="viewport"
	content="width=device-width, initial-scale=1"
>
<title>GoTo Your Passion</title>
<link
	rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
></script>
<link
	rel="stylesheet"
	href="/style.css"
>

</head>

<style>
.jumbotron {
	background-color: #6C18C4; /* purple */
	color: #DEDEDE; /*gray */
}
</style>

<body>
	<div class="jumbotron text-center">
		<h1 align="left">GoTo</h1>
	</div>
	<p align="center">
		<font
			color="red"
			size="2"
		>${ CityMessage } ${EventMessage }</font>
	</p>
	<form
		name="search"
		action="/"
		method="post"
	>

		<p align="center">
			<font size="3">I want to see</font>
			<input
				name="Search"
				id="input"
				style="text-align: center"
			/>
		</p>
		<p align="center">
			<select name="Country">
				<option value=>Choose a Country</option>
				<c:forEach
					var="item"
					items="${ CountryList }"
				>
					<option value="${ item.code }">${ item.name }</option>
				</c:forEach>
			</select>
		</p>
		<p align="center">
			<font size="3"> in this city</font>
			<input
				name="City"
				class="input"
				style="text-align: center"
				placeholder="(Optional)"
			/>
		</p>
		<p align="center">
			<select name="State">
				<option value=>Choose a State</option>
				<c:forEach
					var="item"
					items="${ StateList }"
				>
					<option value="${ item.code }">${ item.name }</option>
				</c:forEach>
			</select>
		</p>
		<p align="center">
			<button class="btn btn-warning">Submit</button>
		</p>
	</form>

	<c:choose>
		<c:when test="${ not empty Events }">
			<table class="table table-hover">
				<thead>
					<tr bgcolor="#ccffcc">
						<th>
							<font size="4">Event</font>
						</th>
						<th>
							<font size="4">Venue</font>
						</th>
						<th>
							<font size="4">City</font>
						</th>
						<th>
							<font size="4">Date</font>
						</th>
						<th>
							<font size="4">Time</font>
						</th>
						<th>
							<font size="4"></font>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach
						var="item"
						items="${Events}"
						varStatus="loop"
					>
						<tr bgcolor="#FFFAF8">
							<td>${ item.name}</td>
							<td>${ item.venue }</td>
							<td>${ item.city }</td>
							<td>${ item.date }</td>
							<td>${ item.time }</td>
							<td>
								<a href="/howFar/${loop.index }">
									<button class="btn btn-warning">Select Event</button>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<maini class="flex">
			<div class="card">
				<h2>Find your passion.</h2>
			</div>
			<div class="card">
				<h2>Find your place.</h2>
			</div>
			<div class="card">
				<h2>Find your night.</h2>
			</div>
			</maini>
		</c:otherwise>
	</c:choose>
	<br>
	<br>
	<p
		align="center"
		id="disclaim"
	>*GoTo is presently US-only.</p>
</body>
</html>