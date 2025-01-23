import 'package:checkk/students/services/studentregistrationAPI.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'dart:io';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  String? _name, _email, _phone, _password, _confirmPassword, _department, _year, _gender, _address;
  DateTime? _dob;
  bool _isObscured = true;
  File? _profileImage;

  final ImagePicker _picker = ImagePicker();
  final List<String> _yearOptions = ["2022-2025", "2023-2026", "2024-2027"];

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _profileImage = null;
    });
  }

  Future<void> _selectDateOfBirth() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _dob) {
      setState(() {
        _dob = pickedDate;
        dobController.text = pickedDate.toString().substring(0, 10);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_profileImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a profile image')),
        );
        return;
      }

      // Collecting form data
      Map<String, dynamic> data = {
        "Name": nameController.text,
        "emailid": emailController.text,
         "Username": emailController.text,
        "phone": phoneController.text,
        "Password": passwordController.text,
        "Department": departmentController.text,
        "Course": courseController.text,
        "Year": _year,
        "Gender": _gender,
        "Address": addressController.text,
        "DateofBirth": dobController.text,
      };

      // Call the API to submit the form and upload the image
      RegistrationPageApi(data, _profileImage!, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PROFILE',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 31, 91, 195),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                // Profile Image Avatar
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : null,
                      backgroundColor: Colors.grey.shade300,
                      child: _profileImage == null
                          ? const Icon(Icons.person, size: 50, color: Color.fromARGB(255, 59, 58, 58))
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _profileImage == null ? _pickImage : _removeImage,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white,
                          child: Icon(
                            _profileImage == null ? Icons.add : Icons.clear,
                            color: _profileImage == null ? Colors.blue : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Name Field
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value,
                ),
                const SizedBox(height: 20),
                // Course Field
                TextFormField(
                  controller: courseController,
                  decoration: InputDecoration(
                    labelText: 'Course',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.book),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your course';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value,
                ),
                const SizedBox(height: 20),
                // Department Field
                TextFormField(
                  controller: departmentController,
                  decoration: InputDecoration(
                    labelText: 'Department',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.school),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your department';
                    }
                    return null;
                  },
                  onSaved: (value) => _department = value,
                ),
                const SizedBox(height: 20),
                // Year Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Year',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.calendar_today),
                  ),
                  items: _yearOptions.map((year) {
                    return DropdownMenuItem<String>(
                      value: year,
                      child: Text(year),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _year = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select a year' : null,
                ),
                const SizedBox(height: 20),
                // Date of Birth (DOB) Field
                GestureDetector(
                  onTap: _selectDateOfBirth,
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: dobController,
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                        hintText: _dob == null
                            ? 'Select DOB'
                            : '${_dob!.year}/${_dob!.month}/${_dob!.day}',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.calendar_today),
                      ),
                      validator: (value) {
                        if (_dob == null) {
                          return 'Please select your date of birth';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Gender Radio Buttons
                Row(
                  children: [
                    const Text('Gender: '),
                    Expanded(
                      child: Row(
                        children: [
                          Radio<String>(
                            value: 'Male',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                          const Text('Male'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio<String>(
                            value: 'Female',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                          const Text('Female'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Address Field
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.location_on),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (value) => _address = value,
                ),
                const SizedBox(height: 20),
                // Gmail Field
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Gmail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Gmail';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid Gmail address';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                ),
                const SizedBox(height: 20),
                // Phone Field
                IntlPhoneField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    counterText: '',
                  ),
                  initialCountryCode: 'US',
                  onChanged: (phone) {
                    setState(() {
                      _phone = phone.completeNumber;
                    });
                  },
                  showCursor: true,
                  validator: (value) {
                    if (value == null || value.number.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Password Field
                TextFormField(
                  controller: passwordController,
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscured ? Icons.visibility : Icons.visibility_off),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value,
                ),
                const SizedBox(height: 20),
                // Confirm Password Field
                TextFormField(
                  controller: confirmpassController,
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Submit Button
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: const Color.fromARGB(255, 31, 91, 195),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const SizedBox(
                    width: 150,
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
