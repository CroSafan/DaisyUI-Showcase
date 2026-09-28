package com.example.daisyshowcase.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class IntakeForm {
    @NotBlank(message="Name is required") private String name;
    @NotBlank(message="Email is required") @Email(message="Enter a valid email address") private String email;
    @NotBlank(message="Choose a department") private String department;
    @NotNull(message="Enter a budget") @Min(value=100, message="Budget must be at least 100") private Integer budget;
    @Size(max=500, message="Keep the description under 500 characters") private String description;
    private boolean urgent;
    public String getName() { return name; } public void setName(String name) { this.name=name; }
    public String getEmail() { return email; } public void setEmail(String email) { this.email=email; }
    public String getDepartment() { return department; } public void setDepartment(String department) { this.department=department; }
    public Integer getBudget() { return budget; } public void setBudget(Integer budget) { this.budget=budget; }
    public String getDescription() { return description; } public void setDescription(String description) { this.description=description; }
    public boolean isUrgent() { return urgent; } public void setUrgent(boolean urgent) { this.urgent=urgent; }
}
