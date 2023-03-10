; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !23, metadata !DIExpression()), !dbg !27
  store void (i64*)* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65b_badSink, void (i64*)** %funcPtr, align 8, !dbg !27
  store i64* null, i64** %data, align 8, !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !29
  %0 = bitcast i8* %call to i64*, !dbg !30
  store i64* %0, i64** %data, align 8, !dbg !31
  %1 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !32
  %2 = load i64*, i64** %data, align 8, !dbg !33
  call void %1(i64* %2), !dbg !32
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65b_badSink(i64*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65_good() #0 !dbg !35 {
entry:
  call void @goodG2B(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !38 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* null) #4, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #4, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !62, metadata !DIExpression()), !dbg !63
  store void (i64*)* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65b_goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !63
  store i64* null, i64** %data, align 8, !dbg !64
  %call = call noalias align 16 i8* @malloc(i64 800) #4, !dbg !65
  %0 = bitcast i8* %call to i64*, !dbg !66
  store i64* %0, i64** %data, align 8, !dbg !67
  %1 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !68
  %2 = load i64*, i64** %data, align 8, !dbg !69
  call void %1(i64* %2), !dbg !68
  ret void, !dbg !70
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65b_goodG2BSink(i64*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65_bad", scope: !18, file: !18, line: 24, type: !19, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65a.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !17)
!23 = !DILocalVariable(name: "funcPtr", scope: !17, file: !18, line: 28, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !4}
!27 = !DILocation(line: 28, column: 12, scope: !17)
!28 = !DILocation(line: 29, column: 10, scope: !17)
!29 = !DILocation(line: 31, column: 23, scope: !17)
!30 = !DILocation(line: 31, column: 12, scope: !17)
!31 = !DILocation(line: 31, column: 10, scope: !17)
!32 = !DILocation(line: 33, column: 5, scope: !17)
!33 = !DILocation(line: 33, column: 13, scope: !17)
!34 = !DILocation(line: 34, column: 1, scope: !17)
!35 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_65_good", scope: !18, file: !18, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 55, column: 5, scope: !35)
!37 = !DILocation(line: 56, column: 1, scope: !35)
!38 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 68, type: !39, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!41, !41, !42}
!41 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !38, file: !18, line: 68, type: !41)
!46 = !DILocation(line: 68, column: 14, scope: !38)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !38, file: !18, line: 68, type: !42)
!48 = !DILocation(line: 68, column: 27, scope: !38)
!49 = !DILocation(line: 71, column: 22, scope: !38)
!50 = !DILocation(line: 71, column: 12, scope: !38)
!51 = !DILocation(line: 71, column: 5, scope: !38)
!52 = !DILocation(line: 73, column: 5, scope: !38)
!53 = !DILocation(line: 74, column: 5, scope: !38)
!54 = !DILocation(line: 75, column: 5, scope: !38)
!55 = !DILocation(line: 78, column: 5, scope: !38)
!56 = !DILocation(line: 79, column: 5, scope: !38)
!57 = !DILocation(line: 80, column: 5, scope: !38)
!58 = !DILocation(line: 82, column: 5, scope: !38)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 43, type: !19, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", scope: !59, file: !18, line: 45, type: !4)
!61 = !DILocation(line: 45, column: 15, scope: !59)
!62 = !DILocalVariable(name: "funcPtr", scope: !59, file: !18, line: 46, type: !24)
!63 = !DILocation(line: 46, column: 12, scope: !59)
!64 = !DILocation(line: 47, column: 10, scope: !59)
!65 = !DILocation(line: 49, column: 23, scope: !59)
!66 = !DILocation(line: 49, column: 12, scope: !59)
!67 = !DILocation(line: 49, column: 10, scope: !59)
!68 = !DILocation(line: 50, column: 5, scope: !59)
!69 = !DILocation(line: 50, column: 13, scope: !59)
!70 = !DILocation(line: 51, column: 1, scope: !59)
