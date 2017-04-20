<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="wide wow-animation">
<head>
<title>Invitation Card</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/style.css">
</head>
<body style="">
	<div class="page">
		<main class="page-content">
		<section class="section-30 section-sm-bottom-100">
			<div class="shell">
				<div class="range">
					<div class="cell-md-9 cell-lg-7">
						<h3>Invitation Card</h3>
						<form method="post" action="invite"
							class="rd-mailform form-modern offset-top-30" id="invite">
							<div class="range range-7">
								<div class="cell-xs-5 offset-top-2">
									<div class="form-group">
										<div class="textarea-lined-wrap">
											<textarea id="feedback-message" name="message"
												data-constraints="@Required" class="form-control"></textarea>
											<label for="feedback-message" class="form-label">Message</label>
										</div>
									</div>
								</div>
								<div
									class="cell-xs-5 offset-top-30 offset-xs-top-30 offset-sm-top-50">
									<button type="submit" class="btn btn-primary btn-block" onclick="window.close()">Send</button>
								</div>
								<div
									class="cell-xs-2 offset-top-22 offset-xs-top-30 offset-sm-top-50">
									<button type="reset" class="btn btn-silver-outline btn-block">Reset</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		</main>
	</div>
	<script src="js/core.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>