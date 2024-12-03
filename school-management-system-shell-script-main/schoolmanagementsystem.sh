#!/bin/bash

# Define color variables
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
RESET='\033[0m'

# Background color variables
BG_BLUE='\033[44m'
BG_GREEN='\033[42m'
BG_CYAN='\033[46m'
BG_RESET='\033[49m'

# File paths for storing data
STUDENT_FILE="./student.txt"
TEACHER_FILE="./teacher.txt"
COURSE_FILE="./course.txt"
SEMESTER_FILE="./semester.txt"

# Clear screen with a specific background color
clear_with_color() {
    local bg_color="$1"
    echo -e "${bg_color}${RESET}"  # Set background color
    clear  # Clear screen
    echo -e "\033[2J\033[H"  # Ensure screen is completely reset
}

# Function to create a new student entry
create_student() {
    clear_with_color "$BG_GREEN"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${GREEN}          CREATE NEW STUDENT ENTRY                      ${RESET}"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${CYAN}Enter First Name: ${RESET}"
    read -r fname
    echo -e "${CYAN}Enter Last Name: ${RESET}"
    read -r lname
    echo -e "${CYAN}Enter Registration Number: ${RESET}"
    read -r regno
    echo -e "${CYAN}Enter Class: ${RESET}"
    read -r class
    echo "$fname|$lname|$regno|$class" >> "$STUDENT_FILE"
    echo -e "${GREEN}Student entry added successfully.${RESET}"
    echo -e "${YELLOW}Press Enter to return to the Student Menu.${RESET}"
    read -r
}

# Function to find and display a student entry
find_student() {
    clear_with_color "$BG_GREEN"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${GREEN}          FIND STUDENT ENTRY                             ${RESET}"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${CYAN}Enter Registration Number: ${RESET}"
    read -r regno
    found=0
    while IFS="|" read -r fname lname regno_in_class class; do
        if [[ "$regno" == "$regno_in_class" ]]; then
            echo -e "${CYAN}First Name: ${RESET}$fname"
            echo -e "${CYAN}Last Name: ${RESET}$lname"
            echo -e "${CYAN}Registration Number: ${RESET}$regno_in_class"
            echo -e "${CYAN}Class: ${RESET}$class"
            found=1
            break
        fi
    done < "$STUDENT_FILE"
    if [[ $found -eq 0 ]]; then
        echo -e "${RED}Student with Registration Number $regno not found.${RESET}"
    fi
    echo -e "${YELLOW}Press Enter to return to the Student Menu.${RESET}"
    read -r
}

# Function to show all student records
show_all_students() {
    clear_with_color "$BG_GREEN"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${GREEN}          ALL STUDENT RECORDS                          ${RESET}"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    if [[ -s "$STUDENT_FILE" ]]; then
        while IFS="|" read -r fname lname regno class; do
            echo -e "${CYAN}First Name:${RESET} $fname"
            echo -e "${CYAN}Last Name:${RESET} $lname"
            echo -e "${CYAN}Registration Number:${RESET} $regno"
            echo -e "${CYAN}Class:${RESET} $class"
            echo -e "${GREEN}--------------------------------------------------------${RESET}"
        done <"$STUDENT_FILE"
    else
        echo -e "${RED}No student records found.${RESET}"
    fi
    echo -e "${YELLOW}Press Enter to continue.${RESET}"
    read -r
}

# Function to return to the main menu
return_to_main_menu() {
    clear_with_color "$BG_BLUE"
    echo -e "${CYAN}Returning to the main menu...${RESET}"
    sleep 2
}

# Function to display the main menu
main_menu() {
    while true; do
        clear_with_color "$BG_BLUE"
        echo -e "${CYAN}////////////////////////////////////////////////////////${RESET}"
        echo -e "${GREEN}                 SCHOOL MANAGEMENT SYSTEM               ${RESET}"
        echo -e "${CYAN}////////////////////////////////////////////////////////${RESET}"
        echo -e "${YELLOW}1. Students Information${RESET}"
        echo -e "${YELLOW}2. Teachers Information${RESET}"
        echo -e "${YELLOW}3. Courses Information${RESET}"
        echo -e "${YELLOW}4. Semester Information${RESET}"
        echo -e "${YELLOW}5. Exit${RESET}"
        echo -e "${CYAN}Enter your choice:${RESET}"
        read -r choice

        case $choice in
            1) student_menu ;;
            2) teacher_menu ;;
            3) course_menu ;;
            4) semester_menu ;;
            5) echo -e "${RED}Exiting program.${RESET}"; exit 0 ;;
            *) echo -e "${RED}Invalid choice. Try again.${RESET}"; sleep 1 ;;
        esac
    done
}

