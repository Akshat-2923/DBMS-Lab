# WAP to calculate the given year is leap year or not using function and return the result to main function and print the result in main function.

def is_leap_year(year):
    if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
        return True
    else:
        return False
    
def main():
    year = int(input("Enter a year to check if it is a leap year: "))
    if is_leap_year(year):
        print(f"{year} is a leap year.")
    else:
        print(f"{year} is not a leap year.")