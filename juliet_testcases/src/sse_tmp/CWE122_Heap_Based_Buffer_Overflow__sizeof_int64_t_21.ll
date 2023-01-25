; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !15
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !19

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21_bad() #0 !dbg !27 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store i64* null, i64** %data, align 8, !dbg !32
  store i32 1, i32* @badStatic, align 4, !dbg !33
  %0 = load i64*, i64** %data, align 8, !dbg !34
  %call = call i64* @badSource(i64* %0), !dbg !35
  store i64* %call, i64** %data, align 8, !dbg !36
  %1 = load i64*, i64** %data, align 8, !dbg !37
  %2 = load i64, i64* %1, align 8, !dbg !38
  call void @printLongLongLine(i64 %2), !dbg !39
  %3 = load i64*, i64** %data, align 8, !dbg !40
  %4 = bitcast i64* %3 to i8*, !dbg !40
  call void @free(i8* %4) #5, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i64* @badSource(i64* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %0 = load i32, i32* @badStatic, align 4, !dbg !48
  %tobool = icmp ne i32 %0, 0, !dbg !48
  br i1 %tobool, label %if.then, label %if.end2, !dbg !50

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !51
  %1 = bitcast i8* %call to i64*, !dbg !53
  store i64* %1, i64** %data.addr, align 8, !dbg !54
  %2 = load i64*, i64** %data.addr, align 8, !dbg !55
  %cmp = icmp eq i64* %2, null, !dbg !57
  br i1 %cmp, label %if.then1, label %if.end, !dbg !58

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !59
  unreachable, !dbg !59

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data.addr, align 8, !dbg !61
  store i64 2147483643, i64* %3, align 8, !dbg !62
  br label %if.end2, !dbg !63

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i64*, i64** %data.addr, align 8, !dbg !64
  ret i64* %4, !dbg !65
}

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i64* null, i64** %data, align 8, !dbg !93
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !94
  %0 = load i64*, i64** %data, align 8, !dbg !95
  %call = call i64* @goodG2B1Source(i64* %0), !dbg !96
  store i64* %call, i64** %data, align 8, !dbg !97
  %1 = load i64*, i64** %data, align 8, !dbg !98
  %2 = load i64, i64* %1, align 8, !dbg !99
  call void @printLongLongLine(i64 %2), !dbg !100
  %3 = load i64*, i64** %data, align 8, !dbg !101
  %4 = bitcast i64* %3 to i8*, !dbg !101
  call void @free(i8* %4) #5, !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal i64* @goodG2B1Source(i64* %data) #0 !dbg !104 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !107
  %tobool = icmp ne i32 %0, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end2, !dbg !112

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !113
  %1 = bitcast i8* %call to i64*, !dbg !115
  store i64* %1, i64** %data.addr, align 8, !dbg !116
  %2 = load i64*, i64** %data.addr, align 8, !dbg !117
  %cmp = icmp eq i64* %2, null, !dbg !119
  br i1 %cmp, label %if.then1, label %if.end, !dbg !120

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %if.else
  %3 = load i64*, i64** %data.addr, align 8, !dbg !123
  store i64 2147483643, i64* %3, align 8, !dbg !124
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load i64*, i64** %data.addr, align 8, !dbg !125
  ret i64* %4, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !127 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !128, metadata !DIExpression()), !dbg !129
  store i64* null, i64** %data, align 8, !dbg !130
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !131
  %0 = load i64*, i64** %data, align 8, !dbg !132
  %call = call i64* @goodG2B2Source(i64* %0), !dbg !133
  store i64* %call, i64** %data, align 8, !dbg !134
  %1 = load i64*, i64** %data, align 8, !dbg !135
  %2 = load i64, i64* %1, align 8, !dbg !136
  call void @printLongLongLine(i64 %2), !dbg !137
  %3 = load i64*, i64** %data, align 8, !dbg !138
  %4 = bitcast i64* %3 to i8*, !dbg !138
  call void @free(i8* %4) #5, !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal i64* @goodG2B2Source(i64* %data) #0 !dbg !141 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !142, metadata !DIExpression()), !dbg !143
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !144
  %tobool = icmp ne i32 %0, 0, !dbg !144
  br i1 %tobool, label %if.then, label %if.end2, !dbg !146

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !147
  %1 = bitcast i8* %call to i64*, !dbg !149
  store i64* %1, i64** %data.addr, align 8, !dbg !150
  %2 = load i64*, i64** %data.addr, align 8, !dbg !151
  %cmp = icmp eq i64* %2, null, !dbg !153
  br i1 %cmp, label %if.then1, label %if.end, !dbg !154

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !155
  unreachable, !dbg !155

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data.addr, align 8, !dbg !157
  store i64 2147483643, i64* %3, align 8, !dbg !158
  br label %if.end2, !dbg !159