# Function for the student management menu
student_menu() {
    while true; do
        clear_with_color "$BG_GREEN"
        echo -e "${BLUE}--------------------------------------------------------${RESET}"
        echo -e "${GREEN}          STUDENTS INFORMATION MANAGEMENT              ${RESET}"
        echo -e "${BLUE}--------------------------------------------------------${RESET}"
        echo -e "${YELLOW}1. Create New Entry${RESET}"
        echo -e "${YELLOW}2. Find and Display Entry${RESET}"
        echo -e "${YELLOW}3. Show All Records${RESET}"
        echo -e "${YELLOW}4. Return to Main Menu${RESET}"
        echo -e "${CYAN}Enter your choice:${RESET}"
        read -r choice

        case $choice in
            1) create_student ;;
            2) find_student ;;
            3) show_all_students ;;
            4) return_to_main_menu; return ;;
            *) echo -e "${RED}Invalid choice. Try again.${RESET}"; sleep 1 ;;
        esac
    done
}

# Function for the teacher management menu
teacher_menu() {
    while true; do
        clear_with_color "$BG_CYAN"
        echo -e "${BLUE}--------------------------------------------------------${RESET}"
        echo -e "${GREEN}          TEACHERS INFORMATION MANAGEMENT              ${RESET}"
        echo -e "${BLUE}--------------------------------------------------------${RESET}"
        echo -e "${YELLOW}1. Create New Entry${RESET}"
        echo -e "${YELLOW}2. Find and Display Entry${RESET}"
        echo -e "${YELLOW}3. Show All Records${RESET}"
        echo -e "${YELLOW}4. Return to Main Menu${RESET}"
        echo -e "${CYAN}Enter your choice:${RESET}"
        read -r choice

        case $choice in
            1) create_teacher ;;
            2) find_teacher ;;
            3) show_all_teachers ;;
            4) return_to_main_menu; return ;;
            *) echo -e "${RED}Invalid choice. Try again.${RESET}"; sleep 1 ;;
        esac
    done
}

# Function to create a new teacher entry
create_teacher() {
    clear_with_color "$BG_CYAN"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${GREEN}          CREATE NEW TEACHER ENTRY                      ${RESET}"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${CYAN}Enter Teacher Name: ${RESET}"
    read -r tname
    echo -e "${CYAN}Enter Teacher ID: ${RESET}"
    read -r tid
    echo -e "${CYAN}Enter Department: ${RESET}"
    read -r department
    echo "$tname|$tid|$department" >> "$TEACHER_FILE"
    echo -e "${GREEN}Teacher entry added successfully.${RESET}"
    echo -e "${YELLOW}Press Enter to return to the Teacher Menu.${RESET}"
    read -r
}

# Function to find and display a teacher entry
find_teacher() {
    clear_with_color "$BG_CYAN"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${GREEN}          FIND TEACHER ENTRY                             ${RESET}"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${CYAN}Enter Teacher ID: ${RESET}"
    read -r tid
    found=0
    while IFS="|" read -r tname tid_in_class department; do
        if [[ "$tid" == "$tid_in_class" ]]; then
            echo -e "${CYAN}Teacher Name: ${RESET}$tname"
            echo -e "${CYAN}Teacher ID: ${RESET}$tid_in_class"
            echo -e "${CYAN}Department: ${RESET}$department"
            found=1
            break
        fi
    done < "$TEACHER_FILE"
    if [[ $found -eq 0 ]]; then
        echo -e "${RED}Teacher with ID $tid not found.${RESET}"
    fi
    echo -e "${YELLOW}Press Enter to return to the Teacher Menu.${RESET}"
    read -r
}

# Function to show all teacher records
show_all_teachers() {
    clear_with_color "$BG_CYAN"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${GREEN}          ALL TEACHER RECORDS                          ${RESET}"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    if [[ -s "$TEACHER_FILE" ]]; then
        while IFS="|" read -r tname tid department; do
            echo -e "${CYAN}Teacher Name:${RESET} $tname"
            echo -e "${CYAN}Teacher ID:${RESET} $tid"
            echo -e "${CYAN}Department:${RESET} $department"
            echo -e "${GREEN}--------------------------------------------------------${RESET}"
        done <"$TEACHER_FILE"
    else
        echo -e "${RED}No teacher records found.${RESET}"
    fi
    echo -e "${YELLOW}Press Enter to continue.${RESET}"
    read -r
}

