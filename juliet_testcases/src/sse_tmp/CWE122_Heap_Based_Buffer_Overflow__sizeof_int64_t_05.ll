; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !15
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05_bad() #0 !dbg !25 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  %0 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %0, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end2, !dbg !33

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !34
  %1 = bitcast i8* %call to i64*, !dbg !36
  store i64* %1, i64** %data, align 8, !dbg !37
  %2 = load i64*, i64** %data, align 8, !dbg !38
  %cmp = icmp eq i64* %2, null, !dbg !40
  br i1 %cmp, label %if.then1, label %if.end, !dbg !41

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data, align 8, !dbg !44
  store i64 2147483643, i64* %3, align 8, !dbg !45
  br label %if.end2, !dbg !46

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !47
  %5 = load i64, i64* %4, align 8, !dbg !48
  call void @printLongLongLine(i64 %5), !dbg !49
  %6 = load i64*, i64** %data, align 8, !dbg !50
  %7 = bitcast i64* %6 to i8*, !dbg !50
  call void @free(i8* %7) #5, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i64* null, i64** %data, align 8, !dbg !80
  %0 = load i32, i32* @staticFalse, align 4, !dbg !81
  %tobool = icmp ne i32 %0, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end2, !dbg !86

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !87
  %1 = bitcast i8* %call to i64*, !dbg !89
  store i64* %1, i64** %data, align 8, !dbg !90
  %2 = load i64*, i64** %data, align 8, !dbg !91
  %cmp = icmp eq i64* %2, null, !dbg !93
  br i1 %cmp, label %if.then1, label %if.end, !dbg !94

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %if.else
  %3 = load i64*, i64** %data, align 8, !dbg !97
  store i64 2147483643, i64* %3, align 8, !dbg !98
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load i64*, i64** %data, align 8, !dbg !99
  %5 = load i64, i64* %4, align 8, !dbg !100
  call void @printLongLongLine(i64 %5), !dbg !101
  %6 = load i64*, i64** %data, align 8, !dbg !102
  %7 = bitcast i64* %6 to i8*, !dbg !102
  call void @free(i8* %7) #5, !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i64* null, i64** %data, align 8, !dbg !108
  %0 = load i32, i32* @staticTrue, align 4, !dbg !109
  %tobool = icmp ne i32 %0, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.end2, !dbg !111

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !112
  %1 = bitcast i8* %call to i64*, !dbg !114
  store i64* %1, i64** %data, align 8, !dbg !115
  %2 = load i64*, i64** %data, align 8, !dbg !116
  %cmp = icmp eq i64* %2, null, !dbg !118
  br i1 %cmp, label %if.then1, label %if.end, !dbg !119

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data, align 8, !dbg !122
  store i64 2147483643, i64* %3, align 8, !dbg !123
  br label %if.end2, !dbg !124

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !125
  %5 = load i64, i64* %4, align 8, !dbg !126
  call void @printLongLongLine(i64 %5), !dbg !127
  %6 = load i64*, i64** %data, align 8, !dbg !128
  %7 = bitcast i64* %6 to i8*, !dbg !128
  call void @free(i8* %7) #5, !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !17, line: 23, type: !18, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12, !13}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 43, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !17, line: 24, type: !18, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05.c", directory: "/root/SSE-Assessment")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05_bad", scope: !17, file: !17, line: 28, type: !26, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !17, line: 30, type: !6)
