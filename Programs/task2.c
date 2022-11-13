#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void change_chars(char *str, char *changed_str) {
    int vowels[] = {65, 69, 73, 79, 85, 89, 97, 101, 105, 111, 117, 121};
    int hex_particals[] = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67,
    68, 69, 70};
    int *vowels_index = vowels;
    int *vowels_end = vowels + 12;
    int counter = 0;
    int current_char;
    int current_index = 0;
    while (str[current_index] != '\0') {
        current_char = str[current_index];
        vowels_index = vowels;
        while (vowels_index < vowels_end && *vowels_index != current_char) {
            vowels_index++;
        }
        if (vowels_index == vowels_end) {
            changed_str[counter++] = current_char;
        } else {
            changed_str[counter++] = '0';
            changed_str[counter++] = 'x';
            int hex = current_char % 16;
            changed_str[counter++] = current_char / 16 + 48;
            changed_str[counter++] = hex_particals[hex];
        }
        ++current_index;
    }
    changed_str[counter] = '\0';
    
}

void input(char *str) {
    int counter = 0;
    int current_char;
    do {
        current_char = fgetc(stdin);
        str[counter++] = current_char;
    } while(current_char != -1 && counter < 100000);
    str[counter - 1] = '\0';
}

void output(char *str) {
    int current_index = 0;
    while (str[current_index] != '\0') {
        putchar(str[current_index++]);
    }
    printf("\n");
}

int main() {
    char *str = malloc(100000 * sizeof(char));
    printf("Введите текст:\n");
    input(str);
    char *changed_str = malloc(400000 * sizeof(char));
    change_chars(str, changed_str);
    printf("\n");
    printf("Измененный текст:\n");
    output(changed_str);
    free(changed_str);
    free(str);
    return 0;
}