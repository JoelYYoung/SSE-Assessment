; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !25, metadata !DIExpression()), !dbg !29
  store void (%struct._twoIntsStruct*)* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65b_badSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !29
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !31
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %1 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !34
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  call void %1(%struct._twoIntsStruct* %2), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65b_badSink(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #4, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #4, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !60 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !63, metadata !DIExpression()), !dbg !64
  store void (%struct._twoIntsStruct*)* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65b_goodG2BSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !64
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !65
  %call = call noalias align 16 i8* @malloc(i64 800) #4, !dbg !66
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !67
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %1 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !69
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !70
  call void %1(%struct._twoIntsStruct* %2), !dbg !69
  ret void, !dbg !71
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65b_goodG2BSink(%struct._twoIntsStruct*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65_bad", scope: !20, file: !20, line: 24, type: !21, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65a.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 26, type: !4)
!24 = !DILocation(line: 26, column: 21, scope: !19)
!25 = !DILocalVariable(name: "funcPtr", scope: !19, file: !20, line: 28, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !4}
!29 = !DILocation(line: 28, column: 12, scope: !19)
!30 = !DILocation(line: 29, column: 10, scope: !19)
!31 = !DILocation(line: 31, column: 29, scope: !19)
!32 = !DILocation(line: 31, column: 12, scope: !19)
!33 = !DILocation(line: 31, column: 10, scope: !19)
!34 = !DILocation(line: 33, column: 5, scope: !19)
!35 = !DILocation(line: 33, column: 13, scope: !19)
!36 = !DILocation(line: 34, column: 1, scope: !19)
!37 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_65_good", scope: !20, file: !20, line: 53, type: !21, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 55, column: 5, scope: !37)
!39 = !DILocation(line: 56, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 68, type: !41, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!10, !10, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !20, line: 68, type: !10)
!47 = !DILocation(line: 68, column: 14, scope: !40)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !20, line: 68, type: !43)
!49 = !DILocation(line: 68, column: 27, scope: !40)
!50 = !DILocation(line: 71, column: 22, scope: !40)
!51 = !DILocation(line: 71, column: 12, scope: !40)
!52 = !DILocation(line: 71, column: 5, scope: !40)
!53 = !DILocation(line: 73, column: 5, scope: !40)
!54 = !DILocation(line: 74, column: 5, scope: !40)
!55 = !DILocation(line: 75, column: 5, scope: !40)
!56 = !DILocation(line: 78, column: 5, scope: !40)
!57 = !DILocation(line: 79, column: 5, scope: !40)
!58 = !DILocation(line: 80, column: 5, scope: !40)
!59 = !DILocation(line: 82, column: 5, scope: !40)
!60 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 43, type: !21, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", scope: !60, file: !20, line: 45, type: !4)
!62 = !DILocation(line: 45, column: 21, scope: !60)
!63 = !DILocalVariable(name: "funcPtr", scope: !60, file: !20, line: 46, type: !26)
!64 = !DILocation(line: 46, column: 12, scope: !60)
!65 = !DILocation(line: 47, column: 10, scope: !60)
!66 = !DILocation(line: 49, column: 29, scope: !60)
!67 = !DILocation(line: 49, column: 12, scope: !60)
!68 = !DILocation(line: 49, column: 10, scope: !60)
!69 = !DILocation(line: 50, column: 5, scope: !60)
!70 = !DILocation(line: 50, column: 13, scope: !60)
!71 = !DILocation(line: 51, column: 1, scope: !60)