if.end2:                                          ; preds = %if.end, %entry
  %4 = load i64*, i64** %data.addr, align 8, !dbg !160
  ret i64* %4, !dbg !161
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !17, line: 22, type: !18, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !13}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !{!0, !15, !19}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !17, line: 54, type: !18, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !17, line: 55, type: !18, isLocal: true, isDefinition: true)
!21 = !{i32 7, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{i32 7, !"uwtable", i32 1}
!25 = !{i32 7, !"frame-pointer", i32 2}
!26 = !{!"clang version 13.0.0"}
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21_bad", scope: !17, file: !17, line: 37, type: !28, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocalVariable(name: "data", scope: !27, file: !17, line: 39, type: !7)
!31 = !DILocation(line: 39, column: 15, scope: !27)
!32 = !DILocation(line: 41, column: 10, scope: !27)
!33 = !DILocation(line: 42, column: 15, scope: !27)
!34 = !DILocation(line: 43, column: 22, scope: !27)
!35 = !DILocation(line: 43, column: 12, scope: !27)
!36 = !DILocation(line: 43, column: 10, scope: !27)
!37 = !DILocation(line: 45, column: 24, scope: !27)
!38 = !DILocation(line: 45, column: 23, scope: !27)
!39 = !DILocation(line: 45, column: 5, scope: !27)
!40 = !DILocation(line: 46, column: 10, scope: !27)
!41 = !DILocation(line: 46, column: 5, scope: !27)
!42 = !DILocation(line: 47, column: 1, scope: !27)
!43 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 24, type: !44, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!7, !7}
!46 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !17, line: 24, type: !7)
!47 = !DILocation(line: 24, column: 38, scope: !43)
!48 = !DILocation(line: 26, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !17, line: 26, column: 8)
!50 = !DILocation(line: 26, column: 8, scope: !43)
!51 = !DILocation(line: 30, column: 27, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !17, line: 27, column: 5)
!53 = !DILocation(line: 30, column: 16, scope: !52)
!54 = !DILocation(line: 30, column: 14, scope: !52)
!55 = !DILocation(line: 31, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !17, line: 31, column: 13)
!57 = !DILocation(line: 31, column: 18, scope: !56)
!58 = !DILocation(line: 31, column: 13, scope: !52)
!59 = !DILocation(line: 31, column: 28, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !17, line: 31, column: 27)
!61 = !DILocation(line: 32, column: 10, scope: !52)
!62 = !DILocation(line: 32, column: 15, scope: !52)
!63 = !DILocation(line: 33, column: 5, scope: !52)
!64 = !DILocation(line: 34, column: 12, scope: !43)
!65 = !DILocation(line: 34, column: 5, scope: !43)
!66 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_int64_t_21_good", scope: !17, file: !17, line: 112, type: !28, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 114, column: 5, scope: !66)
!68 = !DILocation(line: 115, column: 5, scope: !66)
!69 = !DILocation(line: 116, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 128, type: !71, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!18, !18, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !17, line: 128, type: !18)
!77 = !DILocation(line: 128, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !17, line: 128, type: !73)
!79 = !DILocation(line: 128, column: 27, scope: !70)
!80 = !DILocation(line: 131, column: 22, scope: !70)
!81 = !DILocation(line: 131, column: 12, scope: !70)
!82 = !DILocation(line: 131, column: 5, scope: !70)
!83 = !DILocation(line: 133, column: 5, scope: !70)
!84 = !DILocation(line: 134, column: 5, scope: !70)
!85 = !DILocation(line: 135, column: 5, scope: !70)
!86 = !DILocation(line: 138, column: 5, scope: !70)
!87 = !DILocation(line: 139, column: 5, scope: !70)
!88 = !DILocation(line: 140, column: 5, scope: !70)
!89 = !DILocation(line: 142, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 75, type: !28, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "data", scope: !90, file: !17, line: 77, type: !7)
!92 = !DILocation(line: 77, column: 15, scope: !90)
!93 = !DILocation(line: 79, column: 10, scope: !90)
!94 = !DILocation(line: 80, column: 20, scope: !90)
!95 = !DILocation(line: 81, column: 27, scope: !90)
!96 = !DILocation(line: 81, column: 12, scope: !90)
!97 = !DILocation(line: 81, column: 10, scope: !90)
!98 = !DILocation(line: 83, column: 24, scope: !90)
!99 = !DILocation(line: 83, column: 23, scope: !90)
!100 = !DILocation(line: 83, column: 5, scope: !90)
!101 = !DILocation(line: 84, column: 10, scope: !90)
!102 = !DILocation(line: 84, column: 5, scope: !90)
!103 = !DILocation(line: 85, column: 1, scope: !90)
!104 = distinct !DISubprogram(name: "goodG2B1Source", scope: !17, file: !17, line: 58, type: !44, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", arg: 1, scope: !104, file: !17, line: 58, type: !7)
!106 = !DILocation(line: 58, column: 43, scope: !104)
!107 = !DILocation(line: 60, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !17, line: 60, column: 8)
!109 = !DILocation(line: 60, column: 8, scope: !104)
!110 = !DILocation(line: 63, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !17, line: 61, column: 5)
!112 = !DILocation(line: 64, column: 5, scope: !111)
!113 = !DILocation(line: 68, column: 27, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !17, line: 66, column: 5)
!115 = !DILocation(line: 68, column: 16, scope: !114)
!116 = !DILocation(line: 68, column: 14, scope: !114)
!117 = !DILocation(line: 69, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !17, line: 69, column: 13)
!119 = !DILocation(line: 69, column: 18, scope: !118)
!120 = !DILocation(line: 69, column: 13, scope: !114)
!121 = !DILocation(line: 69, column: 28, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !17, line: 69, column: 27)
!123 = !DILocation(line: 70, column: 10, scope: !114)
!124 = !DILocation(line: 70, column: 15, scope: !114)
!125 = !DILocation(line: 72, column: 12, scope: !104)
!126 = !DILocation(line: 72, column: 5, scope: !104)
!127 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 100, type: !28, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "data", scope: !127, file: !17, line: 102, type: !7)
!129 = !DILocation(line: 102, column: 15, scope: !127)
!130 = !DILocation(line: 104, column: 10, scope: !127)
!131 = !DILocation(line: 105, column: 20, scope: !127)
!132 = !DILocation(line: 106, column: 27, scope: !127)
!133 = !DILocation(line: 106, column: 12, scope: !127)
!134 = !DILocation(line: 106, column: 10, scope: !127)
!135 = !DILocation(line: 108, column: 24, scope: !127)
!136 = !DILocation(line: 108, column: 23, scope: !127)
!137 = !DILocation(line: 108, column: 5, scope: !127)
!138 = !DILocation(line: 109, column: 10, scope: !127)
!139 = !DILocation(line: 109, column: 5, scope: !127)
!140 = !DILocation(line: 110, column: 1, scope: !127)
!141 = distinct !DISubprogram(name: "goodG2B2Source", scope: !17, file: !17, line: 88, type: !44, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!142 = !DILocalVariable(name: "data", arg: 1, scope: !141, file: !17, line: 88, type: !7)
!143 = !DILocation(line: 88, column: 43, scope: !141)
!144 = !DILocation(line: 90, column: 8, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !17, line: 90, column: 8)
!146 = !DILocation(line: 90, column: 8, scope: !141)
!147 = !DILocation(line: 93, column: 27, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !17, line: 91, column: 5)
!149 = !DILocation(line: 93, column: 16, scope: !148)
!150 = !DILocation(line: 93, column: 14, scope: !148)
!151 = !DILocation(line: 94, column: 13, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !17, line: 94, column: 13)
!153 = !DILocation(line: 94, column: 18, scope: !152)
!154 = !DILocation(line: 94, column: 13, scope: !148)
!155 = !DILocation(line: 94, column: 28, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !17, line: 94, column: 27)
!157 = !DILocation(line: 95, column: 10, scope: !148)
!158 = !DILocation(line: 95, column: 15, scope: !148)
!159 = !DILocation(line: 96, column: 5, scope: !148)
!160 = !DILocation(line: 97, column: 12, scope: !141)
!161 = !DILocation(line: 97, column: 5, scope: !141)
