; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !24, metadata !DIExpression()), !dbg !28
  store void (i64*)* @badSink, void (i64*)** %funcPtr, align 8, !dbg !28
  store i64* null, i64** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !30
  %0 = bitcast i8* %call to i64*, !dbg !31
  store i64* %0, i64** %data, align 8, !dbg !32
  %1 = load i64*, i64** %data, align 8, !dbg !33
  %cmp = icmp eq i64* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !39
  store i64 2147483643, i64* %2, align 8, !dbg !40
  %3 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !41
  %4 = load i64*, i64** %data, align 8, !dbg !42
  call void %3(i64* %4), !dbg !41
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i64* %data) #0 !dbg !44 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i64*, i64** %data.addr, align 8, !dbg !47
  %1 = load i64, i64* %0, align 8, !dbg !48
  call void @printLongLongLine(i64 %1), !dbg !49
  %2 = load i64*, i64** %data.addr, align 8, !dbg !50
  %3 = bitcast i64* %2 to i8*, !dbg !50
  call void @free(i8* %3) #5, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !80, metadata !DIExpression()), !dbg !81
  store void (i64*)* @goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !81
  store i64* null, i64** %data, align 8, !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !83
  %0 = bitcast i8* %call to i64*, !dbg !84
  store i64* %0, i64** %data, align 8, !dbg !85
  %1 = load i64*, i64** %data, align 8, !dbg !86
  %cmp = icmp eq i64* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !92
  store i64 2147483643, i64* %2, align 8, !dbg !93
  %3 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !94
  %4 = load i64*, i64** %data, align 8, !dbg !95
  call void %3(i64* %4), !dbg !94
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i64* %data) #0 !dbg !97 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = load i64*, i64** %data.addr, align 8, !dbg !100
  %1 = load i64, i64* %0, align 8, !dbg !101
  call void @printLongLongLine(i64 %1), !dbg !102
  %2 = load i64*, i64** %data.addr, align 8, !dbg !103
  %3 = bitcast i64* %2 to i8*, !dbg !103
  call void @free(i8* %3) #5, !dbg !104
  ret void, !dbg !105
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44_bad", scope: !19, file: !19, line: 28, type: !20, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 30, type: !4)
!23 = !DILocation(line: 30, column: 15, scope: !18)
!24 = !DILocalVariable(name: "funcPtr", scope: !18, file: !19, line: 32, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !4}
!28 = !DILocation(line: 32, column: 12, scope: !18)
!29 = !DILocation(line: 34, column: 10, scope: !18)
!30 = !DILocation(line: 37, column: 23, scope: !18)
!31 = !DILocation(line: 37, column: 12, scope: !18)
!32 = !DILocation(line: 37, column: 10, scope: !18)
!33 = !DILocation(line: 38, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !19, line: 38, column: 9)
!35 = !DILocation(line: 38, column: 14, scope: !34)
!36 = !DILocation(line: 38, column: 9, scope: !18)
!37 = !DILocation(line: 38, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !19, line: 38, column: 23)
!39 = !DILocation(line: 39, column: 6, scope: !18)
!40 = !DILocation(line: 39, column: 11, scope: !18)
!41 = !DILocation(line: 41, column: 5, scope: !18)
!42 = !DILocation(line: 41, column: 13, scope: !18)
!43 = !DILocation(line: 42, column: 1, scope: !18)
!44 = distinct !DISubprogram(name: "badSink", scope: !19, file: !19, line: 21, type: !26, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocalVariable(name: "data", arg: 1, scope: !44, file: !19, line: 21, type: !4)
!46 = !DILocation(line: 21, column: 31, scope: !44)
!47 = !DILocation(line: 24, column: 24, scope: !44)
!48 = !DILocation(line: 24, column: 23, scope: !44)
!49 = !DILocation(line: 24, column: 5, scope: !44)
!50 = !DILocation(line: 25, column: 10, scope: !44)
!51 = !DILocation(line: 25, column: 5, scope: !44)
!52 = !DILocation(line: 26, column: 1, scope: !44)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_44_good", scope: !19, file: !19, line: 69, type: !20, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 71, column: 5, scope: !53)
!55 = !DILocation(line: 72, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 83, type: !57, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !19, line: 83, type: !59)
!64 = !DILocation(line: 83, column: 14, scope: !56)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !19, line: 83, type: !60)
!66 = !DILocation(line: 83, column: 27, scope: !56)
!67 = !DILocation(line: 86, column: 22, scope: !56)
!68 = !DILocation(line: 86, column: 12, scope: !56)
!69 = !DILocation(line: 86, column: 5, scope: !56)
!70 = !DILocation(line: 88, column: 5, scope: !56)
!71 = !DILocation(line: 89, column: 5, scope: !56)
!72 = !DILocation(line: 90, column: 5, scope: !56)
!73 = !DILocation(line: 93, column: 5, scope: !56)
!74 = !DILocation(line: 94, column: 5, scope: !56)
!75 = !DILocation(line: 95, column: 5, scope: !56)
!76 = !DILocation(line: 97, column: 5, scope: !56)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !19, line: 58, type: !4)
!79 = !DILocation(line: 58, column: 15, scope: !77)
!80 = !DILocalVariable(name: "funcPtr", scope: !77, file: !19, line: 59, type: !25)
!81 = !DILocation(line: 59, column: 12, scope: !77)
!82 = !DILocation(line: 61, column: 10, scope: !77)
!83 = !DILocation(line: 63, column: 23, scope: !77)
!84 = !DILocation(line: 63, column: 12, scope: !77)
!85 = !DILocation(line: 63, column: 10, scope: !77)
!86 = !DILocation(line: 64, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !77, file: !19, line: 64, column: 9)
!88 = !DILocation(line: 64, column: 14, scope: !87)
!89 = !DILocation(line: 64, column: 9, scope: !77)
!90 = !DILocation(line: 64, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !19, line: 64, column: 23)
!92 = !DILocation(line: 65, column: 6, scope: !77)
!93 = !DILocation(line: 65, column: 11, scope: !77)
!94 = !DILocation(line: 66, column: 5, scope: !77)
!95 = !DILocation(line: 66, column: 13, scope: !77)
!96 = !DILocation(line: 67, column: 1, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2BSink", scope: !19, file: !19, line: 49, type: !26, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !19, line: 49, type: !4)
!99 = !DILocation(line: 49, column: 35, scope: !97)
!100 = !DILocation(line: 52, column: 24, scope: !97)
!101 = !DILocation(line: 52, column: 23, scope: !97)
!102 = !DILocation(line: 52, column: 5, scope: !97)
!103 = !DILocation(line: 53, column: 10, scope: !97)
!104 = !DILocation(line: 53, column: 5, scope: !97)
!105 = !DILocation(line: 54, column: 1, scope: !97)
