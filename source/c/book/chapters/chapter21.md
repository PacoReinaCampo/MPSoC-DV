# Examples: Data Structures

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Array

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* HEADER

```c
/*
 * CArray.h
 *
 * Author: Leonardo Vencovsky
 * Created on 18/03/2018
 *
 * Modified by: Leonardo Vencovsky
 * Last modified: 19/03/2018
 *
 * Header for Array in C
 *
 * Compiled in Visual Studio 2017
 *
 */

#pragma once

#ifdef __cplusplus
extern "C"
{
#endif

#define ARRAY_ERASED -1
#define SUCCESS 0
#define INVALID_POSITION 1
#define POSITION_INIT 2
#define POSITION_NOT_INIT 3
#define POSITION_EMPTY 4
#define ARRAY_FULL 5

    typedef struct CArray
    {
        int *array;
        int size;
    } CArray;

    // +-------------------------------------+
    // |           Returns array             |
    // +-------------------------------------+
    CArray *getCArray(int size);
    CArray *getCopyCArray(CArray *array);

    // +-------------------------------------+
    // |           Input / Output            |
    // +-------------------------------------+
    int insertValueCArray(CArray *array, int position, int value);
    int removeValueCArray(CArray *array, int position);
    int pushValueCArray(CArray *array, int value);
    int updateValueCArray(CArray *array, int position, int value);

    // +-------------------------------------+
    // |               Erase                 |
    // +-------------------------------------+
    int eraseCArray(CArray *array);

    // +-------------------------------------+
    // |             Switching               |
    // +-------------------------------------+
    int switchValuesCArray(CArray *array, int position1, int position2);
    int reverseCArray(CArray *array);

    // +-------------------------------------+
    // |              Sorting                |
    // +-------------------------------------+
    int bubbleSortCArray(CArray *array);
    int selectionSortCArray(CArray *array);
    int insertionSortCArray(CArray *array);
    int blenderCArray(CArray *array);

    // +-------------------------------------+
    // |             Searching               |
    // +-------------------------------------+
    int valueOcurranceCArray(CArray *array, int value);
    CArray *valuePositionsCArray(CArray *array, int value);
    int findMaxCArray(CArray *array);
    int findMinCArray(CArray *array);

    // +-------------------------------------+
    // |              Display                |
    // +-------------------------------------+
    int displayCArray(CArray *array);

#ifdef __cplusplus
}
#endif
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* DESIGN

```c
/*
 * CArray.c
 *
 * Author: Leonardo Vencovsky
 * Created on 19/03/2018
 *
 * Modified by: Leonardo Vencovsky
 * Last modified: 19/03/2018
 *
 * Array Implementations in C
 *
 * Compiled in Visual Studio 2017
 *
 */

/*
Return Codes

-1 - Array Erased
0 - Success
1 - Invalid Position
2 - Position already initialized (use update function)
3 - Position not initialized (use insert function)
4 - Position already empty
5 - Array is full

*/

#include "carray.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void swap(CArray *array, int position1, int position2);

CArray *getCArray(int size)
{
    CArray *array = (CArray *)malloc(sizeof(CArray));
    array->array = (int *)malloc(sizeof(int) * size);
    array->size = size;
    int i;
    for (i = 0; i < size; i++)
    {
        array->array[i] = 0;
    }
    return array;
}

int insertValueCArray(CArray *array, int position, int value)
{
    if (position >= 0 && position < array->size)
    {
        if (array->array[position] == 0)
        {
            array->array[position] = value;
            return SUCCESS;
        }
        else
            return POSITION_INIT;
    }
    return INVALID_POSITION;
}

int removeValueCArray(CArray *array, int position)
{
    if (position >= 0 && position < array->size)
    {
        if (array->array[position] != 0)
        {
            array->array[position] = 0;
        }
        else
            return POSITION_EMPTY;
    }
    return INVALID_POSITION;
}

int pushValueCArray(CArray *array, int value)
{
    int i;
    int ok = 0;
    for (i = 0; i < array->size; i++)
    {
        if (array->array[i] == 0)
        {
            array->array[i] = value;
            ok = 1;
            break;
        }
    }
    if (ok == 1)
        return SUCCESS;
    else
        return ARRAY_FULL;
}

int updateValueCArray(CArray *array, int position, int value)
{
    if (position >= 0 && position < array->size)
    {
        if (array->array[position] != 0)
        {
            array->array[position] = value;
            return SUCCESS;
        }

        else
            return POSITION_NOT_INIT;
    }
    return INVALID_POSITION;
}

int eraseCArray(CArray *array)
{
    int i;
    for (i = 0; i < array->size; i++)
    {
        array->array[i] = 0;
    }
    return 0;
}

int switchValuesCArray(CArray *array, int position1, int position2)
{
    if (position1 >= 0 && position1 < array->size && position2 >= 0 &&
        position2 < array->size)
    {
        int temp = array->array[position1];
        array->array[position1] = array->array[position2];
        array->array[position2] = temp;
        return SUCCESS;
    }
    return INVALID_POSITION;
}

int reverseCArray(CArray *array)
{
    int i;
    for (i = 0; i < array->size / 2; i++)
    {
        swap(array, i, array->size - i - 1);
    }
    return SUCCESS;
}

int displayCArray(CArray *array)
{
    int i;
    printf("\nC ARRAY\n");
    for (i = 0; i < array->size; i++)
    {
        printf("%d ", array->array[i]);
    }
    printf("\n");
    return 0;
}

