; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68_badData = dso_local global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68_goodG2BData = dso_local global i64* null, align 8, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68_bad() #0 !dbg !23 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i64* null, i64** %data, align 8, !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !29
  %0 = bitcast i8* %call to i64*, !dbg !30
  store i64* %0, i64** %data, align 8, !dbg !31
  %1 = load i64*, i64** %data, align 8, !dbg !32
  store i64* %1, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68_badData, align 8, !dbg !33
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68b_badSink(), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68_good() #0 !dbg !36 {
entry:
  call void @goodG2B(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !39 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !60 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !61, metadata !DIExpression()), !dbg !62
  store i64* null, i64** %data, align 8, !dbg !63
  %call = call noalias align 16 i8* @malloc(i64 800) #4, !dbg !64
  %0 = bitcast i8* %call to i64*, !dbg !65
  store i64* %0, i64** %data, align 8, !dbg !66
  %1 = load i64*, i64** %data, align 8, !dbg !67
  store i64* %1, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68_goodG2BData, align 8, !dbg !68
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68b_goodG2BSink(), !dbg !69
  ret void, !dbg !70
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68_badData", scope: !2, file: !16, line: 19, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 44, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68_goodG2BData", scope: !2, file: !16, line: 20, type: !6, isLocal: false, isDefinition: true)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68_bad", scope: !16, file: !16, line: 27, type: !24, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !16, line: 29, type: !6)
!27 = !DILocation(line: 29, column: 15, scope: !23)
!28 = !DILocation(line: 30, column: 10, scope: !23)
!29 = !DILocation(line: 32, column: 23, scope: !23)
!30 = !DILocation(line: 32, column: 12, scope: !23)
!31 = !DILocation(line: 32, column: 10, scope: !23)
!32 = !DILocation(line: 33, column: 78, scope: !23)
!33 = !DILocation(line: 33, column: 76, scope: !23)
!34 = !DILocation(line: 34, column: 5, scope: !23)
!35 = !DILocation(line: 35, column: 1, scope: !23)
!36 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_68_good", scope: !16, file: !16, line: 55, type: !24, scopeLine: 56, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DILocation(line: 57, column: 5, scope: !36)
!38 = !DILocation(line: 58, column: 1, scope: !36)
!39 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 70, type: !40, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{!42, !42, !43}
!42 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !16, line: 70, type: !42)
!47 = !DILocation(line: 70, column: 14, scope: !39)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !39, file: !16, line: 70, type: !43)
!49 = !DILocation(line: 70, column: 27, scope: !39)
!50 = !DILocation(line: 73, column: 22, scope: !39)
!51 = !DILocation(line: 73, column: 12, scope: !39)
!52 = !DILocation(line: 73, column: 5, scope: !39)
!53 = !DILocation(line: 75, column: 5, scope: !39)
!54 = !DILocation(line: 76, column: 5, scope: !39)
!55 = !DILocation(line: 77, column: 5, scope: !39)
!56 = !DILocation(line: 80, column: 5, scope: !39)
!57 = !DILocation(line: 81, column: 5, scope: !39)
!58 = !DILocation(line: 82, column: 5, scope: !39)
!59 = !DILocation(line: 84, column: 5, scope: !39)
!60 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 45, type: !24, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocalVariable(name: "data", scope: !60, file: !16, line: 47, type: !6)
!62 = !DILocation(line: 47, column: 15, scope: !60)
!63 = !DILocation(line: 48, column: 10, scope: !60)
!64 = !DILocation(line: 50, column: 23, scope: !60)
!65 = !DILocation(line: 50, column: 12, scope: !60)
!66 = !DILocation(line: 50, column: 10, scope: !60)
!67 = !DILocation(line: 51, column: 82, scope: !60)
!68 = !DILocation(line: 51, column: 80, scope: !60)
!69 = !DILocation(line: 52, column: 5, scope: !60)
!70 = !DILocation(line: 53, column: 1, scope: !60)
