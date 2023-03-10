; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !23, metadata !DIExpression()), !dbg !27
  store void (i64*)* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65b_badSink, void (i64*)** %funcPtr, align 8, !dbg !27
  store i64* null, i64** %data, align 8, !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !29
  %0 = bitcast i8* %call to i64*, !dbg !30
  store i64* %0, i64** %data, align 8, !dbg !31
  %1 = load i64*, i64** %data, align 8, !dbg !32
  store i64 2147483643, i64* %1, align 8, !dbg !33
  %2 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !34
  %3 = load i64*, i64** %data, align 8, !dbg !35
  call void %2(i64* %3), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65b_badSink(i64*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65_good() #0 !dbg !37 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* null) #4, !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 %conv) #4, !dbg !53
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65_good(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65_bad(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !61 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !64, metadata !DIExpression()), !dbg !65
  store void (i64*)* @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65b_goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !65
  store i64* null, i64** %data, align 8, !dbg !66
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !67
  %0 = bitcast i8* %call to i64*, !dbg !68
  store i64* %0, i64** %data, align 8, !dbg !69
  %1 = load i64*, i64** %data, align 8, !dbg !70
  store i64 2147483643, i64* %1, align 8, !dbg !71
  %2 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !72
  %3 = load i64*, i64** %data, align 8, !dbg !73
  call void %2(i64* %3), !dbg !72
  ret void, !dbg !74
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65b_goodG2BSink(i64*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65a.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65_bad", scope: !18, file: !18, line: 24, type: !19, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65a.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !17)
!23 = !DILocalVariable(name: "funcPtr", scope: !17, file: !18, line: 28, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !4}
!27 = !DILocation(line: 28, column: 12, scope: !17)
!28 = !DILocation(line: 30, column: 10, scope: !17)
!29 = !DILocation(line: 33, column: 23, scope: !17)
!30 = !DILocation(line: 33, column: 12, scope: !17)
!31 = !DILocation(line: 33, column: 10, scope: !17)
!32 = !DILocation(line: 34, column: 6, scope: !17)
!33 = !DILocation(line: 34, column: 11, scope: !17)
!34 = !DILocation(line: 36, column: 5, scope: !17)
!35 = !DILocation(line: 36, column: 13, scope: !17)
!36 = !DILocation(line: 37, column: 1, scope: !17)
!37 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_65_good", scope: !18, file: !18, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 60, column: 5, scope: !37)
!39 = !DILocation(line: 61, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 73, type: !41, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !43, !44}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !18, line: 73, type: !43)
!48 = !DILocation(line: 73, column: 14, scope: !40)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !18, line: 73, type: !44)
!50 = !DILocation(line: 73, column: 27, scope: !40)
!51 = !DILocation(line: 76, column: 22, scope: !40)
!52 = !DILocation(line: 76, column: 12, scope: !40)
!53 = !DILocation(line: 76, column: 5, scope: !40)
!54 = !DILocation(line: 78, column: 5, scope: !40)
!55 = !DILocation(line: 79, column: 5, scope: !40)
!56 = !DILocation(line: 80, column: 5, scope: !40)
!57 = !DILocation(line: 83, column: 5, scope: !40)
!58 = !DILocation(line: 84, column: 5, scope: !40)
!59 = !DILocation(line: 85, column: 5, scope: !40)
!60 = !DILocation(line: 87, column: 5, scope: !40)
!61 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 46, type: !19, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "data", scope: !61, file: !18, line: 48, type: !4)
!63 = !DILocation(line: 48, column: 15, scope: !61)
!64 = !DILocalVariable(name: "funcPtr", scope: !61, file: !18, line: 49, type: !24)
!65 = !DILocation(line: 49, column: 12, scope: !61)
!66 = !DILocation(line: 51, column: 10, scope: !61)
!67 = !DILocation(line: 53, column: 23, scope: !61)
!68 = !DILocation(line: 53, column: 12, scope: !61)
!69 = !DILocation(line: 53, column: 10, scope: !61)
!70 = !DILocation(line: 54, column: 6, scope: !61)
!71 = !DILocation(line: 54, column: 11, scope: !61)
!72 = !DILocation(line: 55, column: 5, scope: !61)
!73 = !DILocation(line: 55, column: 13, scope: !61)
!74 = !DILocation(line: 56, column: 1, scope: !61)