int blenderCArray(CArray *array)
{
    srand(time(NULL) * array->size);
    int i;
    int total = array->size * 100;
    for (i = 0; i < total; i++)
    {
        swap(array, rand() % array->size, rand() % array->size);
    }
    return 0;
}

CArray *getCopyCArray(CArray *arr)
{
    CArray *array = (CArray *)malloc(sizeof(CArray));
    array->array = (int *)malloc(sizeof(int) * arr->size);
    array->size = arr->size;
    int i;
    for (i = 0; i < arr->size; i++)
    {
        array->array[i] = arr->array[i];
    }
    return array;
}

void swap(CArray *array, int position1, int position2)
{
    int temp = array->array[position1];
    array->array[position1] = array->array[position2];
    array->array[position2] = temp;
}

int bubbleSortCArray(CArray *array)
{
    int i, j;
    for (i = 0; i < array->size - 1; i++)
    {
        for (j = 0; j < array->size - i - 1; j++)
        {
            if (array->array[j] > array->array[j + 1])
            {
                swap(array, j, j + 1);
            }
        }
    }
    return 0;
}

int selectionSortCArray(CArray *array)
{
    int i, j, min;
    for (i = 0; i < array->size - 1; i++)
    {
        min = i;
        for (j = i + 1; j < array->size; j++)
            if (array->array[j] < array->array[min])
                min = j;
        swap(array, min, i);
    }
    return 0;
}

int insertionSortCArray(CArray *array)
{
    int i, j, num;
    for (i = 1; i < array->size; i++)
    {
        num = array->array[i];
        j = i - 1;
        while (j >= 0 && array->array[j] > num)
        {
            array->array[j + 1] = array->array[j];
            j--;
        }
        array->array[j + 1] = num;
    }
    return 0;
}

int valueOcurranceCArray(CArray *array, int value)
{
    int i, total = 0;
    for (i = 0; i < array->size; i++)
    {
        if (array->array[i] == value)
            total++;
    }
    return total;
}

CArray *valuePositionsCArray(CArray *array, int value)
{
    int i, j = 0;
    int total = valueOcurranceCArray(array, value);
    CArray *resultArray = getCArray(total);
    for (i = 0; i < array->size; i++)
    {
        if (array->array[i] == value)
        {
            // Hopefully this won't overflow
            resultArray->array[j] = i;
            j++;
        }
    }
    return resultArray;
}

int findMinCArray(CArray *array)
{
    int i;
    int min = array->array[0];
    for (i = 1; i < array->size; i++)
    {
        if (array->array[i] < min)
        {
            min = array->array[i];
        }
    }
    return min;
}

