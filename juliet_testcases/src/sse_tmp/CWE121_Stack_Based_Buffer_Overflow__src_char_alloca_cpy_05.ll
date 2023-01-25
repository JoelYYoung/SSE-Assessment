; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %0, i8** %dataBuffer, align 8, !dbg !26
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  store i8* %1, i8** %data, align 8, !dbg !29
  %2 = load i32, i32* @staticTrue, align 4, !dbg !30
  %tobool = icmp ne i32 %2, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !44
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %call = call i8* @strcpy(i8* %arraydecay, i8* %6) #5, !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %7), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_05_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_05_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_05_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 100, align 16, !dbg !78
  store i8* %0, i8** %dataBuffer, align 8, !dbg !77
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !79
  store i8* %1, i8** %data, align 8, !dbg !80
  %2 = load i32, i32* @staticFalse, align 4, !dbg !81
  %tobool = icmp ne i32 %2, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !95
  %6 = load i8*, i8** %data, align 8, !dbg !96
  %call = call i8* @strcpy(i8* %arraydecay, i8* %6) #5, !dbg !97
  %7 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %7), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 100, align 16, !dbg !106
  store i8* %0, i8** %dataBuffer, align 8, !dbg !105
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  store i8* %1, i8** %data, align 8, !dbg !108
  %2 = load i32, i32* @staticTrue, align 4, !dbg !109
  %tobool = icmp ne i32 %2, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !114
  %4 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  br label %if.end, !dbg !117

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !118, metadata !DIExpression()), !dbg !120
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !120
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !121
  %6 = load i8*, i8** %data, align 8, !dbg !122
  %call = call i8* @strcpy(i8* %arraydecay, i8* %6) #5, !dbg !123
  %7 = load i8*, i8** %data, align 8, !dbg !124
  call void @printLine(i8* %7), !dbg !125
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !12, line: 33, type: !6)
!26 = !DILocation(line: 33, column: 12, scope: !20)
!27 = !DILocation(line: 33, column: 33, scope: !20)
!28 = !DILocation(line: 34, column: 12, scope: !20)
!29 = !DILocation(line: 34, column: 10, scope: !20)
!30 = !DILocation(line: 35, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !12, line: 35, column: 8)
!32 = !DILocation(line: 35, column: 8, scope: !20)
!33 = !DILocation(line: 38, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 36, column: 5)
!35 = !DILocation(line: 38, column: 9, scope: !34)
!36 = !DILocation(line: 39, column: 9, scope: !34)
!37 = !DILocation(line: 39, column: 21, scope: !34)
!38 = !DILocation(line: 40, column: 5, scope: !34)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !12, line: 42, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !12, line: 41, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 42, column: 14, scope: !40)
!45 = !DILocation(line: 44, column: 16, scope: !40)
!46 = !DILocation(line: 44, column: 22, scope: !40)
!47 = !DILocation(line: 44, column: 9, scope: !40)
!48 = !DILocation(line: 45, column: 19, scope: !40)
!49 = !DILocation(line: 45, column: 9, scope: !40)
!50 = !DILocation(line: 47, column: 1, scope: !20)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_05_good", scope: !12, file: !12, line: 98, type: !21, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 100, column: 5, scope: !51)
!53 = !DILocation(line: 101, column: 5, scope: !51)
!54 = !DILocation(line: 102, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 114, type: !56, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!13, !13, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 114, type: !13)
!60 = !DILocation(line: 114, column: 14, scope: !55)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 114, type: !58)
!62 = !DILocation(line: 114, column: 27, scope: !55)
!63 = !DILocation(line: 117, column: 22, scope: !55)
!64 = !DILocation(line: 117, column: 12, scope: !55)
!65 = !DILocation(line: 117, column: 5, scope: !55)
!66 = !DILocation(line: 119, column: 5, scope: !55)
!67 = !DILocation(line: 120, column: 5, scope: !55)
!68 = !DILocation(line: 121, column: 5, scope: !55)
!69 = !DILocation(line: 124, column: 5, scope: !55)
!70 = !DILocation(line: 125, column: 5, scope: !55)
!71 = !DILocation(line: 126, column: 5, scope: !55)
!72 = !DILocation(line: 128, column: 5, scope: !55)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 56, type: !6)
!75 = !DILocation(line: 56, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !12, line: 57, type: !6)
!77 = !DILocation(line: 57, column: 12, scope: !73)
!78 = !DILocation(line: 57, column: 33, scope: !73)
!79 = !DILocation(line: 58, column: 12, scope: !73)
!80 = !DILocation(line: 58, column: 10, scope: !73)
!81 = !DILocation(line: 59, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !73, file: !12, line: 59, column: 8)
!83 = !DILocation(line: 59, column: 8, scope: !73)
!84 = !DILocation(line: 62, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 60, column: 5)
!86 = !DILocation(line: 63, column: 5, scope: !85)
!87 = !DILocation(line: 67, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !12, line: 65, column: 5)
!89 = !DILocation(line: 67, column: 9, scope: !88)
!90 = !DILocation(line: 68, column: 9, scope: !88)
!91 = !DILocation(line: 68, column: 20, scope: !88)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !12, line: 71, type: !41)
!93 = distinct !DILexicalBlock(scope: !73, file: !12, line: 70, column: 5)
!94 = !DILocation(line: 71, column: 14, scope: !93)
!95 = !DILocation(line: 73, column: 16, scope: !93)
!96 = !DILocation(line: 73, column: 22, scope: !93)
!97 = !DILocation(line: 73, column: 9, scope: !93)
!98 = !DILocation(line: 74, column: 19, scope: !93)
!99 = !DILocation(line: 74, column: 9, scope: !93)
!100 = !DILocation(line: 76, column: 1, scope: !73)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !21, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 81, type: !6)
!103 = !DILocation(line: 81, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !12, line: 82, type: !6)
!105 = !DILocation(line: 82, column: 12, scope: !101)
!106 = !DILocation(line: 82, column: 33, scope: !101)
!107 = !DILocation(line: 83, column: 12, scope: !101)
!108 = !DILocation(line: 83, column: 10, scope: !101)
!109 = !DILocation(line: 84, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !101, file: !12, line: 84, column: 8)
!111 = !DILocation(line: 84, column: 8, scope: !101)
!112 = !DILocation(line: 87, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 85, column: 5)
!114 = !DILocation(line: 87, column: 9, scope: !113)
!115 = !DILocation(line: 88, column: 9, scope: !113)
!116 = !DILocation(line: 88, column: 20, scope: !113)
!117 = !DILocation(line: 89, column: 5, scope: !113)
!118 = !DILocalVariable(name: "dest", scope: !119, file: !12, line: 91, type: !41)
!119 = distinct !DILexicalBlock(scope: !101, file: !12, line: 90, column: 5)
!120 = !DILocation(line: 91, column: 14, scope: !119)
!121 = !DILocation(line: 93, column: 16, scope: !119)
!122 = !DILocation(line: 93, column: 22, scope: !119)
!123 = !DILocation(line: 93, column: 9, scope: !119)
!124 = !DILocation(line: 94, column: 19, scope: !119)
!125 = !DILocation(line: 94, column: 9, scope: !119)
!126 = !DILocation(line: 96, column: 1, scope: !101)