!29 = !DILocation(line: 30, column: 15, scope: !25)
!30 = !DILocation(line: 32, column: 10, scope: !25)
!31 = !DILocation(line: 33, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !17, line: 33, column: 8)
!33 = !DILocation(line: 33, column: 8, scope: !25)
!34 = !DILocation(line: 37, column: 27, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !17, line: 34, column: 5)
!36 = !DILocation(line: 37, column: 16, scope: !35)
!37 = !DILocation(line: 37, column: 14, scope: !35)
!38 = !DILocation(line: 38, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !17, line: 38, column: 13)
!40 = !DILocation(line: 38, column: 18, scope: !39)
!41 = !DILocation(line: 38, column: 13, scope: !35)
!42 = !DILocation(line: 38, column: 28, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !17, line: 38, column: 27)
!44 = !DILocation(line: 39, column: 10, scope: !35)
!45 = !DILocation(line: 39, column: 15, scope: !35)
!46 = !DILocation(line: 40, column: 5, scope: !35)
!47 = !DILocation(line: 42, column: 24, scope: !25)
!48 = !DILocation(line: 42, column: 23, scope: !25)
!49 = !DILocation(line: 42, column: 5, scope: !25)
!50 = !DILocation(line: 43, column: 10, scope: !25)
!51 = !DILocation(line: 43, column: 5, scope: !25)
!52 = !DILocation(line: 44, column: 1, scope: !25)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_05_good", scope: !17, file: !17, line: 91, type: !26, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 93, column: 5, scope: !53)
!55 = !DILocation(line: 94, column: 5, scope: !53)
!56 = !DILocation(line: 95, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 107, type: !58, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!18, !18, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !17, line: 107, type: !18)
!64 = !DILocation(line: 107, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !17, line: 107, type: !60)
!66 = !DILocation(line: 107, column: 27, scope: !57)
!67 = !DILocation(line: 110, column: 22, scope: !57)
!68 = !DILocation(line: 110, column: 12, scope: !57)
!69 = !DILocation(line: 110, column: 5, scope: !57)
!70 = !DILocation(line: 112, column: 5, scope: !57)
!71 = !DILocation(line: 113, column: 5, scope: !57)
!72 = !DILocation(line: 114, column: 5, scope: !57)
!73 = !DILocation(line: 117, column: 5, scope: !57)
!74 = !DILocation(line: 118, column: 5, scope: !57)
!75 = !DILocation(line: 119, column: 5, scope: !57)
!76 = !DILocation(line: 121, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 51, type: !26, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !17, line: 53, type: !6)
!79 = !DILocation(line: 53, column: 15, scope: !77)
!80 = !DILocation(line: 55, column: 10, scope: !77)
!81 = !DILocation(line: 56, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !17, line: 56, column: 8)
!83 = !DILocation(line: 56, column: 8, scope: !77)
!84 = !DILocation(line: 59, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !17, line: 57, column: 5)
!86 = !DILocation(line: 60, column: 5, scope: !85)
!87 = !DILocation(line: 64, column: 27, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !17, line: 62, column: 5)
!89 = !DILocation(line: 64, column: 16, scope: !88)
!90 = !DILocation(line: 64, column: 14, scope: !88)
!91 = !DILocation(line: 65, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !17, line: 65, column: 13)
!93 = !DILocation(line: 65, column: 18, scope: !92)
!94 = !DILocation(line: 65, column: 13, scope: !88)
!95 = !DILocation(line: 65, column: 28, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !17, line: 65, column: 27)
!97 = !DILocation(line: 66, column: 10, scope: !88)
!98 = !DILocation(line: 66, column: 15, scope: !88)
!99 = !DILocation(line: 69, column: 24, scope: !77)
!100 = !DILocation(line: 69, column: 23, scope: !77)
!101 = !DILocation(line: 69, column: 5, scope: !77)
!102 = !DILocation(line: 70, column: 10, scope: !77)
!103 = !DILocation(line: 70, column: 5, scope: !77)
!104 = !DILocation(line: 71, column: 1, scope: !77)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 74, type: !26, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !17, line: 76, type: !6)
!107 = !DILocation(line: 76, column: 15, scope: !105)
!108 = !DILocation(line: 78, column: 10, scope: !105)
!109 = !DILocation(line: 79, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !17, line: 79, column: 8)
!111 = !DILocation(line: 79, column: 8, scope: !105)
!112 = !DILocation(line: 82, column: 27, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !17, line: 80, column: 5)
!114 = !DILocation(line: 82, column: 16, scope: !113)
!115 = !DILocation(line: 82, column: 14, scope: !113)
!116 = !DILocation(line: 83, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !17, line: 83, column: 13)
!118 = !DILocation(line: 83, column: 18, scope: !117)
!119 = !DILocation(line: 83, column: 13, scope: !113)
!120 = !DILocation(line: 83, column: 28, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 83, column: 27)
!122 = !DILocation(line: 84, column: 10, scope: !113)
!123 = !DILocation(line: 84, column: 15, scope: !113)
!124 = !DILocation(line: 85, column: 5, scope: !113)
!125 = !DILocation(line: 87, column: 24, scope: !105)
!126 = !DILocation(line: 87, column: 23, scope: !105)
!127 = !DILocation(line: 87, column: 5, scope: !105)
!128 = !DILocation(line: 88, column: 10, scope: !105)
!129 = !DILocation(line: 88, column: 5, scope: !105)
!130 = !DILocation(line: 89, column: 1, scope: !105)