int findMaxCArray(CArray *array)
{
    int i;
    int max = array->array[0];
    for (i = 1; i < array->size; i++)
    {
        if (array->array[i] > max)
        {
            max = array->array[i];
        }
    }
    return max;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* VERIFICATION

```c
/*
 * CArrayTests.c
 *
 * Author: Leonardo Vencovsky
 * Created on 19/03/2018
 *
 * Modified by: Leonardo Vencovsky
 * Last modified: 19/03/2018
 *
 * Test Cases for Array Implementations in C
 *
 * Compiled in Visual Studio 2017
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "carray.h"

int CArrayTests()
{
    printf("\n");
    printf(" +-------------------------------------+\n");
    printf(" |                                     |\n");
    printf(" |               C Array               |\n");
    printf(" |                                     |\n");
    printf(" +-------------------------------------+\n");
    printf("\n");

    CArray *array = getCArray(10);

    int i;
    for (i = 0; i < array->size; i++)
    {
        insertValueCArray(array, i, i + 1);
    }
    printf("Entered array is:\n");
    displayCArray(array);
    printf("\nCode: %d\n", pushValueCArray(array, 11));  // 5

    for (i = 0; i < array->size; i++)
    {
        removeValueCArray(array, i);
    }

    displayCArray(array);

    printf("\nCode: %d", removeValueCArray(array, -1));       // 1
    printf("\nCode: %d\n", insertValueCArray(array, -1, 1));  // 1

    // Erase
    for (i = 0; i < array->size; i++)
    {
        insertValueCArray(array, i, i + 1);
    }
    eraseCArray(array);
    displayCArray(array);  // Should give all 0s

    // Switching
    CArray *arr = getCArray(13);
    for (i = 0; i < arr->size; i++)
    {
        insertValueCArray(arr, i, i + 1);
    }
    displayCArray(arr);
    for (i = 0; i < arr->size / 2; i++)
    {
        switchValuesCArray(arr, i, arr->size - i - 1);
    }

    displayCArray(arr);

    // Or simply...
    reverseCArray(arr);

    displayCArray(arr);

    // Sorting
    srand(time(NULL));
    CArray *barray = getCArray(20);
    for (i = 0; i < barray->size; i++)
    {
        insertValueCArray(barray, i, rand());
    }
    CArray *carray = getCopyCArray(barray);
    CArray *darray = getCopyCArray(barray);
    printf("\nNot sorted Array:");
    displayCArray(barray);

    printf("\nBubble Sort:");
    clock_t begin1 = clock();
    // Timing bubble sort
    bubbleSortCArray(barray);
    clock_t end1 = clock();
    double time_spent1 = (double)(end1 - begin1) / CLOCKS_PER_SEC;
    displayCArray(barray);

    printf("\nSelection Sort:");
    clock_t begin2 = clock();
    // Timing selection sort
    selectionSortCArray(carray);
    clock_t end2 = clock();
    double time_spent2 = (double)(end2 - begin2) / CLOCKS_PER_SEC;
    displayCArray(carray);

    printf("\nInsertion Sort:");
    clock_t begin3 = clock();
    // Timing insertion sort
    insertionSortCArray(darray);
    clock_t end3 = clock();
    double time_spent3 = (double)(end3 - begin3) / CLOCKS_PER_SEC;
    displayCArray(carray);

    // Descending order
    reverseCArray(barray);
    // displayCArray(barray);

    //	printf("\nBlender:");
    //	blenderCArray(barray);
    //	displayCArray(barray);

    printf("\nTotal time spent for bubble sort: %lf seconds", time_spent1);
    printf("\nTotal time spent for selection sort: %lf seconds", time_spent2);
    printf("\nTotal time spent for insertion sort: %lf seconds", time_spent3);

    // Searching
    CArray *aarray = getCArray(1000);
    for (i = 0; i < aarray->size; i++)
    {
        insertValueCArray(aarray, i, rand() % 100);
    }

    int j = 24;
    printf("\nOccurrences of the number %d in the array: %d", j,
           valueOcurranceCArray(aarray, j));
    printf("\nAnd its positions:\n");
    CArray *positions = valuePositionsCArray(aarray, j);
    displayCArray(positions);
    // This should all give value of j
    printf("\nAll %d s", j);
    for (i = 0; i < positions->size; i++)
    {
        printf("\nPosition %d has a value of %d", positions->array[i],
               aarray->array[positions->array[i]]);
    }
    printf("\nThe list has a minimum value of %d and a maximum value of %d",
           findMinCArray(aarray), findMaxCArray(aarray));
    insertionSortCArray(aarray);
    // displayCArray(aarray);

    free(arr);
    free(array);
    free(aarray);
    free(barray);
    free(carray);
    free(darray);
    printf("\n");
    return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Binary Trees

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* HEADER

```c

```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* DESIGN

```c

```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* VERIFICATION

```c

```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Dictionary

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* HEADER

```c
/*
    author: Christian Bender
    public interface for the dictionary.

    The dictionary prepares space for 1000 elements.
*/

#ifndef __DICT__H
#define __DICT__H

#define MAXELEMENTS 1000

/*
    special data type called 'Dictionary'
    for generic use
*/
typedef struct Dict
{
    /*
        void* array for generic use of the dictionary.
        there actual saves the entries.
    */
    void *elements[MAXELEMENTS];

    /* contains the number of elements in this dictionary */
    int number_of_elements;

} Dictionary;

/*
    create_dict: is a simple constructor for creating
                a dictionary and setting up the
                member field 'number_of_elements'
                and prepares the inner array 'elements'
*/
Dictionary *create_dict(void);

/*
    add_item_label: adds item (void*) to the dictionary at given label
    returns 0 if adding was sucessful otherwise -1
*/
int add_item_label(Dictionary *, char label[], void *);

/*
    add_item_index: adds item (void*) to the dictionary at given index (int)
    returns 0 if adding was sucessful otherwise -1
*/
int add_item_index(Dictionary *, int index, void *);

/*
    get_element: returns the element at given label
*/
void *get_element_label(Dictionary *, char[]);

/*
    get_element: returns the element at given index
*/
void *get_element_index(Dictionary *, int);

/*
    simple destrcutor function
*/
void destroy(Dictionary *);

#endif
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* DESIGN

```c
#include "dict.h"
#include <stdio.h>
#include <stdlib.h>

/* simple constructor */
Dictionary *create_dict(void)
{
    Dictionary *p_dic = malloc(sizeof(Dictionary));
    if (p_dic)
    {
        p_dic->number_of_elements = 0;

        /* initializes the elemens of the array with NULL-pointer */
        for (int i = 0; i < MAXELEMENTS; i++)
        {
            p_dic->elements[i] = NULL;
        }

        return p_dic;
    }
    else
    {
        printf("unable to create a dictionary\n");
        return NULL;
    }
}

/*
    utility function
    sdbm hash algorithm
    returns a hashcode for the given string 's'
*/
int get_hash(char s[])
{
    unsigned int hash_code = 0;

    /* iterates over string at each character */
    for (int counter = 0; s[counter] != '\0'; counter++)
    {
        /* actual computing of the hash code */
        hash_code =
            s[counter] + (hash_code << 6) + (hash_code << 16) - hash_code;
    }

    /* % modulo is for fitting the index in array. */
    return hash_code % MAXELEMENTS;
}

int add_item_label(Dictionary *dic, char label[], void *item)
{
    unsigned int index = get_hash(label);

    /* make sure index is fitting */
    if (index < MAXELEMENTS)
    {
        dic->elements[index] = item;
        return 0;
    }

    /* error case */
    return -1;
}

int add_item_index(Dictionary *dic, int index, void *item)
{
    /* make sure whether this place is already given */
    if (!dic->elements[index])
    {
        dic->elements[index] = item;
        return 0;
    }

    /* error case */
    return -1;
}

void *get_element_label(Dictionary *dict, char s[])
{
    int index = get_hash(s);
    if (dict->elements[index])
    {
        return dict->elements[index];
    }

    printf("None entry at given label\n");
    return NULL;
}

void *get_element_index(Dictionary *dict, int index)
{
    if (index >= 0 && index < MAXELEMENTS)
    {
        return dict->elements[index];
    }

    printf("index out of bounds!\n");
    return NULL;
}

void destroy(Dictionary *dict) { free(dict); }
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* VERIFICATION

```c
/*
    author: Christian Bender
    This is a simple test program for the dictionary.
*/

#include <stdio.h>

/* includes the dictionary */
#include "dict.h"

int main(void)
{
    Dictionary *testObj1;
    Dictionary *testObj2;

    int value = 28;

    testObj1 = create_dict();
    testObj2 = create_dict();

    add_item_label(testObj1, "age", &value);
    add_item_label(testObj2, "name", "Christian");

    /*
        test for function add_item_label

        attention:
        The void* pointer must be convert into an int* pointer.
        After that you can dereference it.
    */
    printf("My age is %d\n", *((int *)get_element_label(testObj1, "age")));
    printf("My name is %s\n", get_element_label(testObj2, "name"));

    /* test for function add_item_index */
    if (!add_item_index(testObj1, 0, &value))
    {
        printf("My age at index %d is %d\n", 0,
               *((int *)get_element_index(testObj1, 0)));
    }

    /* error scenario */
    /* get_element_label(testObj,"none"); */

    /* tidy up */
    destroy(testObj1);
    destroy(testObj2);

    return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Dynamic Array

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* HEADER

```c
#ifndef __DYNAMIC_ARRAY__
#define __DYNAMIC_ARRAY__
#define DEFAULT_CAPACITY 1 << 4
#define INDEX_OUT_OF_BOUNDS NULL

typedef struct dynamic_array
{
    void **items;
    unsigned size;
    unsigned capacity;
} dynamic_array_t;

extern dynamic_array_t *init_dynamic_array();

extern void *add(dynamic_array_t *da, const void *value);

extern void *put(dynamic_array_t *da, const void *value, unsigned index);

extern void *get(dynamic_array_t *da, const unsigned index);

extern void delete (dynamic_array_t *da, const unsigned index);

unsigned contains(const unsigned size, const unsigned index);

extern void *retrive_copy_of_value(const void *value);

#endif
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* DESIGN

```c
#include "dynamic_array.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

dynamic_array_t *init_dynamic_array()
{
    dynamic_array_t *da = malloc(sizeof(dynamic_array_t));
    da->items = calloc(DEFAULT_CAPACITY, sizeof(void *));
    da->capacity = DEFAULT_CAPACITY;

    return da;
}

void *add(dynamic_array_t *da, const void *value)
{
    if (da->size >= da->capacity)
    {
        void **newItems =
            realloc(da->items, (da->capacity <<= 1) * sizeof(void **));
        free(da->items);

        da->items = newItems;
    }

    void *copy_value = retrive_copy_of_value(value);
    da->items[da->size++] = copy_value;

    return copy_value;
}

void *put(dynamic_array_t *da, const void *value, const unsigned index)
{
    if (!contains(da->size, index))
        return INDEX_OUT_OF_BOUNDS;

    free(da->items[index]);
    void *copy_value = retrive_copy_of_value(value);
    da->items[index] = copy_value;

    return copy_value;
}

void *get(dynamic_array_t *da, const unsigned index)
{
    if (!contains(da->size, index))
        return INDEX_OUT_OF_BOUNDS;

    return da->items[index];
}

void delete (dynamic_array_t *da, const unsigned index)
{
    if (!contains(da->size, index))
        return;

    for (unsigned i = index; i < da->size; i++)
    {
        da->items[i] = da->items[i + 1];
    }

    da->size--;

    free(da->items[da->size]);
}

unsigned contains(const unsigned size, const unsigned index)
{
    if (size >= 0 && index < size)
        return 1;

    printf("index [%d] out of bounds!\n", index);
    return 0;
}

void *retrive_copy_of_value(const void *value)
{
    void *value_copy = malloc(sizeof(void *));
    memcpy(value_copy, value, sizeof(void *));

    return value_copy;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* VERIFICATION

```c
#include <stdio.h>
#include <stdlib.h>
#include "dynamic_array.h"

int main()
{
    dynamic_array_t *da = init_dynamic_array();

    for (int i = 1; i <= 50; i++)
    {
        add(da, &i);
    }

    delete (da, 10);

    int value = 1000;

    put(da, &value, 0);

    value = 5000;

    int another_value = 7000;

    add(da, &another_value);

    for (int i = 0; i < da->size; i++)
    {
        printf("value %d\n", *(int *)get(da, i));
    }

    int value_for_invalid_index = 10000;

    put(da, &value_for_invalid_index, 150);
    return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Graphs

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* HEADER

```c

```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* DESIGN

```c

```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* VERIFICATION

```c

```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Hash Set

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* HEADER

```c
#ifndef __HASH_SET__
#define __HASH_SET__

#define DEFAULT_HASH_SET_CAPACITY 1 << 10

typedef struct
{
    unsigned capacity;
    unsigned length;
    void **values;
    void **keys;
} hash_set_t;

extern hash_set_t *init_hash_set();

extern unsigned add(hash_set_t *set, void *value);

unsigned put(hash_set_t *set, long long hash, void *value);

extern int contains(hash_set_t *set, void *value);

int contains_hash(hash_set_t *set, long long hash);

extern void delete (hash_set_t *set, void *value);

extern long long hash(void *value);

extern unsigned retrieve_index_from_hash(const long long hash,
                                         const unsigned capacity);

extern void resize(hash_set_t *set);

#endif
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* DESIGN

```c
#include <stdio.h>
#include <stdlib.h>

#include "hash_set.h"

extern hash_set_t *init_hash_set()
{
    hash_set_t *set = (hash_set_t *)malloc(sizeof(hash_set_t));
    set->keys = calloc(DEFAULT_HASH_SET_CAPACITY, sizeof(void **));
    set->values = calloc(DEFAULT_HASH_SET_CAPACITY, sizeof(void **));
    set->length = 0;
    set->capacity = DEFAULT_HASH_SET_CAPACITY;

    return set;
}

unsigned add(hash_set_t *set, void *value)
{
    return put(set, hash(value), value);
}

unsigned put(hash_set_t *set, long long hash, void *value)
{
    if (contains_hash(set, hash))
    {
        if (set->keys[retrieve_index_from_hash(hash, set->capacity)] == value)
        {
            return 0;
        }

        // collision
        resize(set);

        return put(set, hash, value);
    }

    set->keys[retrieve_index_from_hash(hash, set->capacity)] = value;
    set->values[set->length++] = value;

    return 1;
}

int contains(hash_set_t *set, void *value)
{
    return set->keys[retrieve_index_from_hash(hash(value), set->capacity)] ==
                   value
               ? 1
               : 0;
}

int contains_hash(hash_set_t *set, long long hash)
{
    return set->keys[retrieve_index_from_hash(hash, set->capacity)] ? 1 : 0;
}

void delete (hash_set_t *set, void *value)
{
    set->keys[retrieve_index_from_hash(hash(value), set->capacity)] = NULL;
}

// adler_32 hash
long long hash(void *value)
{
    char *str = value;

    int a = 1;
    int b = 0;
    const int MODADLER = 65521;

    for (int i = 0; str[i] != '\0'; i++)
    {
        a = (a + str[i]) % MODADLER;
        b = (b + a) % MODADLER;
    }

    return (b << 16) | a;
}

unsigned retrieve_index_from_hash(const long long hash, const unsigned capacity)
{
    return (capacity - 1) & (hash ^ (hash >> 12));
}

void resize(hash_set_t *set)
{
    void **keys_resized = calloc((set->capacity <<= 1), sizeof(void **));

    for (int i = 0; i < set->length; i++)
    {
        keys_resized[retrieve_index_from_hash(hash(set->values[i]),
                                              set->capacity)] = set->values[i];
    }

    free(set->keys);

    set->keys = keys_resized;

    void **new_values =
        (void **)realloc(set->values, set->capacity * sizeof(void **));
    set->values = new_values;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* VERIFICATION

```c
#include <stdio.h>

#include "hash_set.h"

int main()
{
    hash_set_t *set = init_hash_set();

    int v1 = 10, v2 = 20, v3 = 30, v4 = 40, v5 = 50, v6 = 60, v7 = 70;

    printf("Value %d was add ? %d\n", v1, add(set, &v1));
    printf("Value %d was add ? %d\n", v1, add(set, &v1));
    printf("contains %d ? %d\n", v1, contains(set, &v1));

    printf("Value %d was add ? %d\n", v2, add(set, &v2));
    printf("Value %d was add ? %d\n", v2, add(set, &v2));
    printf("contains %d ? %d\n", v2, contains(set, &v2));

    printf("Value %d was add ? %d\n", v3, add(set, &v3));
    printf("Value %d is add ? %d\n", v3, add(set, &v3));
    printf("contains %d ? %d\n", v3, contains(set, &v3));

    printf("Value %d was add ? %d\n", v4, add(set, &v4));
    printf("Value %d was add ? %d\n", v4, add(set, &v4));
    printf("contains %d ? %d\n", v4, contains(set, &v4));

    printf("Value %d was add ? %d\n", v5, add(set, &v5));
    printf("Value %d was add ? %d\n", v5, add(set, &v5));
    printf("contains %d ? %d\n", v5, contains(set, &v5));

    printf("Value %d is add ? %d\n", v6, add(set, &v6));
    printf("Value %d is add ? %d\n", v6, add(set, &v6));
    printf("contains %d ? %d\n", v6, contains(set, &v6));

    printf("contains %d ? %d\n", v7, contains(set, &v7));

    delete (set, &v6);

    printf("contains %d ? %d\n", v6, contains(set, &v6));

    return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Heap

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....


```c
#include <stdio.h>
#include <stdlib.h>

typedef struct min_heap
{
    int *p;
    int size;
    int count;
} Heap;

Heap *create_heap(Heap *heap); /*Creates a min_heap structure and returns a
                                  pointer to the struct*/
void down_heapify(Heap *heap, int index); /*Pushes an element downwards in the
                                             heap to find its correct position*/
void up_heapify(Heap *heap, int index); /*Pushes an element upwards in the heap
                                           to find its correct position*/
void push(Heap *heap, int x);           /*Inserts an element in the heap*/
void pop(Heap *heap); /*Removes the top element from the heap*/
int top(Heap *heap); /*Returns the top element of the heap or returns INT_MIN if
                        heap is empty*/
int empty(Heap *heap); /*Checks if heap is empty*/
int size(Heap *heap);  /*Returns the size of heap*/

int main()
{
    Heap *head = create_heap(head);
    push(head, 10);
    printf("Pushing element : 10\n");
    push(head, 3);
    printf("Pushing element : 3\n");
    push(head, 2);
    printf("Pushing element : 2\n");
    push(head, 8);
    printf("Pushing element : 8\n");
    printf("Top element = %d \n", top(head));
    push(head, 1);
    printf("Pushing element : 1\n");
    push(head, 7);
    printf("Pushing element : 7\n");
    printf("Top element = %d \n", top(head));
    pop(head);
    printf("Popping an element.\n");
    printf("Top element = %d \n", top(head));
    pop(head);
    printf("Popping an element.\n");
    printf("Top element = %d \n", top(head));
    printf("\n");
    return 0;
}
Heap *create_heap(Heap *heap)
{
    heap = (Heap *)malloc(sizeof(Heap));
    heap->size = 1;
    heap->p = (int *)malloc(heap->size * sizeof(int));
    heap->count = 0;
    return heap;
}

void down_heapify(Heap *heap, int index)
{
    if (index >= heap->count)
        return;
    int left = index * 2 + 1;
    int right = index * 2 + 2;
    int leftflag = 0, rightflag = 0;

    int minimum = *((heap->p) + index);
    if (left < heap->count && minimum > *((heap->p) + left))
    {
        minimum = *((heap->p) + left);
        leftflag = 1;
    }
    if (right < heap->count && minimum > *((heap->p) + right))
    {
        minimum = *((heap->p) + right);
        leftflag = 0;
        rightflag = 1;
    }
    if (leftflag)
    {
        *((heap->p) + left) = *((heap->p) + index);
        *((heap->p) + index) = minimum;
        down_heapify(heap, left);
    }
    if (rightflag)
    {
        *((heap->p) + right) = *((heap->p) + index);
        *((heap->p) + index) = minimum;
        down_heapify(heap, right);
    }
}
void up_heapify(Heap *heap, int index)
{
    int parent = (index - 1) / 2;
    if (parent < 0)
        return;
    if (*((heap->p) + index) < *((heap->p) + parent))
    {
        int temp = *((heap->p) + index);
        *((heap->p) + index) = *((heap->p) + parent);
        *((heap->p) + parent) = temp;
        up_heapify(heap, parent);
    }
}

void push(Heap *heap, int x)
{
    if (heap->count >= heap->size)
        return;
    *((heap->p) + heap->count) = x;
    heap->count++;
    if (4 * heap->count >= 3 * heap->size)
    {
        heap->size *= 2;
        (heap->p) = (int *)realloc((heap->p), (heap->size) * sizeof(int));
    }
    up_heapify(heap, heap->count - 1);
}
void pop(Heap *heap)
{
    if (heap->count == 0)
        return;
    heap->count--;
    int temp = *((heap->p) + heap->count);
    *((heap->p) + heap->count) = *(heap->p);
    *(heap->p) = temp;
    down_heapify(heap, 0);
    if (4 * heap->count <= heap->size)
    {
        heap->size /= 2;
        (heap->p) = (int *)realloc((heap->p), (heap->size) * sizeof(int));
    }
}
int top(Heap *heap)
{
    if (heap->count != 0)
        return *(heap->p);
    else
        return INT_MIN;
}
int empty(Heap *heap)
{
    if (heap->count != 0)
        return 0;
    else
        return 1;
}
int size(Heap *heap) { return heap->count; }
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```c
#include <limits.h>  /// for INT_MIN
#include <stdio.h>   /// for IO operations
#include <stdlib.h>  /// for dynamic memory allocation

typedef struct max_heap
{
    int *p;
    int size;
    int count;
} Heap;

Heap *create_heap(Heap *heap); /*Creates a max_heap structure and returns a
                                  pointer to the struct*/
void down_heapify(Heap *heap, int index); /*Pushes an element downwards in the
                                             heap to find its correct position*/
void up_heapify(Heap *heap, int index); /*Pushes an element upwards in the heap
                                           to find its correct position*/
void push(Heap *heap, int x);           /*Inserts an element in the heap*/
void pop(Heap *heap); /*Removes the top element from the heap*/
int top(Heap *heap); /*Returns the top element of the heap or returns INT_MIN if
                        heap is empty*/
int empty(Heap *heap); /*Checks if heap is empty*/
int size(Heap *heap);  /*Returns the size of heap*/

int main()
{
    Heap *head = create_heap(head);
    push(head, 10);
    printf("Pushing element : 10\n");
    push(head, 3);
    printf("Pushing element : 3\n");
    push(head, 2);
    printf("Pushing element : 2\n");
    push(head, 8);
    printf("Pushing element : 8\n");
    printf("Top element = %d \n", top(head));
    push(head, 1);
    printf("Pushing element : 1\n");
    push(head, 7);
    printf("Pushing element : 7\n");
    printf("Top element = %d \n", top(head));
    pop(head);
    printf("Popping an element.\n");
    printf("Top element = %d \n", top(head));
    pop(head);
    printf("Popping an element.\n");
    printf("Top element = %d \n", top(head));
    printf("\n");
    return 0;
}
Heap *create_heap(Heap *heap)
{
    heap = (Heap *)malloc(sizeof(Heap));
    heap->size = 1;
    heap->p = (int *)malloc(heap->size * sizeof(int));
    heap->count = 0;
    return heap;
}

void down_heapify(Heap *heap, int index)
{
    if (index >= heap->count)
        return;
    int left = index * 2 + 1;
    int right = index * 2 + 2;
    int leftflag = 0, rightflag = 0;

    int maximum = *((heap->p) + index);
    if (left < heap->count && maximum < *((heap->p) + left))
    {
        maximum = *((heap->p) + left);
        leftflag = 1;
    }
    if (right < heap->count && maximum < *((heap->p) + right))
    {
        maximum = *((heap->p) + right);
        leftflag = 0;
        rightflag = 1;
    }
    if (leftflag)
    {
        *((heap->p) + left) = *((heap->p) + index);
        *((heap->p) + index) = maximum;
        down_heapify(heap, left);
    }
    if (rightflag)
    {
        *((heap->p) + right) = *((heap->p) + index);
        *((heap->p) + index) = maximum;
        down_heapify(heap, right);
    }
}
void up_heapify(Heap *heap, int index)
{
    int parent = (index - 1) / 2;
    if (parent < 0)
        return;
    if (*((heap->p) + index) > *((heap->p) + parent))
    {
        int temp = *((heap->p) + index);
        *((heap->p) + index) = *((heap->p) + parent);
        *((heap->p) + parent) = temp;
        up_heapify(heap, parent);
    }
}

void push(Heap *heap, int x)
{
    if (heap->count >= heap->size)
        return;
    *((heap->p) + heap->count) = x;
    heap->count++;
    if (4 * heap->count >= 3 * heap->size)
    {
        heap->size *= 2;
        (heap->p) = (int *)realloc((heap->p), (heap->size) * sizeof(int));
    }
    up_heapify(heap, heap->count - 1);
}
void pop(Heap *heap)
{
    if (heap->count == 0)
        return;
    heap->count--;
    int temp = *((heap->p) + heap->count);
    *((heap->p) + heap->count) = *(heap->p);
    *(heap->p) = temp;
    down_heapify(heap, 0);
    if (4 * heap->count <= heap->size)
    {
        heap->size /= 2;
        (heap->p) = (int *)realloc((heap->p), (heap->size) * sizeof(int));
    }
}
int top(Heap *heap)
{
    if (heap->count != 0)
        return *(heap->p);
    else
        return INT_MIN;
}
int empty(Heap *heap)
{
    if (heap->count != 0)
        return 0;
    else
        return 1;
}
int size(Heap *heap) { return heap->count; }
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Linked List

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* HEADER

```c

```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* DESIGN

```c

```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* VERIFICATION

```c

```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## List

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* HEADER

```c
#ifndef __LIST__
#define __LIST__

#define L List_T
typedef struct L *L;

struct L
{
    void *val;
    L next;
};

extern L List_init(void);
extern L List_push(L list, void *val);
extern int List_length(L list);
extern void **List_toArray(L list);
extern L List_append(L list, L tail);
extern L List_list(L list, void *val, ...);
/* TODO */
extern L List_copy(L list);
extern int List_pop(L *list);

#undef L
#endif
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* DESIGN

```c
#include "list.h"
#include <assert.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

#define L List_T

/* Initial list */
L List_init(void)
{
    L list;
    list = (L)malloc(sizeof(L));
    list->next = NULL;
    return list;
}

/* Push an element into top of the list */
L List_push(L list, void *val)
{
    L new_elem = (L)malloc(sizeof(L));
    new_elem->val = val;
    new_elem->next = list;
    return new_elem;
}

/* Length of list */
int List_length(L list)
{
    int n;
    for (n = 0; list; list = list->next) n++;
    return n;
}

/* Convert list to array */
void **List_toArray(L list)
{
    int i, n = List_length(list);
    void **array = (void **)malloc((n + 1) * sizeof(*array));

    for (i = 0; i < n; i++)
    {
        array[i] = list->val;
        list = list->next;
    }
    array[i] = NULL;
    return array;
}

/* Create and return a list */
L List_list(L list, void *val, ...)
{
    va_list ap;
    L *p = &list;

    va_start(ap, val);
    for (; val; val = va_arg(ap, void *))
    {
        *p = malloc(sizeof(L));
        (*p)->val = val;
        p = &(*p)->next;
    }
    *p = NULL;
    va_end(ap);
    return list;
}

/* Append 2 lists together */
L List_append(L list, L tail)
{
    L *p = &list;
    while ((*p)->next)
    {
        p = &(*p)->next;
    }

    *p = tail;
    return list;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* VERIFICATION

```c
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "list.h"

void print_list(char **array)
{
    int i;
    for (i = 0; array[i]; i++) printf("%s", array[i]);
    printf("\n");
}

int main()
{
    List_T list1, list2, list3;
    char **str1 = (char **)malloc(100 * sizeof(char *));

    list1 = List_init();
    list1 = List_push(list1, "Dang ");
    list1 = List_push(list1, "Hoang ");
    list1 = List_push(list1, "Hai ");
    printf("List 1: ");
    str1 = (char **)List_toArray(list1);
    print_list(str1);

    list2 = List_init();
    list2 = List_list(list2, "Mentor ", "Graphics ", "Siemens", NULL);
    printf("List 2: ");
    print_list((char **)List_toArray(list2));

    list3 = List_append(list1, list2);
    printf("Test append list2 into list1: ");
    print_list((char **)List_toArray(list3));

    return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Queue

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* HEADER

```c
//////////////////////////////////////////////////////////////////////////////////////
/// INCLUDES

#include <stdio.h>
#include <stdlib.h>
////////////////////////////////////////////////////////////////////////////////
// DATA STRUCTURES
/**
 * Defining the structure of the node which contains 'data' (type : integer),
 * two pointers 'next' and 'pre' (type : struct node).
 */

struct node
{
    int data;
    struct node *next;
    struct node *pre;
} * head, *tail, *tmp;

////////////////////////////////////////////////////////////////////////////////
// FORWARD DECLARATIONS

void create();
void enque(int x);
int deque();
int peek();
int size();
int isEmpty();
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* DESIGN

```c
////////////////////////////////////////////////////////////////////////////////
// INCLUDES
#include "include.h";

////////////////////////////////////////////////////////////////////////////////
// GLOBAL VARIABLES
int count;

////////////////////////////////////////////////////////////////////////////////
// MAIN ENTRY POINT

int main(int argc, char const *argv[])
{
    create();
    enque(5);

    return 0;
}

void create()
{
    head = NULL;
    tail = NULL;
}

/**
 * Puts an item into the Queue.
 */
void enque(int x)
{
    if (head == NULL)
    {
        head = (struct node *)malloc(sizeof(struct node));
        head->data = x;
        head->pre = NULL;
        tail = head;
    }
    else
    {
        tmp = (struct node *)malloc(sizeof(struct node));
        tmp->data = x;
        tmp->next = tail;
        tail = tmp;
    }
}

/**
 * Takes the next item from the Queue.
 */
int deque()
{
    int returnData = 0;
    if (head == NULL)
    {
        printf("ERROR: Deque from empty queue.\n");
        exit(1);
    }
    else
    {
        returnData = head->data;
        if (head->pre == NULL)
            head = NULL;
        else
            head = head->pre;
        head->next = NULL;
    }
    return returnData;
}

/**
 * Returns the size of the Queue.
 */
int size() { return count; }
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Stack

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* HEADER

```c

```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* DESIGN

```c

```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* VERIFICATION

```c

```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Trie

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```c
/*------------------Trie Data Structure----------------------------------*/
/*-------------Implimented for search a word in dictionary---------------*/

/*-----character - 97 used for get the character from the ASCII value-----*/

// needed for strnlen
#define _POSIX_C_SOURCE 200809L

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ALPHABET_SIZE 26

/*--Node in the Trie--*/
struct trie {
    struct trie *children[ALPHABET_SIZE];
    bool end_of_word;
};


/*--Create new trie node--*/
int trie_new (
    struct trie ** trie
)
{
    *trie = calloc(1, sizeof(struct trie));
    if (NULL == *trie) {
        // memory allocation failed
        return -1;
    }
    return 0;
}


/*--Insert new word to Trie--*/
int trie_insert (
    struct trie * trie,
    char *word,
    unsigned word_len
)
{
    int ret = 0;

    // this is the end of this word; add an end-of-word marker here and we're
    // done.
    if (0 == word_len) {
        trie->end_of_word = true;
        return 0;
    }

    // if you have some more complex mapping, you could introduce one here. In
    // this easy example, we just subtract 'a' (97) from it, meaning that 'a' is 0,
    // 'b' is 1, and so on.
    const unsigned int index = word[0] - 'a';

    // this index is outside the alphabet size; indexing this would mean an
    // out-of-bound memory access (bad!). If you introduce a separate map
    // function for indexing, then you could move the out-of-bounds index in
    // there.
    if (ALPHABET_SIZE <= index) {
        return -1;
    }

    // The index does not exist yet, allocate it.
    if (NULL == trie->children[index]) {
        ret = trie_new(&trie->children[index]);
        if (-1 == ret) {
            // creating new trie node failed
            return -1;
        }
    }
    
    // recurse into the child node
    return trie_insert(
        /* trie = */ trie->children[index],
        /* word = */ word + 1,
        /* word_len = */ word_len - 1
    );
}


/*--Search a word in the Trie--*/
int trie_search(
    struct trie * trie,
    char *word,
    unsigned word_len,
    struct trie ** result
)
{
    // we found a match
    if (0 == word_len) {
        *result = trie;
        return 0;
    }

    // same here as in trie_insert, if you have a separate index mapping, add
    // it here. In this example, we just subtract 'a'.
    const unsigned int index = word[0] - 'a';

    // This word contains letters outside the alphabet length; it's invalid.
    // Remember to do this to prevent buffer overflows.
    if (ALPHABET_SIZE <= index) {
        return -1;
    }

    // No match
    if (NULL == trie->children[index]) {
        return -1;
    }

    // traverse the trie
    return trie_search(
        /* trie = */ trie->children[index],
        /* word = */ word + 1,
        /* word_len = */ word_len - 1,
        /* result = */ result
    );
}

/*---Return all the related words------*/
void trie_print (
    struct trie * trie,
    char prefix[],
    unsigned prefix_len
)
{

    // An end-of-word marker means that this is a complete word, print it.
    if (true == trie->end_of_word) {
        printf("%.*s\n", prefix_len, prefix);
    }

    // However, there can be longer words with the same prefix; traverse into
    // those as well.
    for (int i = 0; i < ALPHABET_SIZE; i++) {

        // No words on this character
        if (NULL == trie->children[i]) {
            continue;
        }

        // If you have a separate index mapping, then you'd need the inverse of
        // the map here. Since we subtracted 'a' for the index, we can just add
        // 'a' to get the inverse map function.
        prefix[prefix_len] = i + 'a';

        // traverse the print into the child
        trie_print(trie->children[i], prefix, prefix_len + 1);
    }
}


/*------Demonstrate purposes uses text file called dictionary -------*/

int main() {
    int ret = 0;
    struct trie * root = NULL;
    struct trie * trie = NULL;
    char word[100] = {0};

    // Create a root trie
    ret = trie_new(&root);
    if (-1 == ret) {
        fprintf(stderr, "Could not create trie\n");
        exit(1);
    }

    // open the dictionary file
    FILE *fp = fopen("dictionary.txt", "r");
    if (NULL == fp) {
        fprintf(stderr, "Error while opening dictionary file");
        exit(1);
    }

    // insert all the words from the dictionary
    while (1 == fscanf(fp, "%100s\n", word)) {
        ret = trie_insert(root, word, strnlen(word, 100));
        if (-1 == ret) {
            fprintf(stderr, "Could not insert word into trie\n");
            exit(1);
        }
    }

    while (1) {
        printf("Enter keyword: ");
        if (1 != scanf("%100s", word)) {
            break;
        }

        printf(
            "\n==========================================================\n");
        printf("\n********************* Possible Words ********************\n");

        ret = trie_search(root, word, strnlen(word, 100), &trie);
        if (-1 == ret) {
            printf("No results\n");
            continue;
        }

        trie_print(trie, word, strnlen(word, 100));

        printf("\n==========================================================\n");
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....
