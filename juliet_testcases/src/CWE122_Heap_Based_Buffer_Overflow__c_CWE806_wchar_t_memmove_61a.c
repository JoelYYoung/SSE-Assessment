/* TEMPLATE GENERATED TESTCASE FILE
Filename: CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_61a.c
Label Definition File: CWE122_Heap_Based_Buffer_Overflow__c_CWE806.label.xml
Template File: sources-sink-61a.tmpl.c
*/
/*
 * @description
 * CWE: 122 Heap Based Buffer Overflow
 * BadSource:  Initialize data as a large string
 * GoodSource: Initialize data as a small string
 * Sinks: memmove
 *    BadSink : Copy data to string using memmove
 * Flow Variant: 61 Data flow: data returned from one function to another in different source files
 *
 * */

#include "std_testcase.h"

#include <wchar.h>

#ifndef OMITBAD

/* bad function declaration */
wchar_t * CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_61b_badSource(wchar_t * data);

void CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_61_bad()
{
    wchar_t * data;
    data = (wchar_t *)malloc(100*sizeof(wchar_t));
    data = CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_61b_badSource(data);
    {
        wchar_t dest[50] = L"";
        /* POTENTIAL FLAW: Possible buffer overflow if data is larger than dest */
        memmove(dest, data, wcslen(data)*sizeof(wchar_t));
        dest[50-1] = L'\0'; /* Ensure the destination buffer is null terminated */
        printWLine(data);
        free(data);
    }
}

#endif /* OMITBAD */

#ifndef OMITGOOD

/* goodG2B uses the GoodSource with the BadSink */
wchar_t * CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_61b_goodG2BSource(wchar_t * data);

static void goodG2B()
{
    wchar_t * data;
    data = (wchar_t *)malloc(100*sizeof(wchar_t));
    data = CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_61b_goodG2BSource(data);
    {
        wchar_t dest[50] = L"";
        /* POTENTIAL FLAW: Possible buffer overflow if data is larger than dest */
        memmove(dest, data, wcslen(data)*sizeof(wchar_t));
        dest[50-1] = L'\0'; /* Ensure the destination buffer is null terminated */
        printWLine(data);
        free(data);
    }
}

void CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_61_good()
{
    goodG2B();
}

#endif /* OMITGOOD */

/* Below is the main(). It is only used when building this testcase on
 * its own for testing or for building a binary to use in testing binary
 * analysis tools. It is not used when compiling all the testcases as one
 * application, which is how source code analysis tools are tested.
 */

#ifdef INCLUDEMAIN

int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );
#ifndef OMITGOOD
    printLine("Calling good()...");
    CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_61_good();
    printLine("Finished good()");
#endif /* OMITGOOD */
#ifndef OMITBAD
    printLine("Calling bad()...");
    CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_61_bad();
    printLine("Finished bad()");
#endif /* OMITBAD */
    return 0;
}

#endif
