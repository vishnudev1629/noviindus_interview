class PatientdetailsSet {
	int? id;
	String? male;
	String? female;
	int? patient;
	dynamic treatment;

	PatientdetailsSet({
		this.id, 
		this.male, 
		this.female, 
		this.patient, 
		this.treatment, 
	});

	factory PatientdetailsSet.fromJson(Map<String, dynamic> json) {
		return PatientdetailsSet(
			id: json['id'] as int?,
			male: json['male'] as String?,
			female: json['female'] as String?,
			patient: json['patient'] as int?,
			treatment: json['treatment'] as dynamic,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'male': male,
				'female': female,
				'patient': patient,
				'treatment': treatment,
			};
}
