@extends('layouts.frontend')

@section('content')

<div class="w-full max-w-xs mx-auto">
	<form method="POST" action="{{ route('login') }}" class="bg-white shadow rounded px-8 pt-6 pb-8 mb-4">
		@csrf
		<div class="mb-4">
			<label class="block text-gray-700 text-sm font-bold mb-2" for="emailaddress">
				Email Address
			</label>
			<input class="shadow appearance-none border @error('password') border-red-500 @enderror rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" type="email" name="email" id="emailaddress" placeholder="email@example.com">
			@error('email')
				<p class="text-red-500 text-xs italic">{{ $message }}</p>
			@enderror
		</div>
		<div class="mb-4">
			<label class="block text-gray-700 text-sm font-bold mb-2" for="password">
				Password
			</label>
			<input class="shadow appearance-none border @error('password') border-red-500 @enderror rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" type="password" name="password" id="password" placeholder="******************">
			@error('password')
				<p class="text-red-500 text-xs italic">{{ $message }}</p>
			@enderror
		</div>
		<div class="mb-4">
			<div class="alert alert-danger" id="error" style="display: none;"></div>
			<label class="block text-gray-700 text-sm font-bold mb-2" for="password">
				Phone number
			</label>
			<div class="alert alert-success" id="successAuth" style="display: none;"></div>
			<form>
				<input type="text" id="number" class="form-control" value="+63" placeholder="+63XXXXXXXXXX">
				<div id="recaptcha-container"></div>
				<button type="button" class="btn btn-primary mt-3" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" onclick="sendOTP();">Send OTP</button>
			</form>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<div class="collapse" id="collapseExample">
		<div class="mb-4">
					<label class="block text-gray-700 text-sm font-bold mb-2" for="password">
						Verification Code
					</label>
					<div class="alert alert-success" id="successOtpAuth" style="display: none;"></div>
					<form>
						<input type="text" id="verification" class="form-control" placeholder="Verification code">
						<button type="button" class="btn btn-danger mt-3" onclick="verify()">Verify code</button>
					</form>
				</div>
		</div>
		<div class="mb-6">
			<label class="block text-gray-500 font-bold">
				<input class="mr-2 leading-tight" type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>
				<span class="text-sm">
					Remember Me
				</span>
			</label>
		</div>
		<div class="flex items-center justify-between">
			<button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
				Sign In
			</button>
		</div>
	</form>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/6.0.2/firebase.js"></script>

<script>
	var firebaseConfig = {
		apiKey: "AIzaSyBvFof9uox5Z1ovf3lYc8STR_QlABUt4SQ",
		authDomain: "nutime-9448f.firebaseapp.com",
		databaseURL: "https://nutime-9448f.firebaseio.com",
		projectId: "nutime-9448f.appspot.com",
		storageBucket: "nutime-9448f.appspot.com",
		messagingSenderId: "727734096086",
		appId: "1:727734096086:web:e9170d5609c01c067fb977"
	};
	firebase.initializeApp(firebaseConfig);
</script>
<script type="text/javascript">
	window.onload = function () {
		render();
	};
	function render() {
		window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container');
		recaptchaVerifier.render();
	}
	function sendOTP() {
		var number = $("#number").val();
		firebase.auth().signInWithPhoneNumber(number, window.recaptchaVerifier).then(function (confirmationResult) {
			window.confirmationResult = confirmationResult;
			coderesult = confirmationResult;
			console.log(coderesult);
			$("#successAuth").text("Message sent");
			$("#successAuth").show();
		}).catch(function (error) {
			$("#error").text(error.message);
			$("#error").show();
		});
	}
	function verify() {
		var code = $("#verification").val();
		coderesult.confirm(code).then(function (result) {
			var user = result.user;
			console.log(user);
			$("#successOtpAuth").text("Auth is successful");
			$("#successOtpAuth").show();
		}).catch(function (error) {
			$("#error").text(error.message);
			$("#error").show();
		});
	}
</script>

@endsection