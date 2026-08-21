# WAP to print days of a week (1 = sunday, 2 = Monday, 3 = Tuesday, 4 = Wednesday, 5 = Thursday, 6 = Friday, 7 = Saturday) use dictionary to store days of a week and print the day based on user input.

def main():
    days = {
        1: "Sunday",
        2: "Monday",
        3: "Tuesday",
        4: "Wednesday",
        5: "Thursday",
        6: "Friday",
        7: "Saturday"
    }

    day_number = int(input("Enter a number (1-7) to get the corresponding day of the week: "))
    
    if day_number in days:
        print(f"The day corresponding to {day_number} is {days[day_number]}.")
    else:
        print("Invalid input. Please enter a number between 1 and 7.")