# Function for the course management menu
course_menu() {
    while true; do
        clear_with_color "$BG_CYAN"
        echo -e "${BLUE}--------------------------------------------------------${RESET}"
        echo -e "${GREEN}          COURSES INFORMATION MANAGEMENT                ${RESET}"
        echo -e "${BLUE}--------------------------------------------------------${RESET}"
        echo -e "${YELLOW}1. Create New Entry${RESET}"
        echo -e "${YELLOW}2. Show All Courses${RESET}"
        echo -e "${YELLOW}3. Return to Main Menu${RESET}"
        echo -e "${CYAN}Enter your choice:${RESET}"
        read -r choice

        case $choice in
            1) create_course ;;
            2) show_all_courses ;;
            3) return_to_main_menu; return ;;
            *) echo -e "${RED}Invalid choice. Try again.${RESET}"; sleep 1 ;;
        esac
    done
}



# Function to create a new course entry
create_course() {
    clear_with_color "$BG_CYAN"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${GREEN}          CREATE NEW COURSE ENTRY                      ${RESET}"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${CYAN}Enter Course Name: ${RESET}"
    read -r cname
    echo -e "${CYAN}Enter Course Code: ${RESET}"
    read -r ccode
    echo "$cname|$ccode" >> "$COURSE_FILE"
    echo -e "${GREEN}Course entry added successfully.${RESET}"
    echo -e "${YELLOW}Press Enter to return to the Course Menu.${RESET}"
    read -r
}

# Function to show all course records
show_all_courses() {
    clear_with_color "$BG_CYAN"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    echo -e "${GREEN}          ALL COURSE RECORDS                          ${RESET}"
    echo -e "${BLUE}--------------------------------------------------------${RESET}"
    if [[ -s "$COURSE_FILE" ]]; then
        while IFS="|" read -r cname ccode; do
            echo -e "${CYAN}Course Name:${RESET} $cname"
            echo -e "${CYAN}Course Code:${RESET} $ccode"
            echo -e "${GREEN}--------------------------------------------------------${RESET}"
        done <"$COURSE_FILE"
    else
        echo -e "${RED}No course records found.${RESET}"
    fi
    echo -e "${YELLOW}Press Enter to continue.${RESET}"
    read -r
}

# Function for the semester management menu
semester_menu() {
    while true; do
        clear_with_color "$BG_GREEN"
        echo -e "${BLUE}--------------------------------------------------------${RESET}"
        echo -e "${GREEN}          SEMESTER INFORMATION MANAGEMENT              ${RESET}"
        echo -e "${BLUE}--------------------------------------------------------${RESET}"
        echo -e "${YELLOW}1. Add New Semester${RESET}"
        echo -e "${YELLOW}2. Find and Display Semester${RESET}"
        echo -e "${YELLOW}3. Return to Main Menu${RESET}"
        echo -e "${CYAN}Enter your choice:${RESET}"
        read -r choice

        case $choice in
            1) create_semester ;;
            2) find_semester ;;
            3) return ;;
            *) echo -e "${RED}Invalid choice. Try again.${RESET}"; sleep 1 ;;
        esac
    done
}

# Function to create a new semester entry
create_semester() {
    while true; do
        echo -e "${CYAN}Enter Semester ID:${RESET}"
        read -r semester_id
        echo -e "${CYAN}Enter Semester Name:${RESET}"
        read -r semester_name
        echo -e "${CYAN}Enter Start Date (YYYY-MM-DD):${RESET}"
        read -r start_date
        echo -e "${CYAN}Enter End Date (YYYY-MM-DD):${RESET}"
        read -r end_date

        # Append to the file
        echo "$semester_id|$semester_name|$start_date|$end_date" >>"$SEMESTER_FILE"
        echo -e "${GREEN}Semester record added successfully.${RESET}"

        echo -e "${YELLOW}Do you want to add another semester? (y/n)${RESET}"
        read -r cont
        if [[ $cont != "y" ]]; then
            break
        fi
    done
}

# Function to find and display a semester entry
find_semester() {
    echo -e "${CYAN}Enter Semester ID to find:${RESET}"
    read -r search_id

    found=0
    while IFS="|" read -r semester_id semester_name start_date end_date; do
        if [[ $semester_id == "$search_id" ]]; then
            echo -e "${GREEN}--------------------------------------------------------${RESET}"
            echo -e "${CYAN}Semester ID:${RESET} $semester_id"
            echo -e "${CYAN}Semester Name:${RESET} $semester_name"
            echo -e "${CYAN}Start Date:${RESET} $start_date"
            echo -e "${CYAN}End Date:${RESET} $end_date"
            echo -e "${GREEN}--------------------------------------------------------${RESET}"
            found=1
        fi
    done <"$SEMESTER_FILE"

    if [[ $found -eq 0 ]]; then
        echo -e "${RED}No semester found with ID: $search_id${RESET}"
    fi

    echo -e "${YELLOW}Press Enter to continue.${RESET}"
    read -r
}

# Main program execution
main_menu

