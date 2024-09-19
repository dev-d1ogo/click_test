class ApiResponse {
  final String response;

  ApiResponse({required this.response});

  // Factory method to create an ApiResponse from JSON
  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      response: json['response'],
    );
  }

  // Method to convert an ApiResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'response': response,
    };
  }
}
